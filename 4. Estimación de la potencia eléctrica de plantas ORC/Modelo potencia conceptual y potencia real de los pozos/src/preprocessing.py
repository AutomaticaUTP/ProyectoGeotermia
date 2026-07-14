import pandas as pd

from src.units import (
    pressure_series_to_pa,
    bpd_to_kg_s_coolprop_from_pa,
    gpm_to_kg_s_constant_density
)


def convert_numeric_columns(df, columns):
    """
    Convierte columnas a numéricas y soporta coma decimal.
    """

    df = df.copy()

    for col in columns:
        if col in df.columns:
            df[col] = (
                df[col]
                .astype(str)
                .str.replace(",", ".", regex=False)
            )
            df[col] = pd.to_numeric(df[col], errors="coerce")

    return df


class ResourceDataProcessor:
    """
    Procesa la base 1: recurso geotérmico.

    La presión puede venir en diferentes unidades:
    psig, psia, bar_abs, barg, kPa, MPa, etc.
    """

    def __init__(self, config, general_config):
        self.config = config
        self.general_config = general_config

    def load(self):
        df = pd.read_csv(self.config.path)

        numeric_cols = [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_P_cabeza,
            self.config.col_flujo_bpd
        ]

        df = convert_numeric_columns(df, numeric_cols)

        return df

    def add_pressure_pa_column(self, df):
        """
        Convierte la presión original a Pa absolutos.
        """

        df = df.copy()

        df[self.config.col_P_cabeza_Pa] = pressure_series_to_pa(
            values=df[self.config.col_P_cabeza].values,
            units=df[self.config.col_unidad_presion].values,
            p_atm_pa=self.general_config.p_atm_pa,
            p_atm_psi=self.general_config.p_atm_psi
        )

        return df

    def add_mass_flow_column(self, df):
        """
        Convierte flujo_bpd a flujo_másico kg/s.

        Usa densidad calculada con CoolProp mediante:
        rho = rho(T_cabeza, P_cabeza_Pa)
        """

        df = df.copy()

        df[self.config.col_flujo_masico] = bpd_to_kg_s_coolprop_from_pa(
            q_bpd=df[self.config.col_flujo_bpd].values,
            T_C=df[self.config.col_T_cabeza].values,
            P_Pa=df[self.config.col_P_cabeza_Pa].values,
            fluid=self.general_config.fluid
        )

        return df

    def clean_before_exergy(self, df):
        """
        Limpieza antes del análisis exergético.
        """

        required_cols = [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_P_cabeza,
            self.config.col_unidad_presion,
            self.config.col_P_cabeza_Pa,
            self.config.col_flujo_bpd,
            self.config.col_flujo_masico
        ]

        df_clean = df.dropna(subset=required_cols).copy()

        df_clean = df_clean[df_clean[self.config.col_P_cabeza_Pa] > 0]
        df_clean = df_clean[df_clean[self.config.col_flujo_bpd] > 0]
        df_clean = df_clean[df_clean[self.config.col_flujo_masico] > 0]

        df_clean = df_clean[
            df_clean[self.config.col_T_cabeza]
            > df_clean[self.config.col_T_ambiente]
        ]

        return df_clean.reset_index(drop=True)

    def clean_after_exergy(self, df):
        required_cols = [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_flujo_masico,
            self.config.col_pmax
        ]

        df_clean = df.dropna(subset=required_cols).copy()

        df_clean = df_clean[df_clean[self.config.col_flujo_masico] > 0]
        df_clean = df_clean[df_clean[self.config.col_pmax] >= 0]

        return df_clean.reset_index(drop=True)

    def get_ml_feature_columns(self):
        """
        Variables usadas en los modelos ML.

        La presión no entra al modelo.
        """

        return [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_flujo_masico
        ]

    def get_features_for_pmax_model(self, df):
        X = df[self.get_ml_feature_columns()]
        y = df[self.config.col_pmax]

        return X, y

    def get_common_features_for_prediction(self, df):
        return df[self.get_ml_feature_columns()]


class ORCRealDataProcessor:
    """
    Procesa la base 2: datos reales ORC.
    """

    def __init__(self, config, general_config):
        self.config = config
        self.general_config = general_config

    def load(self):
        df = pd.read_csv(self.config.path)

        numeric_cols = [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_flujo_gpm,
            self.config.col_potencia_real
        ]

        df = convert_numeric_columns(df, numeric_cols)

        return df

    def add_mass_flow_column(self, df):
        """
        Convierte GPM a kg/s usando densidad constante.
        """

        df = df.copy()

        df[self.config.col_flujo_masico] = gpm_to_kg_s_constant_density(
            q_gpm=df[self.config.col_flujo_gpm].values,
            density_kg_m3=self.general_config.constant_density_kg_m3
        )

        return df

    def clean(self, df):
        required_cols = [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_flujo_masico,
            self.config.col_potencia_real
        ]

        df_clean = df.dropna(subset=required_cols).copy()

        df_clean = df_clean[df_clean[self.config.col_flujo_masico] > 0]
        df_clean = df_clean[df_clean[self.config.col_potencia_real] >= 0]

        df_clean = df_clean[
            df_clean[self.config.col_T_cabeza]
            > df_clean[self.config.col_T_ambiente]
        ]

        return df_clean.reset_index(drop=True)

    def get_ml_feature_columns(self):
        return [
            self.config.col_T_ambiente,
            self.config.col_T_cabeza,
            self.config.col_flujo_masico
        ]

    def get_features_and_target(self, df):
        X = df[self.get_ml_feature_columns()]
        y = df[self.config.col_potencia_real]

        return X, y