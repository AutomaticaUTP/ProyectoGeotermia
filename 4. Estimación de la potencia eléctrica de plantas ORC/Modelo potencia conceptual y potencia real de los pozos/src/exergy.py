import numpy as np
import pandas as pd
from CoolProp.CoolProp import PropsSI, PhaseSI


class ExergyAnalyzer:
    """
    Análisis exergético usando presión absoluta en Pa.
    """

    def __init__(
        self,
        fluid="IF97::Water",
        P0_Pa=101325.0
    ):
        self.fluid = fluid
        self.P0_Pa = P0_Pa

    @staticmethod
    def celsius_to_kelvin(T_C):
        return float(T_C) + 273.15

    def calculate_properties_TP(self, T_C, P_Pa):
        """
        Calcula h y s con T [°C] y P absoluta [Pa].
        """

        T_K = self.celsius_to_kelvin(T_C)
        P_Pa = float(P_Pa)

        h = PropsSI("H", "T", T_K, "P", P_Pa, self.fluid)
        s = PropsSI("S", "T", T_K, "P", P_Pa, self.fluid)

        try:
            phase = PhaseSI("T", T_K, "P", P_Pa, self.fluid)
        except Exception:
            phase = "unknown"

        return {
            "T_K": T_K,
            "P_Pa": P_Pa,
            "h_J_kg": h,
            "s_J_kgK": s,
            "phase": phase
        }

    def calculate_dead_state(self, T_ambiente_C):
        """
        Estado muerto: T0 = temperatura ambiente, P0 = presión ambiente.
        """

        T0_K = self.celsius_to_kelvin(T_ambiente_C)

        h0 = PropsSI("H", "T", T0_K, "P", self.P0_Pa, self.fluid)
        s0 = PropsSI("S", "T", T0_K, "P", self.P0_Pa, self.fluid)

        return {
            "T0_K": T0_K,
            "P0_Pa": self.P0_Pa,
            "h0_J_kg": h0,
            "s0_J_kgK": s0
        }

    def calculate_single_case(
        self,
        T_ambiente_C,
        T_cabeza_C,
        P_cabeza_Pa,
        flujo_masico_kg_s
    ):
        state = self.calculate_properties_TP(
            T_C=T_cabeza_C,
            P_Pa=P_cabeza_Pa
        )

        dead_state = self.calculate_dead_state(
            T_ambiente_C=T_ambiente_C
        )

        h = state["h_J_kg"]
        s = state["s_J_kgK"]

        h0 = dead_state["h0_J_kg"]
        s0 = dead_state["s0_J_kgK"]
        T0_K = dead_state["T0_K"]

        exergia_J_kg = (h - h0) - T0_K * (s - s0)

        if not np.isfinite(exergia_J_kg):
            raise ValueError("La exergía calculada no es finita.")

        exergia_J_kg = max(exergia_J_kg, 0.0)

        Pmax_kW = float(flujo_masico_kg_s) * exergia_J_kg / 1000.0

        return {
            "h_J_kg": h,
            "s_J_kgK": s,
            "h0_J_kg": h0,
            "s0_J_kgK": s0,
            "exergia_J_kg": exergia_J_kg,
            "Pmax_conceptual_kW": Pmax_kW,
            "phase": state["phase"],
            "status": "ok"
        }

    def add_exergy_columns(
        self,
        df,
        col_T_ambiente,
        col_T_cabeza,
        col_P_cabeza_Pa,
        col_flujo_masico,
        col_h="h_J_kg",
        col_s="s_J_kgK",
        col_h0="h0_J_kg",
        col_s0="s0_J_kgK",
        col_exergia="exergia_J_kg",
        col_pmax="Pmax_conceptual_kW",
        col_status="exergy_status"
    ):
        results = []

        for _, row in df.iterrows():
            try:
                result = self.calculate_single_case(
                    T_ambiente_C=row[col_T_ambiente],
                    T_cabeza_C=row[col_T_cabeza],
                    P_cabeza_Pa=row[col_P_cabeza_Pa],
                    flujo_masico_kg_s=row[col_flujo_masico]
                )

                result_row = {
                    col_h: result["h_J_kg"],
                    col_s: result["s_J_kgK"],
                    col_h0: result["h0_J_kg"],
                    col_s0: result["s0_J_kgK"],
                    col_exergia: result["exergia_J_kg"],
                    col_pmax: result["Pmax_conceptual_kW"],
                    "fase": result["phase"],
                    col_status: result["status"]
                }

            except Exception as e:
                result_row = {
                    col_h: np.nan,
                    col_s: np.nan,
                    col_h0: np.nan,
                    col_s0: np.nan,
                    col_exergia: np.nan,
                    col_pmax: np.nan,
                    "fase": "error",
                    col_status: str(e)
                }

            results.append(result_row)

        df_exergy = pd.DataFrame(results, index=df.index)

        return pd.concat([df.copy(), df_exergy], axis=1)