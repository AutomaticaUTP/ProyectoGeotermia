import numpy as np

try:
    from CoolProp.CoolProp import PropsSI
except ImportError:
    PropsSI = None


# ============================================================
# Constantes
# ============================================================

PSI_TO_PA = 6894.757293168
BAR_TO_PA = 100000.0
KPA_TO_PA = 1000.0
MPA_TO_PA = 1_000_000.0

P_ATM_PA = 101325.0
P_ATM_PSI = 14.6959488

BARREL_TO_M3 = 0.158987294928
DAY_TO_S = 86400.0

GALLON_TO_M3 = 0.003785411784
MIN_TO_S = 60.0


# ============================================================
# Presión
# ============================================================

def normalize_pressure_unit(unit):
    """
    Normaliza nombres de unidades de presión.
    """

    if unit is None:
        raise ValueError("La unidad de presión no puede ser None.")

    unit = str(unit).strip().lower()

    replacements = {
        "bar abs": "bar_abs",
        "bara": "bar_abs",
        "bar_absolute": "bar_abs",
        "bar absoluta": "bar_abs",
        "bar absoluto": "bar_abs",

        "bar g": "barg",
        "bar gauge": "barg",
        "bar manometrica": "barg",
        "bar manométrica": "barg",
        "bar manometrico": "barg",
        "bar manométrico": "barg",

        "psi abs": "psia",
        "psi absolute": "psia",
        "psi absoluta": "psia",
        "psi absoluto": "psia",

        "psi g": "psig",
        "psi gauge": "psig",
        "psi manometrica": "psig",
        "psi manométrica": "psig",
        "psi manometrico": "psig",
        "psi manométrico": "psig",

        "kpa abs": "kpa_abs",
        "kpa absolute": "kpa_abs",
        "kpaa": "kpa_abs",

        "kpa g": "kpag",
        "kpa gauge": "kpag",

        "mpa abs": "mpa_abs",
        "mpa absolute": "mpa_abs",
        "mpaa": "mpa_abs",

        "mpa g": "mpag",
        "mpa gauge": "mpag",
    }

    return replacements.get(unit, unit)


def pressure_to_pa(value, unit, p_atm_pa=P_ATM_PA, p_atm_psi=P_ATM_PSI):
    """
    Convierte presión a Pa absolutos.

    Casos aceptados:
    - Pa
    - kPa, kPa_abs, kPag
    - MPa, MPa_abs, MPag
    - bar, bar_abs, bara, barg
    - psi, psia, psig

    Convención:
    - 'bar', 'psi', 'kpa', 'mpa' se interpretan como absolutas.
    - 'barg', 'psig', 'kpag', 'mpag' se interpretan como manométricas.
    """

    if value is None or unit is None:
        return np.nan

    try:
        value = float(value)
    except Exception:
        return np.nan

    unit = normalize_pressure_unit(unit)

    if not np.isfinite(value):
        return np.nan

    # Pa
    if unit in ["pa", "pa_abs"]:
        return value

    # kPa
    if unit in ["kpa", "kpa_abs"]:
        return value * KPA_TO_PA

    if unit == "kpag":
        return value * KPA_TO_PA + p_atm_pa

    # MPa
    if unit in ["mpa", "mpa_abs"]:
        return value * MPA_TO_PA

    if unit == "mpag":
        return value * MPA_TO_PA + p_atm_pa

    # bar
    if unit in ["bar", "bar_abs"]:
        return value * BAR_TO_PA

    if unit == "barg":
        return value * BAR_TO_PA + p_atm_pa

    # psi
    if unit in ["psi", "psia"]:
        return value * PSI_TO_PA

    if unit == "psig":
        return (value + p_atm_psi) * PSI_TO_PA

    raise ValueError(f"Unidad de presión no reconocida: {unit}")


def pressure_series_to_pa(values, units, p_atm_pa=P_ATM_PA, p_atm_psi=P_ATM_PSI):
    """
    Convierte una serie de presiones con unidades posiblemente diferentes.
    """

    return np.asarray([
        pressure_to_pa(v, u, p_atm_pa=p_atm_pa, p_atm_psi=p_atm_psi)
        for v, u in zip(values, units)
    ], dtype=float)


# ============================================================
# Flujo en barriles por día
# ============================================================

def bpd_to_m3_s(q_bpd):
    """
    Convierte barriles por día a m3/s.
    """

    q_bpd = np.asarray(q_bpd, dtype=float)

    return q_bpd * BARREL_TO_M3 / DAY_TO_S


def water_density_coolprop_from_pa(T_C, P_Pa, fluid="IF97::Water"):
    """
    Calcula densidad con CoolProp usando T en °C y presión absoluta en Pa.
    """

    if PropsSI is None:
        raise ImportError("CoolProp no está instalado.")

    T_K = float(T_C) + 273.15
    P_Pa = float(P_Pa)

    rho = PropsSI("D", "T", T_K, "P", P_Pa, fluid)

    return rho


def bpd_to_kg_s_coolprop_from_pa(q_bpd, T_C, P_Pa, fluid="IF97::Water"):
    """
    Convierte barriles por día a kg/s usando densidad calculada con CoolProp.
    """

    q_array = np.asarray(q_bpd, dtype=float)
    t_array = np.asarray(T_C, dtype=float)
    p_array = np.asarray(P_Pa, dtype=float)

    q_m3_s = bpd_to_m3_s(q_array)

    mdot = []

    for q, t, p in zip(q_m3_s, t_array, p_array):
        rho = water_density_coolprop_from_pa(
            T_C=t,
            P_Pa=p,
            fluid=fluid
        )

        mdot.append(rho * q)

    return np.asarray(mdot, dtype=float)


def bpd_to_kg_s_constant_density(q_bpd, density_kg_m3=997.0):
    """
    Convierte barriles por día a kg/s usando densidad constante.
    """

    q_m3_s = bpd_to_m3_s(q_bpd)

    return density_kg_m3 * q_m3_s


# ============================================================
# Flujo en galones por minuto
# ============================================================

def gpm_to_m3_s(q_gpm):
    """
    Convierte galones por minuto a m3/s.
    """

    q_gpm = np.asarray(q_gpm, dtype=float)

    return q_gpm * GALLON_TO_M3 / MIN_TO_S


def gpm_to_kg_s_constant_density(q_gpm, density_kg_m3=997.0):
    """
    Convierte GPM a kg/s usando densidad constante.
    """

    q_m3_s = gpm_to_m3_s(q_gpm)

    return density_kg_m3 * q_m3_s