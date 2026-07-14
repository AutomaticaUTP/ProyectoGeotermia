# -*- coding: utf-8 -*-
"""
Analisis de sensibilidad para estimar la temperatura del fluido en cabeza de pozo
usando el modelo termico vertical desde BHT de fondo hacia superficie.

Escenario 3:
- Las variables reales del pozo se mantienen fijas.
- t_years_eval tambien se mantiene fijo.
- El analisis de Sobol y el tornado plot varian solo parametros asumidos.

Requisitos:
    pip install numpy pandas matplotlib SALib

Entradas esperadas en el CSV, con nombres principales:
    POZO
    LATITUD
    LONGITUD
    BHT (°C)
    Potencial_Agua_promd (kg/s)
    PROFUNDIDAD_BHT (km)
    Grad_Geoterm

Tambien se aceptan algunos alias:
    BHT___C_              -> BHT (°C)
    PROFUNDIDAD_m         -> PROFUNDIDAD_BHT (km), dividiendo entre 1000
    GEOTHERMAL_GRAD       -> Grad_Geoterm
"""

import os
from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

try:
    from SALib.sample import sobol as sobol_sample
    from SALib.analyze import sobol
except ImportError as exc:
    raise ImportError(
        "No se encontro SALib. Instala con: pip install SALib"
    ) from exc


# =============================================================================
# 1. CONFIGURACION GENERAL
# =============================================================================

CSV_ENTRADA = "datos_finales_BHT.csv"
OUTPUT_DIR = Path("resultados_sensibilidad_sobol")

# Numero base de muestras Sobol. Debe ser potencia de 2: 128, 256, 512, 1024...
# Con D variables asumidas y calc_second_order=False, evaluaciones aprox = N * (D + 2)
N_SOBOL = 512
CALC_SECOND_ORDER = False

# Si hay muchos pozos, para pruebas puedes limitar temporalmente:
# MAX_POZOS = 20
MAX_POZOS = None

# Configuracion del modelo termico
NPTS = 501
UNIDADES_GRADIENTE = "auto"
USAR_BHT_PARA_TSURFACE = True
T_SURFACE_DEFAULT = 20.0
COLUMNA_CAUDAL = "Potencial_Agua_promd (kg/s)"

# Este queda fijo en el escenario 3.
T_YEARS_EVAL_FIJO = 1.0

# Ejecutar Sobol por pozo es mas costoso. Activalo si lo necesitas.
RUN_SOBOL_POR_POZO = False
MAX_POZOS_SOBOL_POR_POZO = None

SEC_IN_YEAR = 365 * 24 * 3600.0


# =============================================================================
# 2. COLUMNAS REALES FIJAS
# =============================================================================

REAL_FIXED_COLS = [
    "POZO",
    "LATITUD",
    "LONGITUD",
    "BHT (°C)",
    COLUMNA_CAUDAL,
    "PROFUNDIDAD_BHT (km)",
    "Grad_Geoterm",
]


# =============================================================================
# 3. PARAMETROS BASE Y RANGOS DE VARIABLES ASUMIDAS
# =============================================================================

# Valores base usados en tu modelo original o cercanos a tu configuracion.
# t_years_eval queda fijo y NO aparece en ASSUMED_BOUNDS.
BASE_PARAMS = {
    # Roca / formacion
    "krock": 3.0,          # W/m/K
    "rhorock": 2663.0,    # kg/m3
    "cprock": 1112.0,     # J/kg/K

    # Geometria
    "r": 0.073025,        # m

    # Fluido / mezcla
    "rho_w": 1000.0,      # kg/m3
    "rho_o": 850.0,       # kg/m3
    "cp_w": 4180.0,       # J/kg/K
    "cp_o": 2200.0,       # J/kg/K
    "phi_w": 0.9,         # fraccion volumetrica de agua

    # Factor empirico del modelo
    "Kfac": 1.4986,

    # Tiempo fijo del escenario 3
    "t_years_eval": T_YEARS_EVAL_FIJO,
}

# Variables asumidas para Sobol y tornado.
# Ajusta estos intervalos con literatura, criterio fisico o escenarios del trabajo.
# Nota: t_years_eval NO esta aqui porque se dejo fijo.
ASSUMED_BOUNDS = {
    # Propiedades termicas de roca
    "krock": [2.0, 4.0],          # W/m/K
    "rhorock": [2400.0, 2900.0],  # kg/m3
    "cprock": [800.0, 1200.0],    # J/kg/K

    # Radio efectivo del pozo
    "r": [0.05, 0.12],            # m

    # Propiedades de fluido para cp de mezcla
    "rho_w": [950.0, 1050.0],     # kg/m3
    "rho_o": [750.0, 900.0],      # kg/m3
    "cp_w": [3900.0, 4300.0],     # J/kg/K
    "cp_o": [1800.0, 2600.0],     # J/kg/K
    "phi_w": [0.70, 1.00],        # fraccion volumetrica de agua

    # Factor empirico
    "Kfac": [1.0, 2.0],
}


# =============================================================================
# 4. FUNCIONES DEL MODELO TERMICO
# =============================================================================

def formation_resistance_per_length(
    t_seconds,
    r,
    krock,
    rhorock,
    cprock,
    Kfac=1.4986,
):
    """Calcula resistencia termica transitoria de formacion por metro [K m/W]."""

    if r <= 0:
        raise ValueError("r debe ser > 0.")
    if krock <= 0:
        raise ValueError("krock debe ser > 0.")
    if rhorock <= 0:
        raise ValueError("rhorock debe ser > 0.")
    if cprock <= 0:
        raise ValueError("cprock debe ser > 0.")

    alpha = krock / (rhorock * cprock)
    t_seconds = max(float(t_seconds), 1.0)

    arg = Kfac * np.sqrt(alpha * t_seconds) / r
    arg = max(float(arg), 1.000001)

    return float(np.log(arg) / (2.0 * np.pi * krock))


def solve_well_profile_at_time(
    D,
    npts,
    direction,
    Tin,
    T_surface,
    geothermal_gradient,
    t_years,
    krock,
    rhorock,
    cprock,
    r,
    mrate_kg_per_s,
    cpfluid,
    Kfac=1.4986,
):
    """Resuelve T(z) y devuelve Tout para flujo up o down."""

    if D <= 0:
        raise ValueError("D debe ser > 0.")
    if int(npts) < 2:
        raise ValueError("npts debe ser >= 2.")
    if t_years <= 0:
        raise ValueError("t_years debe ser > 0.")
    if mrate_kg_per_s <= 0:
        raise ValueError("mrate_kg_per_s debe ser > 0.")
    if cpfluid <= 0:
        raise ValueError("cpfluid debe ser > 0.")

    t_seconds = float(t_years) * SEC_IN_YEAR

    mdot = float(mrate_kg_per_s)
    mcp = mdot * float(cpfluid)

    Rf_prime = formation_resistance_per_length(
        t_seconds=t_seconds,
        r=r,
        krock=krock,
        rhorock=rhorock,
        cprock=cprock,
        Kfac=Kfac,
    )

    UA_prime = 1.0 / Rf_prime
    a = UA_prime / mcp

    z = np.linspace(0.0, float(D), int(npts))

    G = float(geothermal_gradient)
    Tf = float(T_surface) + G * z

    direction = direction.lower().strip()

    if direction == "down":
        s = z
        Tf_s = float(T_surface) + G * s

        Tfluid = (
            Tf_s
            - (G / a)
            + (float(Tin) - float(T_surface) + (G / a)) * np.exp(-a * s)
        )

        Tout = float(Tfluid[-1])

    elif direction == "up":
        s = float(D) - z

        Tf_bottom = float(T_surface) + G * float(D)
        Tf_s = Tf_bottom - G * s

        Tfluid = (
            Tf_s
            + (G / a)
            + (float(Tin) - Tf_bottom - (G / a)) * np.exp(-a * s)
        )

        # En modo up, z=0 corresponde a superficie/cabeza de pozo.
        Tout = float(Tfluid[0])

    else:
        raise ValueError("direction debe ser 'down' o 'up'.")

    return z, Tfluid, Tout, Tf, a, Rf_prime


def convertir_gradiente_a_C_por_m(valor, unidades="auto"):
    """Convierte gradiente geotermico a °C/m."""

    g = float(valor)
    unidades = str(unidades).strip().lower()

    if unidades in {"c/m", "°c/m", "c_por_m", "c_per_m"}:
        return g

    if unidades in {"c/km", "°c/km", "c_por_km", "c_per_km"}:
        return g / 1000.0

    if unidades == "auto":
        if abs(g) > 1.0:
            return g / 1000.0
        return g

    raise ValueError("unidades_gradiente debe ser 'auto', 'C/m' o 'C/km'.")


def cp_mezcla_agua_petroleo(rho_w, rho_o, cp_w, cp_o, phi_w):
    """Calcula cp efectivo de mezcla agua-petroleo usando fraccion masica."""

    if not (0.0 <= phi_w <= 1.0):
        raise ValueError("phi_w debe estar entre 0 y 1.")
    if rho_w <= 0 or rho_o <= 0:
        raise ValueError("rho_w y rho_o deben ser > 0.")
    if cp_w <= 0 or cp_o <= 0:
        raise ValueError("cp_w y cp_o deben ser > 0.")

    w_w_mass = (phi_w * rho_w) / (phi_w * rho_w + (1.0 - phi_w) * rho_o)
    cp_mix = w_w_mass * cp_w + (1.0 - w_w_mass) * cp_o

    return float(cp_mix)


# =============================================================================
# 5. CARGA Y VALIDACION DEL CSV
# =============================================================================

def estandarizar_columnas(df):
    """
    Permite usar el script aunque el CSV tenga algunos nombres antiguos.
    No elimina las columnas originales; crea las columnas canonicas si faltan.
    """

    data = df.copy()

    if "BHT (°C)" not in data.columns and "BHT___C_" in data.columns:
        data["BHT (°C)"] = data["BHT___C_"]

    if "Grad_Geoterm" not in data.columns and "GEOTHERMAL_GRAD" in data.columns:
        data["Grad_Geoterm"] = data["GEOTHERMAL_GRAD"]

    if "PROFUNDIDAD_BHT (km)" not in data.columns and "PROFUNDIDAD_m" in data.columns:
        data["PROFUNDIDAD_BHT (km)"] = pd.to_numeric(
            data["PROFUNDIDAD_m"], errors="coerce"
        ) / 1000.0

    return data


def cargar_datos(csv_entrada, max_pozos=None):
    df = pd.read_csv(csv_entrada)
    df = estandarizar_columnas(df)

    faltantes = [col for col in REAL_FIXED_COLS if col not in df.columns]
    if faltantes:
        raise ValueError(f"Faltan columnas requeridas en el CSV: {faltantes}")

    numeric_cols = [
        "LATITUD",
        "LONGITUD",
        "BHT (°C)",
        COLUMNA_CAUDAL,
        "PROFUNDIDAD_BHT (km)",
        "Grad_Geoterm",
    ]

    for col in numeric_cols:
        df[col] = pd.to_numeric(df[col], errors="coerce")

    invalidas = df[REAL_FIXED_COLS].isna().any(axis=1)
    if invalidas.any():
        pozos_invalidos = df.loc[invalidas, "POZO"].astype(str).head(20).tolist()
        raise ValueError(
            "Hay filas con datos faltantes o no numericos en columnas requeridas. "
            f"Primeros pozos afectados: {pozos_invalidos}"
        )

    if (df["PROFUNDIDAD_BHT (km)"] <= 0).any():
        raise ValueError("Hay profundidades <= 0 en PROFUNDIDAD_BHT (km).")

    if (df[COLUMNA_CAUDAL] <= 0).any():
        raise ValueError(f"Hay caudales <= 0 en {COLUMNA_CAUDAL}.")

    if max_pozos is not None:
        df = df.head(int(max_pozos)).copy()

    return df.reset_index(drop=True)


# =============================================================================
# 6. EVALUACION DE TEMPERATURA EN CABEZA
# =============================================================================

def calcular_temp_cabeza_pozo(row, params):
    """
    Calcula temperatura del fluido en cabeza para un pozo.
    Las variables reales vienen de row y los parametros asumidos de params.
    """

    Tin_bht = float(row["BHT (°C)"])
    mrate_pozo_kg_per_s = float(row[COLUMNA_CAUDAL])
    D = float(row["PROFUNDIDAD_BHT (km)"]) * 1000.0

    G = convertir_gradiente_a_C_por_m(
        row["Grad_Geoterm"],
        unidades=UNIDADES_GRADIENTE,
    )

    if USAR_BHT_PARA_TSURFACE:
        # Ancla la formacion para que Tf(D) = BHT.
        T_surface = Tin_bht - G * D
    else:
        T_surface = float(T_SURFACE_DEFAULT)

    cp_mix = cp_mezcla_agua_petroleo(
        rho_w=params["rho_w"],
        rho_o=params["rho_o"],
        cp_w=params["cp_w"],
        cp_o=params["cp_o"],
        phi_w=params["phi_w"],
    )

    z, Tfluid, Tout, Tf, a, Rf_prime = solve_well_profile_at_time(
        D=D,
        npts=NPTS,
        direction="up",
        Tin=Tin_bht,
        T_surface=T_surface,
        geothermal_gradient=G,
        t_years=params["t_years_eval"],
        krock=params["krock"],
        rhorock=params["rhorock"],
        cprock=params["cprock"],
        r=params["r"],
        mrate_kg_per_s=mrate_pozo_kg_per_s,
        cpfluid=cp_mix,
        Kfac=params["Kfac"],
    )

    return {
        "temperatura_fluido_superficie_C": float(Tout),
        "temperatura_formacion_superficie_C": float(T_surface),
        "Tin_fondo_BHT_C": Tin_bht,
        "PROFUNDIDAD_TOTAL_m": D,
        "GEOTHERMAL_GRAD_C_m": G,
        "mrate_kg_per_s": mrate_pozo_kg_per_s,
        "cp_fluido_J_kgK": cp_mix,
        "a_1_m": float(a),
        "Rf_prime_K_m_W": float(Rf_prime),
    }


def evaluar_todos_los_pozos(df, params):
    registros = []

    for _, row in df.iterrows():
        out = calcular_temp_cabeza_pozo(row, params)

        registro = {
            "POZO": row["POZO"],
            "LATITUD": row["LATITUD"],
            "LONGITUD": row["LONGITUD"],
        }
        registro.update(out)
        registros.append(registro)

    return pd.DataFrame(registros)


def agregar_temperaturas(temps, aggregation="mean"):
    temps = np.asarray(temps, dtype=float)

    if aggregation == "mean":
        return float(np.mean(temps))
    if aggregation == "median":
        return float(np.median(temps))
    if aggregation == "max":
        return float(np.max(temps))
    if aggregation == "min":
        return float(np.min(temps))
    if aggregation == "std":
        return float(np.std(temps))

    raise ValueError("aggregation debe ser: mean, median, max, min o std.")


# =============================================================================
# 7. SOBOL GLOBAL
# =============================================================================

def crear_problem_sobol(assumed_bounds):
    return {
        "num_vars": len(assumed_bounds),
        "names": list(assumed_bounds.keys()),
        "bounds": list(assumed_bounds.values()),
    }


def evaluar_modelo_sobol_global(df, param_values, problem, aggregation="mean"):
    """
    Para cada combinacion de parametros asumidos, calcula la temperatura en cabeza
    de todos los pozos y devuelve una salida agregada.
    """

    Y = []
    names = problem["names"]

    for i, values in enumerate(param_values, start=1):
        params = BASE_PARAMS.copy()
        params.update(dict(zip(names, values)))
        params["t_years_eval"] = T_YEARS_EVAL_FIJO  # se fuerza fijo

        df_eval = evaluar_todos_los_pozos(df, params)
        y = agregar_temperaturas(
            df_eval["temperatura_fluido_superficie_C"].values,
            aggregation=aggregation,
        )
        Y.append(y)

        if i % 1000 == 0:
            print(f"Evaluaciones Sobol procesadas: {i}/{len(param_values)}")

    return np.array(Y, dtype=float)


def correr_sobol_global(df, aggregation="mean"):
    problem = crear_problem_sobol(ASSUMED_BOUNDS)

    param_values = sobol_sample.sample(
        problem,
        N_SOBOL,
        calc_second_order=CALC_SECOND_ORDER,
    )

    print("Variables asumidas Sobol:", problem["names"])
    print("Matriz de muestras Sobol:", param_values.shape)

    Y_sobol = evaluar_modelo_sobol_global(
        df=df,
        param_values=param_values,
        problem=problem,
        aggregation=aggregation,
    )

    Si = sobol.analyze(
        problem,
        Y_sobol,
        calc_second_order=CALC_SECOND_ORDER,
        print_to_console=False,
    )

    sobol_df = pd.DataFrame({
        "variable": problem["names"],
        "S1": Si["S1"],
        "S1_conf": Si["S1_conf"],
        "ST": Si["ST"],
        "ST_conf": Si["ST_conf"],
    })

    sobol_df["interaccion_aprox_ST_menos_S1"] = sobol_df["ST"] - sobol_df["S1"]
    sobol_df = sobol_df.sort_values("ST", ascending=False).reset_index(drop=True)

    y_df = pd.DataFrame({
        f"Y_sobol_{aggregation}_temperatura_cabeza_C": Y_sobol
    })

    return sobol_df, y_df


# =============================================================================
# 8. TORNADO GLOBAL
# =============================================================================

def tornado_analysis_global(df, assumed_bounds, aggregation="mean"):
    """
    Cambia una variable asumida a la vez entre valor bajo y alto.
    Las demas variables quedan en BASE_PARAMS.
    """

    def evaluar_con_params(params):
        params = params.copy()
        params["t_years_eval"] = T_YEARS_EVAL_FIJO

        df_eval = evaluar_todos_los_pozos(df, params)
        return agregar_temperaturas(
            df_eval["temperatura_fluido_superficie_C"].values,
            aggregation=aggregation,
        )

    base_params = BASE_PARAMS.copy()
    base_params["t_years_eval"] = T_YEARS_EVAL_FIJO
    y_base = evaluar_con_params(base_params)

    rows = []

    for name, bounds in assumed_bounds.items():
        low, high = bounds

        params_low = base_params.copy()
        params_high = base_params.copy()

        params_low[name] = low
        params_high[name] = high

        y_low = evaluar_con_params(params_low)
        y_high = evaluar_con_params(params_high)

        rows.append({
            "variable": name,
            "base": y_base,
            "low_value": low,
            "high_value": high,
            "y_low": y_low,
            "y_high": y_high,
            "delta_low": y_low - y_base,
            "delta_high": y_high - y_base,
            "range_effect_abs": abs(y_high - y_low),
        })

    tornado_df = pd.DataFrame(rows)
    tornado_df = tornado_df.sort_values("range_effect_abs", ascending=False).reset_index(drop=True)

    return tornado_df


# =============================================================================
# 9. SOBOL POR POZO OPCIONAL
# =============================================================================

def correr_sobol_por_pozo(df):
    problem = crear_problem_sobol(ASSUMED_BOUNDS)

    param_values = sobol_sample.sample(
        problem,
        N_SOBOL,
        calc_second_order=CALC_SECOND_ORDER,
    )

    if MAX_POZOS_SOBOL_POR_POZO is not None:
        df_iter = df.head(int(MAX_POZOS_SOBOL_POR_POZO)).copy()
    else:
        df_iter = df.copy()

    resultados = []
    names = problem["names"]

    for j, (_, row) in enumerate(df_iter.iterrows(), start=1):
        Y = []

        for values in param_values:
            params = BASE_PARAMS.copy()
            params.update(dict(zip(names, values)))
            params["t_years_eval"] = T_YEARS_EVAL_FIJO

            out = calcular_temp_cabeza_pozo(row, params)
            Y.append(out["temperatura_fluido_superficie_C"])

        Y = np.asarray(Y, dtype=float)

        Si = sobol.analyze(
            problem,
            Y,
            calc_second_order=CALC_SECOND_ORDER,
            print_to_console=False,
        )

        temp = pd.DataFrame({
            "POZO": row["POZO"],
            "variable": names,
            "S1": Si["S1"],
            "S1_conf": Si["S1_conf"],
            "ST": Si["ST"],
            "ST_conf": Si["ST_conf"],
        })
        temp["interaccion_aprox_ST_menos_S1"] = temp["ST"] - temp["S1"]
        resultados.append(temp)

        print(f"Sobol por pozo procesado: {j}/{len(df_iter)}")

    return pd.concat(resultados, ignore_index=True)


# =============================================================================
# 10. GRAFICAS
# =============================================================================

def plot_sobol_total(sobol_df, output_path):
    data = sobol_df.sort_values("ST", ascending=True)

    plt.figure(figsize=(10, 6))
    plt.barh(
        data["variable"],
        data["ST"],
        xerr=data["ST_conf"],
    )
    plt.xlabel("Indice total de Sobol, ST")
    plt.ylabel("Parametro asumido")
    plt.title("Sensibilidad Sobol global - Temperatura en cabeza")
    plt.grid(axis="x", alpha=0.3)
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()


def plot_sobol_s1_st(sobol_df, output_path):
    data = sobol_df.sort_values("ST", ascending=False).reset_index(drop=True)
    x = np.arange(len(data))
    width = 0.38

    plt.figure(figsize=(11, 6))
    plt.bar(x - width / 2, data["S1"], width, label="S1")
    plt.bar(x + width / 2, data["ST"], width, label="ST")
    plt.xticks(x, data["variable"], rotation=45, ha="right")
    plt.ylabel("Indice de Sobol")
    plt.title("Indices S1 y ST - Temperatura en cabeza")
    plt.grid(axis="y", alpha=0.3)
    plt.legend()
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()


def plot_tornado(tornado_df, output_path):
    data = tornado_df.sort_values("range_effect_abs", ascending=True).reset_index(drop=True)

    y_pos = np.arange(len(data))
    y_low = data["y_low"].values
    y_high = data["y_high"].values
    base = float(data["base"].iloc[0])

    left = np.minimum(y_low, y_high)
    width = np.abs(y_high - y_low)

    plt.figure(figsize=(10, 6))
    plt.barh(y_pos, width, left=left)
    plt.axvline(base, linestyle="--", linewidth=1.5, label=f"Base = {base:.2f} °C")
    plt.yticks(y_pos, data["variable"])
    plt.xlabel("Temperatura promedio en cabeza [°C]")
    plt.ylabel("Parametro asumido")
    plt.title("Tornado plot - Temperatura en cabeza")
    plt.grid(axis="x", alpha=0.3)
    plt.legend()
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()


def plot_temperatura_base_mapa_simple(baseline_df, output_path):
    """Mapa simple lat-lon, sin shapefile, para revisar distribucion espacial."""

    plt.figure(figsize=(8, 7))
    sc = plt.scatter(
        baseline_df["LATITUD"],
        baseline_df["LONGITUD"],
        c=baseline_df["temperatura_fluido_superficie_C"],
        s=45,
    )
    plt.colorbar(sc, label="Temperatura en cabeza [°C]")
    plt.xlabel("Longitud")
    plt.ylabel("Latitud")
    plt.title("Temperatura base estimada en cabeza de pozo")
    plt.grid(alpha=0.3)
    plt.tight_layout()
    plt.savefig(output_path, dpi=300, bbox_inches="tight")
    plt.close()


# =============================================================================
# 11. MAIN
# =============================================================================

def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    print("=" * 80)
    print("ANALISIS DE SENSIBILIDAD - TEMPERATURA DEL FLUIDO EN CABEZA")
    print("=" * 80)
    print(f"CSV entrada: {CSV_ENTRADA}")
    print(f"Carpeta salida: {OUTPUT_DIR.resolve()}")
    print(f"t_years_eval fijo: {T_YEARS_EVAL_FIJO} anos")
    print("Variables asumidas que SI varian:")
    for k, v in ASSUMED_BOUNDS.items():
        print(f"  - {k}: {v}")

    df = cargar_datos(CSV_ENTRADA, max_pozos=MAX_POZOS)
    print(f"\nPozos cargados: {len(df)}")

    # -------------------------------------------------------------------------
    # Caso base
    # -------------------------------------------------------------------------
    print("\nCalculando caso base...")
    baseline_df = evaluar_todos_los_pozos(df, BASE_PARAMS)
    baseline_path = OUTPUT_DIR / "temperatura_cabeza_base.csv"
    baseline_df.to_csv(baseline_path, index=False, encoding="utf-8-sig")

    print("Resumen temperatura base en cabeza [°C]:")
    print(baseline_df["temperatura_fluido_superficie_C"].describe())

    plot_temperatura_base_mapa_simple(
        baseline_df,
        OUTPUT_DIR / "mapa_simple_temperatura_cabeza_base.png",
    )

    # -------------------------------------------------------------------------
    # Sobol global
    # -------------------------------------------------------------------------
    print("\nEjecutando Sobol global...")
    sobol_df, y_sobol_df = correr_sobol_global(df, aggregation="mean")

    sobol_path = OUTPUT_DIR / "sobol_global_temperatura_cabeza_media.csv"
    y_sobol_path = OUTPUT_DIR / "salidas_sobol_temperatura_cabeza_media.csv"

    sobol_df.to_csv(sobol_path, index=False, encoding="utf-8-sig")
    y_sobol_df.to_csv(y_sobol_path, index=False, encoding="utf-8-sig")

    print("\nResultados Sobol global:")
    print(sobol_df)

    plot_sobol_total(
        sobol_df,
        OUTPUT_DIR / "sobol_ST_temperatura_cabeza_media.png",
    )
    plot_sobol_s1_st(
        sobol_df,
        OUTPUT_DIR / "sobol_S1_ST_temperatura_cabeza_media.png",
    )

    # -------------------------------------------------------------------------
    # Tornado global
    # -------------------------------------------------------------------------
    print("\nEjecutando tornado plot global...")
    tornado_df = tornado_analysis_global(df, ASSUMED_BOUNDS, aggregation="mean")
    tornado_path = OUTPUT_DIR / "tornado_temperatura_cabeza_media.csv"
    tornado_df.to_csv(tornado_path, index=False, encoding="utf-8-sig")

    print("\nResultados tornado global:")
    print(tornado_df)

    plot_tornado(
        tornado_df,
        OUTPUT_DIR / "tornado_temperatura_cabeza_media.png",
    )

    # -------------------------------------------------------------------------
    # Sobol por pozo opcional
    # -------------------------------------------------------------------------
    if RUN_SOBOL_POR_POZO:
        print("\nEjecutando Sobol por pozo...")
        sobol_pozo_df = correr_sobol_por_pozo(df)
        sobol_pozo_path = OUTPUT_DIR / "sobol_por_pozo.csv"
        sobol_pozo_df.to_csv(sobol_pozo_path, index=False, encoding="utf-8-sig")

        sobol_pozo_summary = (
            sobol_pozo_df
            .groupby("variable")
            .agg(
                S1_mean=("S1", "mean"),
                S1_std=("S1", "std"),
                ST_mean=("ST", "mean"),
                ST_std=("ST", "std"),
                interaccion_mean=("interaccion_aprox_ST_menos_S1", "mean"),
            )
            .reset_index()
            .sort_values("ST_mean", ascending=False)
        )
        sobol_pozo_summary.to_csv(
            OUTPUT_DIR / "sobol_por_pozo_resumen.csv",
            index=False,
            encoding="utf-8-sig",
        )
        print("\nResumen Sobol por pozo:")
        print(sobol_pozo_summary)

    print("\nArchivos generados en:")
    print(OUTPUT_DIR.resolve())
    print("=" * 80)


if __name__ == "__main__":
    main()
