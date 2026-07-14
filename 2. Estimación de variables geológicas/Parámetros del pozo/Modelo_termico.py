import numpy as np
import pandas as pd

"""
MODELO TÉRMICO DE POZO VERTICAL - EXPORTACIÓN DESDE CSV

Lee un CSV con columnas por pozo y genera un CSV largo con el perfil de
temperatura del fluido vs profundidad para cada pozo, en modo "up"
desde fondo hacia superficie.

Columnas requeridas en el CSV de entrada:
    [
        "POZO",
        "LATITUD",
        "LONGITUD",
        "BHT___C_",
        "Potencial_Agua_promd (kg/s)",
        "PROFUNDIDAD_m",
        "GEOTHERMAL_GRAD"
    ]

Supuestos principales:
- BHT___C_ se usa como Tin, es decir, temperatura de entrada en fondo.
- PROFUNDIDAD_m se usa como profundidad total del pozo.
- GEOTHERMAL_GRAD se usa como gradiente geotérmico.
- Potencial_Agua_promd (kg/s) se usa como caudal másico del fluido.
- rhorock se mantiene como parámetro constante del modelo original.
- El flujo se calcula siempre en modo "up".
- No se generan gráficas; se exporta un CSV.
"""

SEC_IN_YEAR = 365 * 24 * 3600.0


def formation_resistance_per_length(
    t_seconds,
    r,
    krock,
    rhorock,
    cprock,
    Kfac=1.4986,
):
    """
    Calcula la resistencia térmica transitoria de formación por metro [K·m/W].
    """

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

    # Evita logaritmos no válidos para tiempos muy pequeños.
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
    """
    Resuelve el perfil de temperatura del fluido T(z) para un tiempo específico.

    Parámetros:
    - D: profundidad total [m]
    - npts: número de puntos del perfil
    - direction: "up" o "down"
    - Tin: temperatura de entrada del fluido [°C]
    - T_surface: temperatura de formación en superficie [°C]
    - geothermal_gradient: gradiente geotérmico [°C/m]
    - t_years: tiempo de evaluación [años]
    - krock: conductividad térmica de roca [W/m/K]
    - rhorock: densidad de roca [kg/m3]
    - cprock: calor específico de roca [J/kg/K]
    - r: radio efectivo del pozo [m]
    - mrate_kg_per_s: caudal másico [kg/s]
    - cpfluid: calor específico del fluido [J/kg/K]
    """

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

        Tout = float(Tfluid[0])

    else:
        raise ValueError("direction debe ser 'down' o 'up'.")

    return z, Tfluid, Tout, Tf, a, Rf_prime


def convertir_gradiente_a_C_por_m(valor, unidades="auto"):
    """
    Convierte GEOTHERMAL_GRAD a °C/m.

    unidades:
    - "C/m": el valor ya está en °C/m, por ejemplo 0.03
    - "C/km": el valor está en °C/km, por ejemplo 30
    - "auto": si abs(valor) > 1, se asume °C/km; si no, °C/m
    """

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


def cp_mezcla_agua_petroleo(
    rho_w,
    rho_o,
    cp_w,
    cp_o,
    phi_w,
):
    """
    Calcula el cp efectivo de una mezcla agua-petróleo usando fracción másica.

    phi_w:
        Fracción volumétrica de agua. Por ejemplo, 0.9 significa 90% agua.
    """

    if not (0.0 <= phi_w <= 1.0):
        raise ValueError("phi_w debe estar entre 0 y 1.")

    if rho_w <= 0 or rho_o <= 0:
        raise ValueError("rho_w y rho_o deben ser > 0.")

    if cp_w <= 0 or cp_o <= 0:
        raise ValueError("cp_w y cp_o deben ser > 0.")

    w_w_mass = (phi_w * rho_w) / (phi_w * rho_w + (1.0 - phi_w) * rho_o)

    cp_mix = w_w_mass * cp_w + (1.0 - w_w_mass) * cp_o

    return float(cp_mix)


def calcular_perfiles_desde_csv(
    csv_entrada,
    csv_salida="perfiles_temperatura_pozos.csv",
    npts=501,
    t_years_eval=30.0,
    unidades_gradiente="auto",
    usar_bht_para_Tsurface=True,
    T_surface_default=15.0,
    # Roca / formación
    krock=3.0,
    rhorock=2663.0,
    cprock=1112.0,
    # Geometría
    r=0.078,
    # Fluido / flujo
    rho_w=1000.0,
    rho_o=850.0,
    cp_w=4180.0,
    cp_o=2200.0,
    phi_w=0.9,
    columna_caudal="Potencial_Agua_promd (kg/s)",
    Kfac=1.4986,
    encoding_entrada=None,
):
    """
    Lee un CSV de pozos y exporta perfiles de temperatura vs profundidad.

    El CSV de entrada debe tener las columnas:

        POZO
        LATITUD
        LONGITUD
        BHT___C_
        Potencial_Agua_promd (kg/s)
        PROFUNDIDAD_m
        GEOTHERMAL_GRAD

    Parámetros importantes:

    - BHT___C_:
        Se usa como Tin, temperatura de entrada en fondo.

    - Potencial_Agua_promd (kg/s):
        Se usa como mrate_kg_per_s, es decir, caudal másico.

    - usar_bht_para_Tsurface=True:
        Calcula la temperatura de formación en superficie de cada pozo como:

            T_surface = BHT - GEOTHERMAL_GRAD * PROFUNDIDAD_m

        Esto hace que la temperatura de formación en fondo coincida con BHT.

    - usar_bht_para_Tsurface=False:
        Usa una temperatura superficial fija:

            T_surface = T_surface_default

    Devuelve:
    - DataFrame largo con perfiles de temperatura por pozo.
    """

    columnas_requeridas = [
        "POZO",
        "LATITUD",
        "LONGITUD",
        "BHT (°C)",
        columna_caudal,
        "PROFUNDIDAD_BHT (km)",
        "Grad_Geoterm",
    ]

    df = pd.read_csv(csv_entrada, encoding=encoding_entrada)

    faltantes = [col for col in columnas_requeridas if col not in df.columns]

    if faltantes:
        raise ValueError(f"Faltan columnas en el CSV de entrada: {faltantes}")

    data = df.copy()

    columnas_numericas = [
        "LATITUD",
        "LONGITUD",
        "BHT (°C)",
        columna_caudal,
        "PROFUNDIDAD_BHT (km)",
        "Grad_Geoterm",
    ]

    for col in columnas_numericas:
        data[col] = pd.to_numeric(data[col], errors="coerce")

    filas_invalidas = data[columnas_requeridas].isna().any(axis=1)

    if filas_invalidas.any():
        pozos_invalidos = data.loc[filas_invalidas, "POZO"].astype(str).tolist()

        raise ValueError(
            "Hay filas con datos faltantes o no numéricos en columnas requeridas. "
            f"Pozos afectados: {pozos_invalidos[:20]}"
        )

    cp_mix = cp_mezcla_agua_petroleo(
        rho_w=rho_w,
        rho_o=rho_o,
        cp_w=cp_w,
        cp_o=cp_o,
        phi_w=phi_w,
    )

    perfiles = []

    for idx, row in data.iterrows():
        pozo = row["POZO"]
        lat = float(row["LATITUD"])
        lon = float(row["LONGITUD"])

        # Tin en fondo de pozo
        Tin_bht = float(row["BHT (°C)"])

        # Caudal másico por pozo
        mrate_pozo_kg_per_s = float(row[columna_caudal])

        # Profundidad total
        D = float(row["PROFUNDIDAD_BHT (km)"]) * 1000.0  # Convertir a metros

        # Gradiente geotérmico convertido a °C/m
        G = convertir_gradiente_a_C_por_m(
            row["Grad_Geoterm"],
            unidades=unidades_gradiente,
        )

        if D <= 0:
            raise ValueError(
                f"PROFUNDIDAD_BHT (km) debe ser > 0. Fila {idx}, POZO={pozo}."
            )

        if mrate_pozo_kg_per_s <= 0:
            raise ValueError(
                f"{columna_caudal} debe ser > 0. Fila {idx}, POZO={pozo}."
            )

        if usar_bht_para_Tsurface:
            # Ancla el perfil de formación en fondo:
            # Tf(D) = BHT
            T_surface = Tin_bht - G * D
        else:
            # Mantiene una temperatura superficial fija.
            T_surface = float(T_surface_default)

        z, Tfluid, Tout, Tf, a, Rf_prime = solve_well_profile_at_time(
            D=D,
            npts=npts,
            direction="up",
            Tin=Tin_bht,
            T_surface=T_surface,
            geothermal_gradient=G,
            t_years=t_years_eval,
            krock=krock,
            rhorock=rhorock,
            cprock=cprock,
            r=r,
            mrate_kg_per_s=mrate_pozo_kg_per_s,
            cpfluid=cp_mix,
            Kfac=Kfac,
        )

        # Solo guardar el valor en superficie, es decir profundidad = 0 m.
        # En modo "up", Tout corresponde a la temperatura del fluido en superficie.
        perfil_pozo = pd.DataFrame(
            {
                "POZO": [pozo],
                "LATITUD": [lat],
                "LONGITUD": [lon],
                "PROFUNDIDAD_TOTAL_m": [D],
                "profundidad_m": [0.0],
                "temperatura_fluido_superficie_C": [Tout],
                "temperatura_formacion_superficie_C": [T_surface],
                "Tin_fondo_BHT_C": [Tin_bht],
                "GEOTHERMAL_GRAD_C_m": [G],
                "T_surface_usada_C": [T_surface],
                "mrate_kg_per_s": [mrate_pozo_kg_per_s],
                "cp_fluido_J_kgK": [cp_mix],
                "rhorock_constante_kg_m3": [float(rhorock)],
                "krock_W_mK": [float(krock)],
                "cprock_J_kgK": [float(cprock)],
                "radio_pozo_m": [float(r)],
                "t_years_eval": [float(t_years_eval)],
                "a_1_m": [a],
                "Rf_prime_K_m_W": [Rf_prime],
            }
        )

        perfiles.append(perfil_pozo)

    resultado = pd.concat(perfiles, ignore_index=True)

    resultado.to_csv(csv_salida, index=False, encoding="utf-8-sig")

    return resultado


# -----------------------------------------------------------------------------
# EJEMPLO DE USO DIRECTO
# -----------------------------------------------------------------------------
if __name__ == "__main__":

    # Cambia estos nombres por los de tus archivos.
    csv_entrada = "datos_finales_BHT.csv"
    csv_salida = "perfiles_temperatura_pozos_2.csv"

    perfiles = calcular_perfiles_desde_csv(
        csv_entrada=csv_entrada,
        csv_salida=csv_salida,

        # Número de puntos del perfil por pozo.
        # 501 puntos significa que cada pozo tendrá 501 filas en el CSV de salida.
        npts=501,

        # Tiempo de evaluación del intercambio térmico.
        t_years_eval=1.0,

        # Si GEOTHERMAL_GRAD viene como 0.03, usa "C/m".
        # Si viene como 30, usa "C/km".
        # Con "auto", el código intenta decidir automáticamente.
        unidades_gradiente="auto",

        # True:
        #   Calcula T_surface para que la formación en fondo sea igual al BHT.
        #
        # False:
        #   Usa T_surface_default = 15 °C para todos los pozos.
        usar_bht_para_Tsurface=True,
        T_surface_default=20.0,

        # Propiedades térmicas de roca/formación.
        # rhorock queda fijo porque ya no viene desde el CSV.
        krock=3.0,
        rhorock=2663.0,
        cprock=1112.0,

        # Radio efectivo del pozo.
        r=0.073025,

        # Propiedades de fluido para cp de mezcla.
        rho_w=1000.0,
        rho_o=850.0,
        cp_w=4180.0,
        cp_o=2200.0,
        phi_w=0.9,

        # Esta es la columna del caudal másico en tu CSV.
        columna_caudal="Potencial_Agua_promd (kg/s)",
    )

    print(f"CSV generado: {csv_salida}")
    print(perfiles.head())