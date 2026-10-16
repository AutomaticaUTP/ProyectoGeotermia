from dataclasses import dataclass


@dataclass
class GeneralConfig:
    fluid: str = "IF97::Water"

    # Estado muerto
    P0_Pa: float = 101325.0

    # Presión atmosférica para convertir presiones manométricas
    p_atm_pa: float = 101325.0
    p_atm_psi: float = 14.6959488

    # Entrenamiento
    test_size: float = 0.20
    random_state: int = 42

    # Densidad constante para base ORC real
    constant_density_kg_m3: float = 997.0


@dataclass
class ResourceDatabaseConfig:
    """
    Base 1: recurso geotérmico.
    """

    path: str = "data/base_recurso.csv"

    col_T_ambiente: str = "T_ambiente_C"
    col_T_cabeza: str = "T_cabeza_C"

    # Presión original y unidad original
    col_P_cabeza: str = "P_cabeza"
    col_unidad_presion: str = "unidad_presion"

    # Presión convertida
    col_P_cabeza_Pa: str = "P_cabeza_Pa"

    # Flujo original
    col_flujo_bpd: str = "flujo_bpd"

    # Flujo calculado
    col_flujo_masico: str = "flujo_masico_kg_s"

    # Columnas exergéticas
    col_h: str = "h_J_kg"
    col_s: str = "s_J_kgK"
    col_h0: str = "h0_J_kg"
    col_s0: str = "s0_J_kgK"
    col_exergia: str = "exergia_J_kg"
    col_pmax: str = "Pmax_conceptual_kW"
    col_exergy_status: str = "exergy_status"


@dataclass
class ORCRealDatabaseConfig:
    """
    Base 2: planta ORC real.
    """

    path: str = "data/base_orc_real.csv"

    col_T_ambiente: str = "T_ambiente_C"
    col_T_cabeza: str = "T_cabeza_C"

    col_flujo_gpm: str = "flujo_volumetrico_gpm"
    col_flujo_masico: str = "flujo_masico_kg_s"

    col_potencia_real: str = "P_real_ORC_kW"