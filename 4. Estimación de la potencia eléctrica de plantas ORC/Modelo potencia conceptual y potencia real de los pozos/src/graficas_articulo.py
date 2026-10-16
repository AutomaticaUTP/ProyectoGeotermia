import os

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.metrics import (
    mean_absolute_error,
    mean_squared_error,
    r2_score
)


# ============================================================
# CONFIGURACIÓN GENERAL
# ============================================================

COL_T_AMBIENTE = "T_ambiente_C"
COL_T_CABEZA = "T_cabeza_C"
COL_FLUJO_MASICO = "flujo_masico_kg_s"

COL_PMAX = "Pmax_conceptual_kW"
COL_PREAL = "P_real_ORC_ML_kW"


# ============================================================
# FUNCIONES AUXILIARES
# ============================================================

def _crear_directorio(path):
    directory = os.path.dirname(path)

    if directory:
        os.makedirs(
            directory,
            exist_ok=True
        )


def _guardar_figura(
    fig,
    output_base,
    dpi=600
):
    """
    Guarda cada figura en PNG y PDF.

    output_base debe darse sin extensión.
    """

    _crear_directorio(output_base)

    png_path = output_base + ".png"
    pdf_path = output_base + ".pdf"

    fig.tight_layout()

    fig.savefig(
        png_path,
        dpi=dpi,
        bbox_inches="tight"
    )

    fig.savefig(
        pdf_path,
        bbox_inches="tight"
    )

    plt.close(fig)

    return {
        "png": png_path,
        "pdf": pdf_path
    }


def _limpiar_xy(
    x,
    y
):
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)

    mask = (
        np.isfinite(x)
        &
        np.isfinite(y)
    )

    return x[mask], y[mask]


def _calcular_metricas(
    y_true,
    y_pred
):
    y_true, y_pred = _limpiar_xy(
        y_true,
        y_pred
    )

    mae = mean_absolute_error(
        y_true,
        y_pred
    )

    rmse = np.sqrt(
        mean_squared_error(
            y_true,
            y_pred
        )
    )

    r2 = r2_score(
        y_true,
        y_pred
    )

    return {
        "MAE": mae,
        "RMSE": rmse,
        "R2": r2
    }


def _obtener_test_trainer(
    trainer
):
    """
    Obtiene datos de prueba y predicciones a partir de un
    BayesianModelTrainer ya entrenado.
    """

    if trainer.model is None:
        raise RuntimeError(
            "El modelo todavía no ha sido entrenado."
        )

    if (
        trainer.X_test is None
        or trainer.y_test is None
    ):
        raise RuntimeError(
            "El trainer no contiene X_test/y_test. "
            "Ejecuta train_and_evaluate() antes de generar "
            "las gráficas."
        )

    y_true = np.asarray(
        trainer.y_test,
        dtype=float
    )

    y_pred = np.asarray(
        trainer.predict(
            trainer.X_test
        ),
        dtype=float
    )

    return (
        trainer.X_test,
        y_true,
        y_pred
    )


# ============================================================
# 1. PARITY PLOT
# ============================================================

def plot_parity(
    y_true,
    y_pred,
    xlabel,
    ylabel,
    title,
    output_base
):
    """
    Gráfico de valores reales/calculados frente a predichos.
    Incluye línea ideal y = x y métricas de validación.
    """

    y_true, y_pred = _limpiar_xy(
        y_true,
        y_pred
    )

    if len(y_true) == 0:
        raise ValueError(
            "No hay valores válidos para generar el parity plot."
        )

    metrics = _calcular_metricas(
        y_true,
        y_pred
    )

    minimo = min(
        np.min(y_true),
        np.min(y_pred)
    )

    maximo = max(
        np.max(y_true),
        np.max(y_pred)
    )

    rango = maximo - minimo

    if rango == 0:
        rango = 1.0

    margen = 0.05 * rango

    limite_inf = minimo - margen
    limite_sup = maximo + margen

    fig, ax = plt.subplots(
        figsize=(6.8, 6.2)
    )

    ax.scatter(
        y_true,
        y_pred,
        s=32,
        alpha=0.70
    )

    ax.plot(
        [limite_inf, limite_sup],
        [limite_inf, limite_sup],
        linestyle="--",
        linewidth=1.5,
        label="Línea ideal y = x"
    )

    ax.set_xlim(
        limite_inf,
        limite_sup
    )

    ax.set_ylim(
        limite_inf,
        limite_sup
    )

    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_title(title)

    ax.grid(
        alpha=0.25
    )

    ax.legend()

    texto_metricas = (
        f"$R^2$ = {metrics['R2']:.3f}\n"
        f"RMSE = {metrics['RMSE']:.3f} kW\n"
        f"MAE = {metrics['MAE']:.3f} kW"
    )

    ax.text(
        0.04,
        0.96,
        texto_metricas,
        transform=ax.transAxes,
        va="top",
        ha="left",
        fontsize=10,
        bbox=dict(
            boxstyle="round",
            alpha=0.15
        )
    )

    return _guardar_figura(
        fig,
        output_base
    )


# ============================================================
# 2. GRÁFICO DE RESIDUOS
# ============================================================

def plot_residuos(
    y_true,
    y_pred,
    title,
    output_base
):
    """
    Residuo:
        e = y_real - y_predicho

    Se grafica frente al valor predicho.
    """

    y_true, y_pred = _limpiar_xy(
        y_true,
        y_pred
    )

    if len(y_true) == 0:
        raise ValueError(
            "No hay valores válidos para generar residuos."
        )

    residuos = (
        y_true
        -
        y_pred
    )

    fig, ax = plt.subplots(
        figsize=(7.2, 5.2)
    )

    ax.scatter(
        y_pred,
        residuos,
        s=32,
        alpha=0.70
    )

    ax.axhline(
        0,
        linestyle="--",
        linewidth=1.5
    )

    ax.set_xlabel(
        "Potencia predicha [kW]"
    )

    ax.set_ylabel(
        "Residuo: real - predicha [kW]"
    )

    ax.set_title(title)

    ax.grid(
        alpha=0.25
    )

    return _guardar_figura(
        fig,
        output_base
    )


# ============================================================
# 3. DIAGRAMA DE CONTORNO DEL MODELO DE POTENCIA REAL
# ============================================================

def plot_contorno_preal(
    trainer_real,
    output_base,
    n_grid=140
):
    """
    Superficie de respuesta 2D del modelo ORC.

    Ejes:
        X = temperatura en cabeza
        Y = flujo másico
        Color = potencia real ORC predicha

    La temperatura ambiente se fija en la mediana del
    conjunto de entrenamiento.

    IMPORTANTE:
    La presión en cabeza no se incluye aquí porque no es una
    variable de entrada del regresor de potencia real ORC.
    """

    if trainer_real.model is None:
        raise RuntimeError(
            "El modelo ORC todavía no ha sido entrenado."
        )

    X_train = trainer_real.X_train

    if not isinstance(
        X_train,
        pd.DataFrame
    ):
        raise TypeError(
            "X_train debe ser un pandas.DataFrame para generar "
            "el diagrama de contorno."
        )

    required = [
        COL_T_AMBIENTE,
        COL_T_CABEZA,
        COL_FLUJO_MASICO
    ]

    missing = [
        col
        for col in required
        if col not in X_train.columns
    ]

    if missing:
        raise ValueError(
            "Faltan variables de entrada para el contorno: "
            f"{missing}"
        )

    # Se mantiene el gráfico dentro del dominio de entrenamiento.
    t_min = float(
        X_train[COL_T_CABEZA].min()
    )

    t_max = float(
        X_train[COL_T_CABEZA].max()
    )

    m_min = float(
        X_train[COL_FLUJO_MASICO].min()
    )

    m_max = float(
        X_train[COL_FLUJO_MASICO].max()
    )

    t_amb_mediana = float(
        X_train[COL_T_AMBIENTE].median()
    )

    t_values = np.linspace(
        t_min,
        t_max,
        n_grid
    )

    m_values = np.linspace(
        m_min,
        m_max,
        n_grid
    )

    T_grid, M_grid = np.meshgrid(
        t_values,
        m_values
    )

    grid = pd.DataFrame({
        COL_T_AMBIENTE: np.full(
            T_grid.size,
            t_amb_mediana
        ),
        COL_T_CABEZA: T_grid.ravel(),
        COL_FLUJO_MASICO: M_grid.ravel()
    })

    # Mantener exactamente el orden utilizado en entrenamiento.
    grid = grid[
        list(X_train.columns)
    ]

    P_grid = trainer_real.predict(
        grid
    ).reshape(
        T_grid.shape
    )

    fig, ax = plt.subplots(
        figsize=(8.0, 6.0)
    )

    # --------------------------------------------------------
    # CONTORNO: fondo más suave y más transparente
    # --------------------------------------------------------
    contour = ax.contourf(
        T_grid,
        M_grid,
        P_grid,
        levels=20,
        cmap="YlGnBu",
        alpha=0.80
    )

    # Líneas de contorno para mejorar lectura
    ax.contour(
        T_grid,
        M_grid,
        P_grid,
        levels=10,
        colors="white",
        linewidths=0.7,
        alpha=0.70
    )

    # --------------------------------------------------------
    # PUNTOS: más visibles, más grandes y con borde
    # --------------------------------------------------------
    ax.scatter(
        X_train[COL_T_CABEZA],
        X_train[COL_FLUJO_MASICO],
        s=24,
        alpha=0.90,
        color="#8E2C2C",
        edgecolor="white",
        linewidth=0.4,
        label="Datos de entrenamiento ORC",
        zorder=4
    )

    cbar = fig.colorbar(
        contour,
        ax=ax
    )

    cbar.set_label(
        "Potencia real ORC estimada [kW]"
    )

    ax.set_xlabel(
        "Temperatura en cabeza [°C]"
    )

    ax.set_ylabel(
        "Flujo másico [kg/s]"
    )

    ax.set_title(
        "Superficie de respuesta del modelo ORC\n"
        f"$T_{{amb}}$ fija = {t_amb_mediana:.2f} °C"
    )

    ax.legend()
    ax.grid(
        alpha=0.15
    )

    return _guardar_figura(
        fig,
        output_base
    )


# ============================================================
# 4. PMAX CONCEPTUAL VS POTENCIA REAL ORC ESTIMADA
# ============================================================

def plot_pmax_vs_preal(
    df_recurso,
    output_base,
    col_pmax=COL_PMAX,
    col_preal=COL_PREAL
):
    """
    Compara la potencia máxima conceptual del recurso con la
    potencia real ORC estimada para cada pozo.
    """

    required = [
        col_pmax,
        col_preal
    ]

    missing = [
        col
        for col in required
        if col not in df_recurso.columns
    ]

    if missing:
        raise ValueError(
            "Faltan columnas para Pmax vs Preal: "
            f"{missing}"
        )

    pmax, preal = _limpiar_xy(
        df_recurso[col_pmax],
        df_recurso[col_preal]
    )

    if len(pmax) == 0:
        raise ValueError(
            "No hay valores válidos para Pmax vs Preal."
        )

    minimo = min(
        np.min(pmax),
        np.min(preal)
    )

    maximo = max(
        np.max(pmax),
        np.max(preal)
    )

    rango = maximo - minimo

    if rango == 0:
        rango = 1.0

    margen = 0.05 * rango

    limite_inf = minimo - margen
    limite_sup = maximo + margen

    fig, ax = plt.subplots(
        figsize=(6.8, 6.2)
    )

    ax.scatter(
        pmax,
        preal,
        s=32,
        alpha=0.65
    )

    ax.plot(
        [limite_inf, limite_sup],
        [limite_inf, limite_sup],
        linestyle="--",
        linewidth=1.5,
        label="$P_{real}=P_{max}$"
    )

    ax.set_xlim(
        limite_inf,
        limite_sup
    )

    ax.set_ylim(
        limite_inf,
        limite_sup
    )

    ax.set_xlabel(
        "Potencia máxima conceptual [kW]"
    )

    ax.set_ylabel(
        "Potencia real ORC estimada [kW]"
    )

    ax.set_title(
        "Potencia máxima conceptual vs potencia real ORC estimada"
    )

    ax.grid(
        alpha=0.25
    )

    ax.legend()

    validos_pmax = pmax > 0

    if np.any(validos_pmax):
        R = (
            preal[validos_pmax]
            /
            pmax[validos_pmax]
        )

        porcentaje_r_menor_igual_1 = (
            np.mean(
                R <= 1
            )
            * 100
        )

        ax.text(
            0.04,
            0.96,
            (
                f"Pozos: {len(pmax)}\n"
                f"$R=P_{{real}}/P_{{max}} \\leq 1$: "
                f"{porcentaje_r_menor_igual_1:.1f}%"
            ),
            transform=ax.transAxes,
            va="top",
            ha="left",
            fontsize=10,
            bbox=dict(
                boxstyle="round",
                alpha=0.15
            )
        )

    return _guardar_figura(
        fig,
        output_base
    )


# ============================================================
# FUNCIÓN PRINCIPAL
# ============================================================

def generar_graficas_articulo(
    trainer_pmax,
    trainer_real,
    df_recurso,
    output_dir="figures/articulo"
):
    """
    Genera todas las figuras principales para el artículo:

    1. Parity plot de Pmax.
    2. Parity plot de Preal ORC.
    3. Residuos de Pmax.
    4. Residuos de Preal ORC.
    5. Diagrama de contorno de Preal ORC.
    6. Pmax conceptual vs Preal ORC estimada.

    Los parity plots y residuos usan exclusivamente el conjunto
    TEST de cada modelo.
    """

    os.makedirs(
        output_dir,
        exist_ok=True
    )

    # --------------------------------------------------------
    # Datos TEST - modelo Pmax
    # --------------------------------------------------------

    (
        _,
        y_pmax_true,
        y_pmax_pred
    ) = _obtener_test_trainer(
        trainer_pmax
    )

    # --------------------------------------------------------
    # Datos TEST - modelo potencia real ORC
    # --------------------------------------------------------

    (
        _,
        y_real_true,
        y_real_pred
    ) = _obtener_test_trainer(
        trainer_real
    )

    resultados = {}

    # --------------------------------------------------------
    # Parity Pmax
    # --------------------------------------------------------

    resultados["parity_pmax"] = plot_parity(
        y_true=y_pmax_true,
        y_pred=y_pmax_pred,
        xlabel="Potencia máxima conceptual [kW]",
        ylabel="Potencia máxima predicha [kW]",
        title="Parity plot - potencia máxima conceptual",
        output_base=os.path.join(
            output_dir,
            "parity_pmax"
        )
    )

    # --------------------------------------------------------
    # Parity Preal
    # --------------------------------------------------------

    resultados["parity_preal"] = plot_parity(
        y_true=y_real_true,
        y_pred=y_real_pred,
        xlabel="Potencia real ORC [kW]",
        ylabel="Potencia real ORC predicha [kW]",
        title="Parity plot - potencia real ORC",
        output_base=os.path.join(
            output_dir,
            "parity_preal_orc"
        )
    )

    # --------------------------------------------------------
    # Residuos Pmax
    # --------------------------------------------------------

    resultados["residuos_pmax"] = plot_residuos(
        y_true=y_pmax_true,
        y_pred=y_pmax_pred,
        title="Residuos - potencia máxima conceptual",
        output_base=os.path.join(
            output_dir,
            "residuos_pmax"
        )
    )

    # --------------------------------------------------------
    # Residuos Preal
    # --------------------------------------------------------

    resultados["residuos_preal"] = plot_residuos(
        y_true=y_real_true,
        y_pred=y_real_pred,
        title="Residuos - potencia real ORC",
        output_base=os.path.join(
            output_dir,
            "residuos_preal_orc"
        )
    )

    # --------------------------------------------------------
    # Contorno Preal
    # --------------------------------------------------------

    resultados["contorno_preal"] = plot_contorno_preal(
        trainer_real=trainer_real,
        output_base=os.path.join(
            output_dir,
            "contorno_preal_orc"
        )
    )

    # --------------------------------------------------------
    # Pmax vs Preal sobre los pozos
    # --------------------------------------------------------

    resultados["pmax_vs_preal"] = plot_pmax_vs_preal(
        df_recurso=df_recurso,
        output_base=os.path.join(
            output_dir,
            "pmax_vs_preal"
        )
    )

    print(
        "\nGráficas del artículo generadas correctamente."
    )

    for nombre, paths in resultados.items():
        print(
            f"- {nombre}: "
            f"{paths['png']} | {paths['pdf']}"
        )

    return resultados
