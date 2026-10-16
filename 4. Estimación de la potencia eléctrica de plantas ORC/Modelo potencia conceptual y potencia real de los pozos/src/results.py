import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter, MaxNLocator

from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score


# ============================================================
# Métricas y resultados
# ============================================================

def evaluate_regression(y_true, y_pred, model_name, target_name, dataset_name):
    """
    Calcula métricas de regresión.

    dataset_name puede ser:
    - train
    - test
    - validación
    - aplicación
    """

    mae = mean_absolute_error(y_true, y_pred)
    rmse = np.sqrt(mean_squared_error(y_true, y_pred))
    r2 = r2_score(y_true, y_pred)

    return {
        "modelo": model_name,
        "salida": target_name,
        "conjunto": dataset_name,
        "MAE": mae,
        "RMSE": rmse,
        "R2": r2
    }


def save_results_table(results, path):
    df_results = pd.DataFrame(results)
    os.makedirs(os.path.dirname(path), exist_ok=True)
    df_results.to_csv(path, index=False)
    return df_results


def print_basic_ranges(df, columns, name):
    print(f"\nRangos de variables - {name}")
    print(df[columns].describe())


# ============================================================
# Estilo general para figuras
# ============================================================

def apply_elegant_style():
    """
    Configura un estilo visual más limpio para las figuras.
    """

    plt.rcParams.update({
        "figure.dpi": 120,
        "savefig.dpi": 350,
        "font.family": "DejaVu Sans",
        "font.size": 11,
        "axes.titlesize": 15,
        "axes.labelsize": 12,
        "axes.titleweight": "bold",
        "axes.labelweight": "regular",
        "xtick.labelsize": 10,
        "ytick.labelsize": 10,
        "legend.fontsize": 10,
        "axes.spines.top": False,
        "axes.spines.right": False,
        "axes.grid": True,
        "grid.alpha": 0.25,
        "grid.linestyle": "-",
        "grid.linewidth": 0.7,
        "axes.facecolor": "#FAFAFA",
        "figure.facecolor": "white"
    })


def format_kw(value, pos=None):
    """
    Formato compacto para eje de potencia.
    """

    if abs(value) >= 1_000_000:
        return f"{value / 1_000_000:.1f}M"

    if abs(value) >= 1000:
        return f"{value / 1000:.1f}k"

    return f"{value:.0f}"


def save_figure(path):
    """
    Guarda figura en PNG y también en SVG.
    """

    os.makedirs(os.path.dirname(path), exist_ok=True)

    plt.tight_layout()
    plt.savefig(path, bbox_inches="tight")

    svg_path = os.path.splitext(path)[0] + ".svg"
    plt.savefig(svg_path, bbox_inches="tight")

    plt.close()


# ============================================================
# Gráfica real vs predicho
# ============================================================

def plot_real_vs_predicted(
    y_true,
    y_pred,
    title,
    xlabel,
    ylabel,
    path
):
    """
    Gráfica elegante de valores reales vs predichos.
    """

    apply_elegant_style()

    y_true = np.asarray(y_true).ravel()
    y_pred = np.asarray(y_pred).ravel()

    min_value = min(np.min(y_true), np.min(y_pred))
    max_value = max(np.max(y_true), np.max(y_pred))

    padding = 0.05 * (max_value - min_value)
    min_lim = min_value - padding
    max_lim = max_value + padding

    fig, ax = plt.subplots(figsize=(7.2, 6.2))

    ax.scatter(
        y_true,
        y_pred,
        s=44,
        alpha=0.78,
        edgecolor="white",
        linewidth=0.7,
        color="#2F6F9F",
        label="Muestras"
    )

    ax.plot(
        [min_lim, max_lim],
        [min_lim, max_lim],
        linestyle="--",
        linewidth=2,
        color="#C44E52",
        label="Predicción ideal"
    )

    ax.set_xlim(min_lim, max_lim)
    ax.set_ylim(min_lim, max_lim)

    ax.set_title(title, pad=14)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)

    ax.xaxis.set_major_formatter(FuncFormatter(format_kw))
    ax.yaxis.set_major_formatter(FuncFormatter(format_kw))

    ax.legend(
        loc="upper left",
        frameon=True,
        framealpha=0.95,
        facecolor="white",
        edgecolor="#DDDDDD"
    )

    ax.text(
        0.98,
        0.04,
        "Línea punteada: ajuste ideal",
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=9,
        color="#555555"
    )

    save_figure(path)


# ============================================================
# Gráfica bayesiana con región de confianza
# ============================================================

def plot_bayesian_prediction_with_confidence(
    y_mean,
    y_std,
    title,
    ylabel,
    path,
    confidence_multiplier=1.96,
    sort_by_mean=False
):
    """
    Grafica predicción bayesiana con banda de confianza.

    y_mean: media predicha.
    y_std: desviación estándar predicha.
    confidence_multiplier=1.96 representa un intervalo aproximado del 95 %.
    """

    apply_elegant_style()

    y_mean = np.asarray(y_mean).ravel()
    y_std = np.asarray(y_std).ravel()

    lower = np.maximum(y_mean - confidence_multiplier * y_std, 0)
    upper = y_mean + confidence_multiplier * y_std

    if sort_by_mean:
        order = np.argsort(y_mean)
        y_mean = y_mean[order]
        y_std = y_std[order]
        lower = lower[order]
        upper = upper[order]

    x = np.arange(1, len(y_mean) + 1)

    fig, ax = plt.subplots(figsize=(13.5, 6.2))

    ax.fill_between(
        x,
        lower,
        upper,
        color="#A7C7E7",
        alpha=0.45,
        label="Región de confianza 95 %"
    )

    ax.plot(
        x,
        upper,
        linewidth=0.8,
        color="#7EA6C8",
        alpha=0.8
    )

    ax.plot(
        x,
        lower,
        linewidth=0.8,
        color="#7EA6C8",
        alpha=0.8
    )

    ax.plot(
        x,
        y_mean,
        color="#1F4E79",
        linewidth=2.5,
        label="Predicción bayesiana media"
    )

    ax.scatter(
        x,
        y_mean,
        s=18,
        color="#1F4E79",
        alpha=0.75,
        edgecolor="white",
        linewidth=0.4
    )

    ax.set_title(title, pad=16)
    ax.set_xlabel("Muestra")
    ax.set_ylabel(ylabel)

    ax.yaxis.set_major_formatter(FuncFormatter(format_kw))
    ax.xaxis.set_major_locator(MaxNLocator(integer=True, nbins=10))

    ax.legend(
        loc="upper left",
        frameon=True,
        framealpha=0.95,
        facecolor="white",
        edgecolor="#DDDDDD"
    )

    ax.text(
        0.99,
        0.02,
        r"Intervalo: $\hat{y} \pm 1.96\sigma$",
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=10,
        color="#555555"
    )

    save_figure(path)


# ============================================================
# Gráfica Pmax vs potencia real estimada en base 1
# ============================================================

def plot_pmax_vs_preal_base1(
    pmax_exergia,
    preal_ml,
    path,
    pmax_ml=None,
    sort_by_pmax=False
):
    """
    Grafica para cada muestra de la base 1:
    - Pmax conceptual calculada por exergía.
    - Potencia real ORC estimada.
    - Opcionalmente, Pmax estimada por ML.
    """

    apply_elegant_style()

    pmax_exergia = np.asarray(pmax_exergia).ravel()
    preal_ml = np.asarray(preal_ml).ravel()

    if pmax_ml is not None:
        pmax_ml = np.asarray(pmax_ml).ravel()

    if sort_by_pmax:
        order = np.argsort(pmax_exergia)
        pmax_exergia = pmax_exergia[order]
        preal_ml = preal_ml[order]

        if pmax_ml is not None:
            pmax_ml = pmax_ml[order]

    x = np.arange(1, len(pmax_exergia) + 1)

    fig, ax = plt.subplots(figsize=(14, 6.4))

    # Sombreado entre Pmax y Preal para visualizar margen conceptual
    ax.fill_between(
        x,
        preal_ml,
        pmax_exergia,
        where=pmax_exergia >= preal_ml,
        color="#D8E8D2",
        alpha=0.45,
        label="Margen conceptual disponible"
    )

    ax.fill_between(
        x,
        preal_ml,
        pmax_exergia,
        where=pmax_exergia < preal_ml,
        color="#F2B8B5",
        alpha=0.40,
        label="Preal estimada mayor que Pmax"
    )

    ax.plot(
        x,
        pmax_exergia,
        color="#184E77",
        linewidth=2.8,
        label="Pmax conceptual por exergía"
    )

    if pmax_ml is not None:
        ax.plot(
            x,
            pmax_ml,
            color="#168AAD",
            linewidth=2.0,
            linestyle="--",
            label="Pmax estimada por ML"
        )

    ax.plot(
        x,
        preal_ml,
        color="#C44E52",
        linewidth=2.4,
        label="Potencia real ORC estimada"
    )

    ax.scatter(
        x,
        preal_ml,
        s=20,
        color="#C44E52",
        alpha=0.75,
        edgecolor="white",
        linewidth=0.4
    )

    ax.set_title(
        "Potencia máxima conceptual y potencia real estimada en la base 1",
        pad=16
    )

    ax.set_xlabel("Muestra")
    ax.set_ylabel("Potencia [kW]")

    ax.yaxis.set_major_formatter(FuncFormatter(format_kw))
    ax.xaxis.set_major_locator(MaxNLocator(integer=True, nbins=10))

    ax.legend(
        loc="upper left",
        ncol=2,
        frameon=True,
        framealpha=0.95,
        facecolor="white",
        edgecolor="#DDDDDD"
    )

    ax.text(
        0.99,
        0.02,
        "El sombreado representa la diferencia entre potencia conceptual y potencia real estimada",
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=9.5,
        color="#555555"
    )

    save_figure(path)