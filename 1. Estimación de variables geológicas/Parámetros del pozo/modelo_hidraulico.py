# %%
"""

CAÍDA DE PRESIÓN EN POZO VERTICAL CON MEZCLA ACEITE–AGUA (LÍQUIDO–LÍQUIDO)
Modelo homogéneo (no-slip) + correlación de fricción de “una sola fase”


Objetivo
----------------------------
Este script estima la caída de presión en un pozo vertical cuando el fluido que
circula es una mezcla de aceite y agua.

Calcula el gradiente de presión total dP/dz como suma de:
1) Componente hidrostática (peso de la columna de fluido)
2) Componente por fricción (pérdidas por rozamiento con la tubería)

Ecuación principal implementada:
--------------------------------
    dP/dz = rho_m * g  ±  f * rho_m * v^2 / (2*D)
    Componente de fricción -> + para inyección, − para producción (con z hacia abajo)

Donde:
- rho_m : densidad de la mezcla (kg/m³)
- g     : gravedad (m/s²)
- f     : factor de fricción de Darcy (adimensional)
- v     : velocidad promedio en la tubería (m/s)
- D     : diámetro interno (m)

Supuestos (simplificaciones importantes):
-----------------------------------------
• Pozo vertical (z positivo hacia abajo).
• Régimen estacionario (no cambia en el tiempo).
• Incompresible y propiedades constantes (rho y mu fijas).
• Modelo homogéneo (no-slip): aceite y agua se mueven con la misma velocidad
  promedio. Es decir, NO se modela deslizamiento/fases separadas.
• Se desprecia el término de aceleración (cambios de velocidad con z).
• La fricción se calcula como si el flujo fuera “equivalente monofásico” usando
  Re (con propiedades efectivas) y un f (Darcy) simple.

¿Cuándo este modelo es útil?
----------------------------
- Para estimaciones rápidas / primeras aproximaciones.
- Para comparar impacto de “más agua” o “más aceite” en la caída de presión.

¿Cuándo puede fallar?
---------------------
- Si hay flujo claramente bifásico con separación (slip) entre fases,
  o patrones de flujo que cambian con z.
- Si hay gas, compresibilidad importante, o cambios fuertes de propiedades con T o P.

"""

# %%

from __future__ import annotations

import math
from dataclasses import dataclass
from typing import Literal, Tuple, List
import matplotlib.pyplot as plt


# %%

# 1) ESTRUCTURAS DE DATOS (para agrupar parámetros)

@dataclass
class Well:
    """
    Define la geometría básica del pozo/tubería.

    - depth_m: profundidad vertical (m)
    - diameter_m: diámetro interno del conducto (m)
    - roughness_m: rugosidad absoluta (m)
      * Si roughness_m = 0 => se asume "hidráulicamente liso"
    """
    depth_m: float
    diameter_m: float
    roughness_m: float = 0.0


@dataclass
class FluidProps:
    """
    Propiedades de las dos fases líquidas (aceite y agua), asumidas constantes.

    - rho_oil, rho_wat: densidades (kg/m³)
    - mu_oil, mu_wat: viscosidades dinámicas (Pa*s)
      Nota: 1 cP = 1e-3 Pa*s
    """
    rho_oil: float
    mu_oil: float
    rho_wat: float
    mu_wat: float


# Tipo permitido para la regla de mezcla de viscosidad
MixRule = Literal["log", "linear"]
FlowDirection = Literal["down", "up"]  # down=injection, up=production (con z positivo hacia abajo)
PressureRef = Literal["wellhead", "bottom"]  # dónde está la presión conocida

# %%

# 2) FUNCIONES AUXILIARES (geometría y mezclas)


def area(diameter_m: float) -> float:
    """
    Área transversal de una tubería circular.

    Fórmula:
        A = pi * D^2 / 4

    Entrada:
      - diameter_m [m]

    Salida:
      - A [m²]
    """
    return math.pi * (diameter_m ** 2) / 4.0


def mixture_from_massflows(
    m_oil: float,
    m_wat: float,
    props: FluidProps,
    mix_rule: MixRule = "log",
) -> Tuple[float, float, float, float, float]:
    """
    A partir de caudales MÁSICOS (kg/s) de aceite y agua, calcula propiedades
    “efectivas” de mezcla para usar un modelo homogéneo.

    ¿Qué hace exactamente?
    ----------------------
    1) Convierte caudales másicos -> caudales volumétricos:
         q = m / rho
    2) Calcula fracciones volumétricas:
         phi_oil = q_oil / (q_oil + q_wat)
    3) Calcula densidad de mezcla (regla lineal por fracción volumétrica):
         rho_mix = phi_oil*rho_oil + phi_wat*rho_wat
    4) Calcula viscosidad de mezcla (dos opciones):
       - "log"   : mezcla tipo Arrhenius (muy usada para viscosidad):
            ln(mu_mix) = phi_oil ln(mu_oil) + phi_wat ln(mu_wat)
       - "linear": mezcla lineal simple:
            mu_mix = phi_oil*mu_oil + phi_wat*mu_wat

    Entradas:
    ---------
    - m_oil [kg/s] : caudal másico de aceite
    - m_wat [kg/s] : caudal másico de agua
    - props        : densidades y viscosidades de aceite/agua
    - mix_rule     : "log" o "linear"

    Salidas:
    --------
    - q_oil   [m³/s]   caudal volumétrico de aceite
    - q_wat   [m³/s]   caudal volumétrico de agua
    - phi_oil [-]      fracción volumétrica de aceite
    - rho_mix [kg/m³]  densidad efectiva de mezcla
    - mu_mix  [Pa*s]   viscosidad efectiva de mezcla

    Nota importante:
    ----------------
    Este “modelo homogéneo” supone que ambas fases se mueven igual (no-slip).
    En realidad, aceite y agua pueden tener deslizamiento, holdup, emulsión, etc.
    """
    # Evitar entradas no físicas, no razonables
    if m_oil < 0 or m_wat < 0:
        raise ValueError("Los caudales másicos deben ser no negativos.")
    if props.rho_oil <= 0 or props.rho_wat <= 0:
        raise ValueError("Las densidades deben ser positivas.")
    if props.mu_oil <= 0 or props.mu_wat <= 0:
        raise ValueError("Las viscosidades deben ser positivas.")

    # 1) Convertimos caudal másico (kg/s) a caudal volumétrico (m³/s)
    q_oil = m_oil / props.rho_oil
    q_wat = m_wat / props.rho_wat
    q_tot = q_oil + q_wat

    if q_tot <= 0:
        raise ValueError("El caudal volumétrico total es cero; no hay flujo que calcular.")

    # 2) Fracciones volumétricas
    phi_oil = q_oil / q_tot
    phi_wat = 1.0 - phi_oil

    # 3) Densidad de mezcla (promedio volumétrico)
    rho_mix = phi_oil * props.rho_oil + phi_wat * props.rho_wat

    # 4) Viscosidad de mezcla
    if mix_rule == "log":
        # Mezcla tipo Arrhenius: útil para viscosidad
        mu_mix = math.exp(phi_oil * math.log(props.mu_oil) + phi_wat * math.log(props.mu_wat))
    elif mix_rule == "linear":
        # Mezcla lineal: más simple, a veces menos realista
        mu_mix = phi_oil * props.mu_oil + phi_wat * props.mu_wat
    else:
        raise ValueError("mix_rule debe ser 'log' o 'linear'.")

    return q_oil, q_wat, phi_oil, rho_mix, mu_mix


# 3) FACTOR DE FRICCIÓN (Darcy) y Reynolds


def friction_factor_swamee_jain(Re: float, rel_rough: float) -> float:
    """
    Factor de fricción Darcy en turbulento (aprox. explícita Swamee–Jain).

    Fórmula (turbulento, típica para Re > ~5000):
        f = 0.25 / [ log10( e/(3.7D) + 5.74/Re^0.9 ) ]^2

    Entradas:
    ---------
    - Re [-]         : número de Reynolds (debe ser > 0)
    - rel_rough [-]  : rugosidad relativa = e/D (>= 0)

    Salida:
    -------
    - f [-] : factor de fricción Darcy

    Nota:
    -----
    Esta correlación aplica principalmente en turbulento.
    """
    if Re <= 0:
        raise ValueError("Re debe ser positivo.")
    if rel_rough < 0:
        raise ValueError("La rugosidad relativa debe ser no negativa.")

    # Implementación correcta de Swamee-Jain:
    term = rel_rough / 3.7 + 5.74 / (Re ** 0.9)
    return 0.25 / (math.log10(term) ** 2)


def friction_factor(Re: float, rel_rough: float) -> float:
    """
    Factor de fricción Darcy con manejo simple de regímenes:

    - Laminar:        f = 64/Re                     para Re < 2300
    - Transición:     interpolación lineal 2300..4000
    - Turbulento:     Swamee-Jain                  para Re > 4000

    Esto NO es un modelo súper fino del régimen transicional, pero sirve para
    continuidad numérica.
    """
    if Re <= 0:
        raise ValueError("Re debe ser positivo.")

    if Re < 2300:
        return 64.0 / Re

    if Re > 4000:
        return friction_factor_swamee_jain(Re, rel_rough)

    # Mezcla lineal en transición
    f_lam = 64.0 / 2300.0
    f_turb = friction_factor_swamee_jain(4000.0, rel_rough)
    w = (Re - 2300.0) / (4000.0 - 2300.0)
    return (1.0 - w) * f_lam + w * f_turb



# 4) GRADIENTE DE PRESIÓN EN POZO VERTICAL


def pressure_gradient_vertical(
    well: Well,
    q_total_m3s: float,
    rho_mix: float,
    mu_mix: float,
    g: float = 9.81,
    flow_direction: FlowDirection = "down",
) -> Tuple[float, float, float, float, float]:
    """
    Calcula el gradiente de presión (Pa/m) en un pozo vertical.

    Convención de coordenadas:
    --------------------------
    - z positivo hacia abajo
    - z = 0 en cabeza de pozo

    Modelo (magnitudes):
    --------------------
    dP/dz_hidro = rho_mix * g                         (siempre + con z hacia abajo)
    dP/dz_fric_mag = f * rho_mix * v^2 / (2*D)        (magnitud positiva)

    Signo del término de fricción:
    ------------------------------
    La fricción SIEMPRE se opone al movimiento. Con z positivo hacia abajo:
    - flow_direction="down" (inyección, flujo hacia +z): fricción actúa como +dP/dz
      => dP/dz_total = + rho g + dP/dz_fric_mag
    - flow_direction="up"   (producción, flujo hacia -z): fricción actúa como -dP/dz
      => dP/dz_total = + rho g - dP/dz_fric_mag

    Entradas:
    ---------
    - q_total_m3s: caudal volumétrico total (m³/s). Se usa como MAGNITUD (debe ser > 0).
    - flow_direction: "down" o "up"

    Devuelve:
    ---------
    - dPdz_total [Pa/m] (con signo según convención)
    - dPdz_hydro [Pa/m]
    - dPdz_fric_signed [Pa/m]  (ya con signo aplicado)
    - Re [-]
    - f  [-] (Darcy)
    """
    # Validaciones
    if q_total_m3s <= 0:
        raise ValueError("q_total_m3s debe ser positivo (magnitud de caudal).")
    if rho_mix <= 0 or mu_mix <= 0:
        raise ValueError("rho_mix y mu_mix deben ser positivos.")
    if well.diameter_m <= 0 or well.depth_m <= 0:
        raise ValueError("El diámetro y la profundidad del pozo deben ser positivos.")
    if flow_direction not in ("down", "up"):
        raise ValueError("flow_direction debe ser 'down' o 'up'.")

    # Área transversal
    A = area(well.diameter_m)

    # Velocidad promedio (magnitud)
    v = q_total_m3s / A

    # Número de Reynolds (mezcla equivalente)
    Re = rho_mix * v * well.diameter_m / mu_mix

    # Rugosidad relativa e/D
    rel_rough = (well.roughness_m / well.diameter_m) if well.roughness_m > 0 else 0.0

    # Factor de fricción Darcy
    f = friction_factor(Re, rel_rough)

    # Componentes del gradiente de presión
    dPdz_h = rho_mix * g  # siempre positivo con z hacia abajo

    # Magnitud positiva de fricción
    dPdz_f_mag = f * rho_mix * v * v / (2.0 * well.diameter_m)

    # Signo por dirección de flujo
    sign = +1.0 if flow_direction == "down" else -1.0
    dPdz_f_signed = sign * dPdz_f_mag

    # Magnitud positiva de fricción (siempre)
    dPdz_f_mag = f * rho_mix * v * v / (2.0 * well.diameter_m)

    # Para perfil P(z) con z positivo hacia abajo:
    dPdz_total = dPdz_h + dPdz_f_mag

    return dPdz_total, dPdz_h, dPdz_f_mag, Re, f



# 5) CÁLCULO DE CAÍDA DE PRESIÓN TOTAL EN TODA LA PROFUNDIDAD


def pressure_drop(
    well: Well,
    m_oil: float,
    m_wat: float,
    props: FluidProps,
    mix_rule: MixRule = "log",
    g: float = 9.81,
    flow_direction: FlowDirection = "down",
) -> dict:
    """
    Calcula la caída total de presión sobre toda la profundidad del pozo,
    asumiendo gradiente constante.

    Importante (signos):
    --------------------
    Con z positivo hacia abajo y P(z) = P(z0) + (dP/dz)*(z - z0),
    el signo de dP/dz depende de flow_direction debido a fricción.

    - "down" (inyección): fricción suma a dP/dz
    - "up" (producción): fricción resta a dP/dz
    """
    q_oil, q_wat, phi_oil, rho_mix, mu_mix = mixture_from_massflows(
        m_oil, m_wat, props, mix_rule=mix_rule
    )
    q_total = q_oil + q_wat

    dPdz_total, dPdz_h, dPdz_f_mag, Re, f = pressure_gradient_vertical(
        well, q_total, rho_mix, mu_mix, g=g, flow_direction=flow_direction
    )

    dP_total = dPdz_total * well.depth_m
    dP_h = dPdz_h * well.depth_m
    dP_f = dPdz_f_mag * well.depth_m

    return {
        "mix_rule": mix_rule,
        "flow_direction": flow_direction,
        "q_oil_m3s": q_oil,
        "q_wat_m3s": q_wat,
        "q_total_m3s": q_total,
        "phi_oil": phi_oil,
        "rho_mix_kgm3": rho_mix,
        "mu_mix_Pas": mu_mix,
        "velocity_ms": q_total / area(well.diameter_m),
        "Re": Re,
        "friction_factor_Darcy": f,
        "dPdz_total_Pam": dPdz_total,
        "dPdz_hydro_Pam": dPdz_h,
        "dPdz_fric_Pam": dPdz_f_mag, # magnitud positiva
        "deltaP_total_bar": dP_total / 1e5,
        "deltaP_hydro_bar": dP_h / 1e5,
        "deltaP_fric_bar": dP_f / 1e5,  # con signo
    }


# 6) PERFIL DE PRESIÓN P(z) (discretizado)


def pressure_profile(
    well: Well,
    p_ref_bar: float,
    p_ref_at: PressureRef,
    m_oil: float,
    m_wat: float,
    props: FluidProps,
    mix_rule: MixRule = "log",
    n_steps: int = 50,
    g: float = 9.81,
    flow_direction: FlowDirection = "down",
) -> List[Tuple[float, float]]:
    """
    Genera un perfil de presión P(z) para un pozo vertical asumiendo gradiente constante.

    Convención:
    -----------
    - z = 0 en cabeza de pozo (wellhead)
    - z positivo hacia abajo
    - z = H (= well.depth_m) en fondo de pozo (bottomhole)

    Presión de referencia:
    ----------------------
    El usuario puede definir dónde está la presión conocida:
    - p_ref_at="wellhead":  P(0) = p_ref_bar   (WHP)
    - p_ref_at="bottom":    P(H) = p_ref_bar   (BHP)

    Fórmula general:
    ----------------
    P(z) = P(z_ref) + (dP/dz) * (z - z_ref)

    donde:
    - z_ref = 0 si p_ref_at="wellhead"
    - z_ref = H si p_ref_at="bottom"

    Signos / dirección de flujo:
    ----------------------------
    Con z hacia abajo, el término hidrostático es +rho*g.
    La fricción cambia de signo con flow_direction:
    - "down": dP/dz = +rho*g + fricción
    - "up"  : dP/dz = +rho*g - fricción
    """
    if p_ref_at not in ("wellhead", "bottom"):
        raise ValueError("p_ref_at debe ser 'wellhead' o 'bottom'.")
    if n_steps <= 0:
        raise ValueError("n_steps debe ser entero positivo.")

    result = pressure_drop(
        well, m_oil, m_wat, props,
        mix_rule=mix_rule, g=g, flow_direction=flow_direction
    )
    dPdz = result["dPdz_total_Pam"]  # Pa/m

    H = well.depth_m
    z_ref = 0.0 if p_ref_at == "wellhead" else H

    profile: List[Tuple[float, float]] = []
    for i in range(n_steps + 1):
        z = H * i / n_steps
        p_bar = p_ref_bar + (dPdz * (z - z_ref)) / 1e5
        profile.append((z, p_bar))

    return profile

def pressure_at_wellhead_or_bottom(
    well: Well,
    p_ref_bar: float,
    p_ref_at: PressureRef,
    m_oil: float,
    m_wat: float,
    props: FluidProps,
    mix_rule: MixRule = "log",
    g: float = 9.81,
    flow_direction: FlowDirection = "down",
) -> dict:
    """
    Devuelve WHP y BHP a partir de una presión conocida (en cabeza o en fondo).
    Útil para reportar rápidamente sin discretizar un perfil.
    """
    
    if p_ref_at not in ("wellhead", "bottom"):
        raise ValueError("p_ref_at debe ser 'wellhead' o 'bottom'.")
    
    result = pressure_drop(
        well, m_oil, m_wat, props,
        mix_rule=mix_rule, g=g, flow_direction=flow_direction
    )
    dPdz = result["dPdz_total_Pam"]
    H = well.depth_m

    if p_ref_at == "wellhead":
        WHP = p_ref_bar
        BHP = p_ref_bar + (dPdz * H) / 1e5
    elif p_ref_at == "bottom":
        BHP = p_ref_bar
        WHP = p_ref_bar - (dPdz * H) / 1e5
    else:
        raise ValueError("p_ref_at debe ser 'wellhead' o 'bottom'.")

    return {
        **result,
        "WHP_bar": WHP,
        "BHP_bar": BHP,
    }

# %%
# ================================== DATOS PARA EJECUTAR ============================= 

# EJEMPLO 1: Presión conocida en cabeza (WHP) y flujo hacia arriba (producción)
if __name__ == "__main__":

    # ----------------------------
    # Geometría del pozo
    # ----------------------------
    well = Well(
        depth_m=2500.0,
        diameter_m=0.0762,
        roughness_m=1e-5
    )

    # ----------------------------
    # Propiedades de fluidos
    # ----------------------------
    props = FluidProps(
        rho_oil=800.0,     # kg/m3
        mu_oil=3e-3,       # Pa*s (3 cP)
        rho_wat=1000.0,    # kg/m3
        mu_wat=0.7e-3      # Pa*s (0.7 cP)
    )

    # ----------------------------
    # Condiciones de operación
    # ----------------------------
    flow_direction = "up"            # "up" = producción
    p_ref_bar = 50.0                 # WHP conocida
    p_ref_at = "wellhead"

    m_oil = 5.0                      # kg/s
    m_wat = 10.0                     # kg/s

    # ----------------------------
    # Cálculo WHP / BHP
    # ----------------------------
    summary = pressure_at_wellhead_or_bottom(
        well=well,
        p_ref_bar=p_ref_bar,
        p_ref_at=p_ref_at,
        m_oil=m_oil,
        m_wat=m_wat,
        props=props,
        mix_rule="log",
        flow_direction=flow_direction
    )

    print("\n=== CASO: PRESIÓN CONOCIDA EN CABEZA (WHP) ===")
    print(f"Dirección de flujo : {summary['flow_direction']}")
    print(f"WHP = {summary['WHP_bar']:.2f} bar")
    print(f"BHP = {summary['BHP_bar']:.2f} bar")
    print(f"ΔP total = {summary['deltaP_total_bar']:.2f} bar")
    print(f"ΔP hidro = {summary['deltaP_hydro_bar']:.2f} bar")
    print(f"ΔP fric  = {summary['deltaP_fric_bar']:.2f} bar")

    # ----------------------------
    # Perfil de presión
    # ----------------------------
    prof = pressure_profile(
        well=well,
        p_ref_bar=p_ref_bar,
        p_ref_at=p_ref_at,
        m_oil=m_oil,
        m_wat=m_wat,
        props=props,
        mix_rule="log",
        n_steps=10,
        flow_direction=flow_direction
    )

    print("\nPerfil de presión (z [m], P [bar]):")
    for z, p in prof:
        print(f"{z:7.1f} m : {p:8.2f} bar")




# %%

# EJEMPLO 2: Presión conocida en fondo (BHP) y flujo hacia abajo (inyección)

if __name__ == "__main__":

    # ----------------------------
    # Geometría del pozo
    # ----------------------------
    well = Well(
        depth_m=2500.0,
        diameter_m=0.0762,
        roughness_m=1e-5
    )

    # ----------------------------
    # Propiedades de fluidos
    # ----------------------------
    props = FluidProps(
        rho_oil=800.0,     # kg/m3
        mu_oil=3e-3,       # Pa*s (3 cP)
        rho_wat=1000.0,    # kg/m3
        mu_wat=0.7e-3      # Pa*s (0.7 cP)
    )

    # ----------------------------
    # Condiciones de operación
    # ----------------------------
    flow_direction = "down"          # "down" = inyección
    p_ref_bar = 350.0                # BHP conocida
    p_ref_at = "bottom"

    m_oil = 5.0                      # kg/s
    m_wat = 20.0                     # kg/s

    # ----------------------------
    # Cálculo WHP / BHP
    # ----------------------------
    summary = pressure_at_wellhead_or_bottom(
        well=well,
        p_ref_bar=p_ref_bar,
        p_ref_at=p_ref_at,
        m_oil=m_oil,
        m_wat=m_wat,
        props=props,
        mix_rule="log",
        flow_direction=flow_direction
    )

    print("\n=== CASO: PRESIÓN CONOCIDA EN FONDO (BHP) ===")
    print(f"Dirección de flujo : {summary['flow_direction']}")
    print(f"BHP = {summary['BHP_bar']:.2f} bar")
    print(f"WHP = {summary['WHP_bar']:.2f} bar")
    print(f"ΔP total = {summary['deltaP_total_bar']:.2f} bar")
    print(f"ΔP hidro = {summary['deltaP_hydro_bar']:.2f} bar")
    print(f"ΔP fric  = {summary['deltaP_fric_bar']:.2f} bar")

    # ----------------------------
    # Perfil de presión
    # ----------------------------
    prof2 = pressure_profile(
        well=well,
        p_ref_bar=p_ref_bar,
        p_ref_at=p_ref_at,
        m_oil=m_oil,
        m_wat=m_wat,
        props=props,
        mix_rule="log",
        n_steps=10,
        flow_direction=flow_direction
    )

    print("\nPerfil de presión (z [m], P [bar]):")
    for z, p in prof2:
        print(f"{z:7.1f} m : {p:8.2f} bar")
# %%
# --- Plot 1: Perfil de presión P(z) ---
# Caso 1 (producción) ya calculado en "prof"
z1 = [z for z, _ in prof]
p1 = [p for _, p in prof]

# Caso 2 (inyección) ya calculado en "prof"
z2 = [z for z, _ in prof2]
p2 = [p for _, p in prof2]

plt.figure()
plt.plot(p1, z1, label="Caso 1: WHP conocida, Producción (up)")
plt.plot(p2, z2, label="Caso 2: BHP conocida, Inyección (down)")
plt.gca().invert_yaxis()  # profundidad hacia abajo
plt.xlabel("Presión [bar]")
plt.ylabel("Profundidad z [m]")
plt.title("Perfil de presión P(z)")
plt.legend()
plt.grid(True)
plt.show()


# %%
# --- Plot 2: Descomposición del gradiente (hidro vs fricción) ---
# 

# Cambiar según el caso que se quiera graficar (aquí se toma el caso 1)

def pam_to_bar_per_100m(x_pam: float) -> float:
    return x_pam * 100.0 / 1e5  # Pa/m -> bar/100m

labels = ["Caso 1 (Producción con WHP conocido)"]

hydro = [
    pam_to_bar_per_100m(summary["dPdz_hydro_Pam"]),
]
fric = [
    pam_to_bar_per_100m(summary["dPdz_fric_Pam"]),
]
total = [
    pam_to_bar_per_100m(summary["dPdz_total_Pam"]),

]

x = list(range(len(labels)))
w = 0.25

plt.figure()
plt.bar([i - w for i in x], hydro, width=w, label="Hidrostático", zorder=3)
plt.bar(x, fric, width=w, label="Fricción", zorder=3)
plt.bar([i + w for i in x], total, width=w, label="Total", zorder=3)
plt.xticks(x, labels)
plt.ylabel("Gradiente [bar/100 m]")
plt.title("Gradiente de presión: hidro vs fricción")
plt.grid(True, axis="y", zorder=0)
plt.legend()
plt.show()
# %%
