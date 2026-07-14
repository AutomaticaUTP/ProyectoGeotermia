import os
import numpy as np
import pandas as pd

from src.config import (
    GeneralConfig,
    ResourceDatabaseConfig,
    ORCRealDatabaseConfig
)

from src.exergy import ExergyAnalyzer

from src.preprocessing import (
    ResourceDataProcessor,
    ORCRealDataProcessor
)

from src.models import SingleTargetModelTrainer

from src.results import (
    save_results_table,
    print_basic_ranges,
    plot_bayesian_prediction_with_confidence,
    plot_pmax_vs_preal_base1
)


def create_project_directories():
    """
    Crea carpetas necesarias para guardar datos, modelos, resultados y figuras.
    """

    os.makedirs("data", exist_ok=True)
    os.makedirs("models", exist_ok=True)
    os.makedirs("results", exist_ok=True)
    os.makedirs("figures", exist_ok=True)


def main():
    create_project_directories()

    # =====================================================
    # 1. Configuración general
    # =====================================================

    general_config = GeneralConfig(
        fluid="IF97::Water",
        P0_Pa=101325.0,
        p_atm_pa=101325.0,
        p_atm_psi=14.6959488,
        test_size=0.20,
        random_state=42,
        constant_density_kg_m3=997.0
    )

    resource_config = ResourceDatabaseConfig(
        path="data/base_recurso_2.csv"
    )

    orc_config = ORCRealDatabaseConfig(
        path="data/base_orc_real_2.csv"
    )

    # =====================================================
    # 2. Cargar y preparar BASE 1: recurso geotérmico
    # =====================================================

    resource_processor = ResourceDataProcessor(
        config=resource_config,
        general_config=general_config
    )

    df_recurso = resource_processor.load()

    print("\nBase 1 original - recurso geotérmico:")
    print(df_recurso.head())

    # Convertir presión a Pa absolutos
    df_recurso = resource_processor.add_pressure_pa_column(df_recurso)

    print("\nBase 1 con presión convertida a Pa:")
    print(
        df_recurso[
            [
                resource_config.col_T_cabeza,
                resource_config.col_P_cabeza,
                resource_config.col_unidad_presion,
                resource_config.col_P_cabeza_Pa
            ]
        ].head()
    )

    # Convertir flujo de barriles/día a kg/s
    df_recurso = resource_processor.add_mass_flow_column(df_recurso)

    print("\nBase 1 con flujo másico calculado:")
    print(
        df_recurso[
            [
                resource_config.col_T_ambiente,
                resource_config.col_T_cabeza,
                resource_config.col_P_cabeza,
                resource_config.col_unidad_presion,
                resource_config.col_P_cabeza_Pa,
                resource_config.col_flujo_bpd,
                resource_config.col_flujo_masico
            ]
        ].head()
    )

    # Limpiar antes del análisis exergético
    df_recurso = resource_processor.clean_before_exergy(df_recurso)

    print("\nBase 1 limpia antes del análisis exergético:")
    print(df_recurso.head())

    # =====================================================
    # 3. Análisis exergético sobre BASE 1
    # =====================================================

    exergy_analyzer = ExergyAnalyzer(
        fluid=general_config.fluid,
        P0_Pa=general_config.P0_Pa
    )

    df_recurso_exergia = exergy_analyzer.add_exergy_columns(
        df=df_recurso,
        col_T_ambiente=resource_config.col_T_ambiente,
        col_T_cabeza=resource_config.col_T_cabeza,
        col_P_cabeza_Pa=resource_config.col_P_cabeza_Pa,
        col_flujo_masico=resource_config.col_flujo_masico,
        col_h=resource_config.col_h,
        col_s=resource_config.col_s,
        col_h0=resource_config.col_h0,
        col_s0=resource_config.col_s0,
        col_exergia=resource_config.col_exergia,
        col_pmax=resource_config.col_pmax,
        col_status=resource_config.col_exergy_status
    )

    df_recurso_exergia.to_csv(
        "results/base_recurso_con_exergia.csv",
        index=False
    )

    print("\nBase 1 con análisis exergético:")
    print(df_recurso_exergia.head())

    # Limpiar después de calcular Pmax conceptual
    df_recurso_clean = resource_processor.clean_after_exergy(
        df_recurso_exergia
    )

    print("\nBase 1 limpia después del análisis exergético:")
    print(df_recurso_clean.head())

    # =====================================================
    # 4. Entrenar modelo de potencia máxima conceptual
    # =====================================================

    X_pmax, y_pmax = resource_processor.get_features_for_pmax_model(
        df_recurso_clean
    )

    trainer_pmax = SingleTargetModelTrainer(
        target_name="Pmax conceptual",
        test_size=general_config.test_size,
        random_state=general_config.random_state
    )

    results_pmax = trainer_pmax.train_and_evaluate(
        X=X_pmax,
        y=y_pmax,
        figure_prefix="pmax"
    )

    trainer_pmax.save_best_model(
        "models/modelo_pmax_conceptual.joblib"
    )

    # =====================================================
    # 5. Cargar y preparar BASE 2: planta ORC real
    # =====================================================

    orc_processor = ORCRealDataProcessor(
        config=orc_config,
        general_config=general_config
    )

    df_orc = orc_processor.load()

    print("\nBase 2 original - planta ORC real:")
    print(df_orc.head())

    # Convertir GPM a kg/s
    df_orc = orc_processor.add_mass_flow_column(df_orc)

    # Limpiar base 2
    df_orc_clean = orc_processor.clean(df_orc)

    df_orc_clean.to_csv(
        "results/base_orc_real_procesada.csv",
        index=False
    )

    print("\nBase 2 procesada con flujo másico:")
    print(df_orc_clean.head())

    # =====================================================
    # 6. Entrenar modelo de potencia real ORC
    # =====================================================

    X_real, y_real = orc_processor.get_features_and_target(
        df_orc_clean
    )

    trainer_real = SingleTargetModelTrainer(
        target_name="Potencia real ORC",
        test_size=general_config.test_size,
        random_state=general_config.random_state
    )

    results_real = trainer_real.train_and_evaluate(
        X=X_real,
        y=y_real,
        figure_prefix="potencia_real_orc"
    )

    trainer_real.save_best_model(
        "models/modelo_potencia_real_orc.joblib"
    )

    # =====================================================
    # 7. Revisión de rangos de entrenamiento y aplicación
    # =====================================================

    common_cols = resource_processor.get_ml_feature_columns()

    print_basic_ranges(
        df=df_recurso_clean,
        columns=common_cols,
        name="Base 1 recurso"
    )

    print_basic_ranges(
        df=df_orc_clean,
        columns=common_cols,
        name="Base 2 ORC real"
    )

    # =====================================================
    # 8. Aplicar ambos modelos sobre BASE 1
    # =====================================================

    X_recurso_common = resource_processor.get_common_features_for_prediction(
        df_recurso_clean
    )

    # Predicción de Pmax conceptual sobre base 1
    df_recurso_clean["Pmax_ML_kW"] = trainer_pmax.predict(
        X_recurso_common
    )

    # Predicción de potencia real ORC sobre base 1
    df_recurso_clean["P_real_ORC_ML_kW"] = trainer_real.predict(
        X_recurso_common
    )

    # =====================================================
    # 9. Predicción bayesiana con incertidumbre sobre BASE 1
    # =====================================================

    # Potencia real ORC con Bayesian Ridge
    preal_bayes_mean, preal_bayes_std = trainer_real.predict_with_uncertainty(
        X_recurso_common,
        model_name="Bayesian Ridge"
    )

    df_recurso_clean["P_real_ORC_Bayes_kW"] = preal_bayes_mean
    df_recurso_clean["P_real_ORC_Bayes_std_kW"] = preal_bayes_std

    # Potencia máxima conceptual con Bayesian Ridge
    pmax_bayes_mean, pmax_bayes_std = trainer_pmax.predict_with_uncertainty(
        X_recurso_common,
        model_name="Bayesian Ridge"
    )

    df_recurso_clean["Pmax_Bayes_kW"] = pmax_bayes_mean
    df_recurso_clean["Pmax_Bayes_std_kW"] = pmax_bayes_std

    # =====================================================
    # 10. Relaciones diagnósticas
    # =====================================================

    df_recurso_clean["relacion_Preal_ML_Pmax_exergia"] = (
        df_recurso_clean["P_real_ORC_ML_kW"]
        / df_recurso_clean[resource_config.col_pmax].replace(0, np.nan)
    )

    df_recurso_clean["relacion_Preal_ML_Pmax_ML"] = (
        df_recurso_clean["P_real_ORC_ML_kW"]
        / df_recurso_clean["Pmax_ML_kW"].replace(0, np.nan)
    )

    df_recurso_clean["relacion_Preal_Bayes_Pmax_exergia"] = (
        df_recurso_clean["P_real_ORC_Bayes_kW"]
        / df_recurso_clean[resource_config.col_pmax].replace(0, np.nan)
    )

    # =====================================================
    # 11. Guardar predicciones sobre BASE 1
    # =====================================================

    df_recurso_clean.to_csv(
        "results/predicciones_base_recurso.csv",
        index=False
    )

    # =====================================================
    # 12. Gráficas sobre BASE 1
    # =====================================================

    plot_bayesian_prediction_with_confidence(
        y_mean=df_recurso_clean["P_real_ORC_Bayes_kW"].values,
        y_std=df_recurso_clean["P_real_ORC_Bayes_std_kW"].values,
        title="Estimación bayesiana de potencia real ORC con región de confianza - Base 1",
        ylabel="Potencia real ORC estimada [kW]",
        path="figures/base1_bayes_potencia_real_confianza.png",
        confidence_multiplier=1.96,
        sort_by_mean=False
    )

    plot_bayesian_prediction_with_confidence(
        y_mean=df_recurso_clean["Pmax_Bayes_kW"].values,
        y_std=df_recurso_clean["Pmax_Bayes_std_kW"].values,
        title="Estimación bayesiana de potencia máxima conceptual con región de confianza - Base 1",
        ylabel="Potencia máxima conceptual estimada [kW]",
        path="figures/base1_bayes_pmax_confianza.png",
        confidence_multiplier=1.96,
        sort_by_mean=False
    )

    plot_pmax_vs_preal_base1(
        pmax_exergia=df_recurso_clean[resource_config.col_pmax].values,
        preal_ml=df_recurso_clean["P_real_ORC_ML_kW"].values,
        pmax_ml=df_recurso_clean["Pmax_ML_kW"].values,
        path="figures/base1_pmax_vs_preal.png",
        sort_by_pmax=False
    )

    # =====================================================
    # 13. Guardar métricas de entrenamiento
    # =====================================================

    all_results = results_pmax + results_real

    df_results = save_results_table(
        results=all_results,
        path="results/metricas_entrenamiento.csv"
    )

    print("\nMétricas finales:")
    print(df_results)

    # =====================================================
    # 14. Mostrar resumen de predicciones
    # =====================================================

    print("\nPredicciones sobre la base 1:")
    print(
        df_recurso_clean[
            [
                resource_config.col_T_ambiente,
                resource_config.col_T_cabeza,
                resource_config.col_P_cabeza,
                resource_config.col_unidad_presion,
                resource_config.col_P_cabeza_Pa,
                resource_config.col_flujo_bpd,
                resource_config.col_flujo_masico,
                resource_config.col_pmax,
                "Pmax_ML_kW",
                "Pmax_Bayes_kW",
                "P_real_ORC_ML_kW",
                "P_real_ORC_Bayes_kW",
                "P_real_ORC_Bayes_std_kW",
                "relacion_Preal_ML_Pmax_exergia"
            ]
        ].head()
    )

    print("\nArchivos generados:")
    print("results/base_recurso_con_exergia.csv")
    print("results/base_orc_real_procesada.csv")
    print("results/predicciones_base_recurso.csv")
    print("results/metricas_entrenamiento.csv")
    print("models/modelo_pmax_conceptual.joblib")
    print("models/modelo_potencia_real_orc.joblib")
    print("figures/base1_bayes_potencia_real_confianza.png")
    print("figures/base1_bayes_pmax_confianza.png")
    print("figures/base1_pmax_vs_preal.png")


if __name__ == "__main__":
    main()