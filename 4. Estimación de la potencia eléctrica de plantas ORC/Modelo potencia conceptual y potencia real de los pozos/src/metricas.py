import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import MaxNLocator


# ============================================================
# Configuración
# ============================================================

INPUT_PATH = "results/predicciones_base_recurso.csv"

OUTPUT_TABLE_CSV = "results/resumen_predicciones_base_recurso.csv"
OUTPUT_FIGURE = "figures/base1_ratio_R.png"
OUTPUT_RATIO_TXT = "figures/ratio_R.txt"

SORT_VALUES = False  # True: ordena R de menor a mayor para una gráfica más limpia


# ============================================================
# Estilo de gráficas
# ============================================================

def apply_elegant_style():
    plt.rcParams.update({
        "figure.dpi": 120,
        "savefig.dpi": 350,
        "font.family": "DejaVu Sans",
        "font.size": 11,
        "axes.titlesize": 15,
        "axes.labelsize": 12,
        "axes.titleweight": "bold",
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


def save_figure(path):
    os.makedirs(os.path.dirname(path), exist_ok=True)

    plt.tight_layout()
    plt.savefig(path, bbox_inches="tight")

    svg_path = os.path.splitext(path)[0] + ".svg"
    plt.savefig(svg_path, bbox_inches="tight")

    plt.close()


# ============================================================
# Gráfica del cociente R
# ============================================================

def plot_ratio_R(
    r_values,
    path,
    output_txt=None,
    sort_values=True
):
    """
    Grafica el cociente:

        R = P_real_ORC_ML / Pmax_conceptual

    y opcionalmente guarda los valores utilizados
    en un archivo TXT para reconstruir la figura
    posteriormente en TikZ/PGFPlots.

    donde:
        R < 1 : potencia ORC estimada menor que Pmax
        R > 1 : posible inconsistencia física
    """

    apply_elegant_style()

    # --------------------------------------------------------
    # Convertir a array
    # --------------------------------------------------------

    r_values = np.asarray(
        r_values,
        dtype=float
    ).ravel()

    # --------------------------------------------------------
    # Eliminar NaN e infinitos
    # --------------------------------------------------------

    valid_mask = np.isfinite(
        r_values
    )

    r_values = r_values[
        valid_mask
    ]

    # --------------------------------------------------------
    # Ordenar, si se solicita
    # --------------------------------------------------------

    if sort_values:
        r_values = np.sort(
            r_values
        )

    # --------------------------------------------------------
    # Índice de muestra
    # --------------------------------------------------------

    x = np.arange(
        1,
        len(r_values) + 1
    )

    # ========================================================
    # GUARDAR TXT PARA OVERLEAF
    # ========================================================

    if output_txt is not None:

        os.makedirs(
            os.path.dirname(
                output_txt
            ),
            exist_ok=True
        )

        df_ratio = pd.DataFrame({
            "muestra": x,
            "R": r_values
        })

        df_ratio.to_csv(
            output_txt,
            sep=" ",
            index=False,
            float_format="%.10g"
        )

        print(
            f"\nDatos de R guardados en:"
            f"\n{output_txt}"
        )

    # ========================================================
    # FIGURA
    # ========================================================

    fig, ax = plt.subplots(
        figsize=(13.5, 6.2)
    )

    # --------------------------------------------------------
    # Región R <= 1
    # --------------------------------------------------------

    ax.fill_between(
        x,
        0,
        np.minimum(
            r_values,
            1
        ),
        color="#D8E8D2",
        alpha=0.45,
        label=(
            r"Región físicamente "
            r"esperada: $R \leq 1$"
        )
    )

    # --------------------------------------------------------
    # Región R > 1
    # --------------------------------------------------------

    ax.fill_between(
        x,
        1,
        r_values,
        where=r_values > 1,
        color="#F2B8B5",
        alpha=0.45,
        label=(
            r"Posible inconsistencia: "
            r"$R > 1$"
        )
    )

    # --------------------------------------------------------
    # Curva R
    # --------------------------------------------------------

    ax.plot(
        x,
        r_values,
        color="#184E77",
        linewidth=2.4,
        label=(
            r"$R="
            r"\hat{P}_{\mathrm{real,ORC,ML}}"
            r"/P_{\max}$"
        )
    )

    # --------------------------------------------------------
    # Puntos
    # --------------------------------------------------------

    ax.scatter(
        x,
        r_values,
        s=18,
        color="#5B3F8C",
        alpha=0.75,
        edgecolor="white",
        linewidth=0.4
    )

    # --------------------------------------------------------
    # Línea R = 1
    # --------------------------------------------------------

    ax.axhline(
        y=1.0,
        color="#C44E52",
        linestyle="--",
        linewidth=2,
        label=r"Límite de referencia $R=1$"
    )

    # --------------------------------------------------------
    # Etiquetas
    # --------------------------------------------------------

    ax.set_title(
        "Relación entre potencia real ORC estimada "
        "y potencia máxima conceptual",
        pad=16
    )

    ax.set_xlabel(
        "Muestra"
    )

    ax.set_ylabel(
        r"Cociente $R$"
    )

    ax.xaxis.set_major_locator(
        MaxNLocator(
            integer=True,
            nbins=10
        )
    )

    # --------------------------------------------------------
    # Leyenda
    # --------------------------------------------------------

    ax.legend(
        loc="upper left",
        frameon=True,
        framealpha=0.95,
        facecolor="white",
        edgecolor="#DDDDDD"
    )

    # --------------------------------------------------------
    # Nota
    # --------------------------------------------------------

    ax.text(
        0.99,
        0.02,
        (
            r"$R<1$: potencia real estimada menor "
            r"que la conceptual; "
            r"$R>1$: posible inconsistencia física"
        ),
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=9.5,
        color="#555555"
    )

    # --------------------------------------------------------
    # Guardar figura
    # --------------------------------------------------------

    save_figure(
        path
    )


def generar_resultados_finales(
    input_path="results/predicciones_base_recurso.csv",
    output_table_csv="results/resumen_predicciones_base_recurso.csv",
    output_figure="figures/base1_ratio_R.png",
    sort_values=False
):
    """
    Genera:
    - tabla resumen de las predicciones;
    - gráfica del cociente R;
    - archivo SVG de la gráfica.
    """

    # ========================================================
    # Cargar archivo
    # ========================================================

    df = pd.read_csv(input_path)

    # ========================================================
    # Validar columnas
    # ========================================================

    required_columns = [
        "Pmax_conceptual_kW",
        "Pmax_ML_kW",
        "P_real_ORC_ML_kW"
    ]

    missing_columns = [
        col
        for col in required_columns
        if col not in df.columns
    ]

    if missing_columns:
        raise ValueError(
            f"Faltan columnas en {input_path}: "
            f"{missing_columns}"
        )

    # ========================================================
    # Calcular R
    # ========================================================

    df["relacion_Preal_ML_Pmax_exergia"] = (
        df["P_real_ORC_ML_kW"]
        / df["Pmax_conceptual_kW"].replace(0, np.nan)
    )

    df["relacion_Preal_ML_Pmax_exergia"] = (
        df["relacion_Preal_ML_Pmax_exergia"]
        .replace([np.inf, -np.inf], np.nan)
    )

    # ========================================================
    # Tabla resumen
    # ========================================================

    columnas = {
        "$P_{\\max}$": "Pmax_conceptual_kW",
        "$\\hat{P}_{\\max,\\text{ML}}$": "Pmax_ML_kW",
        "$\\hat{P}_{\\text{real,ORC,ML}}$":
            "P_real_ORC_ML_kW",
        "$R$": "relacion_Preal_ML_Pmax_exergia"
    }

    resumen = []

    for nombre_latex, columna in columnas.items():

        resumen.append({
            "Variable": nombre_latex,
            "Mínimo": df[columna].min(),
            "Máximo": df[columna].max(),
            "Media": df[columna].mean(),
            "Desv. estándar": df[columna].std()
        })

    tabla_resumen = pd.DataFrame(resumen)

    # ========================================================
    # Guardar tabla
    # ========================================================

    os.makedirs(
        os.path.dirname(output_table_csv),
        exist_ok=True
    )

    tabla_resumen.to_csv(
        output_table_csv,
        index=False
    )

    print("\nResumen de predicciones finales:")
    print(tabla_resumen)

    # ========================================================
    # Formato para Overleaf
    # ========================================================

    tabla_latex = tabla_resumen.copy()

    for col in [
        "Mínimo",
        "Máximo",
        "Media",
        "Desv. estándar"
    ]:
        tabla_latex[col] = tabla_latex[col].round(3)

    print("\nFilas para pegar en Overleaf:")

    for _, row in tabla_latex.iterrows():

        print(
            f"{row['Variable']} & "
            f"{row['Mínimo']} & "
            f"{row['Máximo']} & "
            f"{row['Media']} & "
            f"{row['Desv. estándar']} \\\\"
        )

    # ========================================================
    # Gráfica R
    # ========================================================

    plot_ratio_R(
        r_values=(
            df[
                "relacion_Preal_ML_Pmax_exergia"
            ].values
        ),
        path=output_figure,
        output_txt=OUTPUT_RATIO_TXT,
        sort_values=sort_values
    )

    print("\nResultados adicionales generados:")
    print(output_table_csv)
    print(output_figure)
    print(
        os.path.splitext(output_figure)[0]
        + ".svg"
    )

    return tabla_resumen


def apply_elegant_style():
    plt.rcParams.update({
        "figure.dpi": 120,
        "savefig.dpi": 350,
        "font.family": "DejaVu Sans",
        "font.size": 11,
        "axes.titlesize": 15,
        "axes.labelsize": 12,
        "axes.titleweight": "bold",
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


def save_figure(path):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    plt.tight_layout()
    plt.savefig(path, bbox_inches="tight")
    svg_path = os.path.splitext(path)[0] + ".svg"
    plt.savefig(svg_path, bbox_inches="tight")
    plt.close()


def plot_scatter_with_trend(
    x,
    y,
    xlabel,
    ylabel,
    title,
    path,
    point_color="#2C7FB8",
    line_color="#D95F0E"
):
    apply_elegant_style()

    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)

    mask = np.isfinite(x) & np.isfinite(y)
    x = x[mask]
    y = y[mask]

    fig, ax = plt.subplots(figsize=(8.6, 5.8))

    ax.scatter(
        x,
        y,
        s=35,
        alpha=0.75,
        color=point_color,
        edgecolor="white",
        linewidth=0.5,
        label="Muestras"
    )

    # Línea de tendencia lineal
    if len(x) >= 2:
        coef = np.polyfit(x, y, deg=1)
        x_line = np.linspace(x.min(), x.max(), 200)
        y_line = np.polyval(coef, x_line)

        ax.plot(
            x_line,
            y_line,
            color=line_color,
            linewidth=2.2,
            label="Tendencia lineal"
        )

    ax.set_title(title, pad=14)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)

    ax.legend(
        frameon=True,
        framealpha=0.95,
        facecolor="white",
        edgecolor="#DDDDDD"
    )

    save_figure(path)


def plot_preal_relationships(
    df,
    output_dir="figures",
    col_preal="P_real_ORC_ML_kW",
    col_t="T_cabeza_C",
    col_p="P_cabeza_Pa",
    col_mdot="flujo_masico_kg_s"
):
    """
    Genera tres gráficas:
    1. Potencia real estimada vs temperatura en cabeza
    2. Potencia real estimada vs presión en cabeza
    3. Potencia real estimada vs flujo másico
    """

    required_cols = [col_preal, col_t, col_p, col_mdot]
    missing = [c for c in required_cols if c not in df.columns]

    if missing:
        raise ValueError(
            f"Faltan columnas para las gráficas de relaciones: {missing}"
        )

    # 1) P_real vs T_cabeza
    plot_scatter_with_trend(
        x=df[col_t],
        y=df[col_preal],
        xlabel="Temperatura en cabeza [°C]",
        ylabel="Potencia real estimada [kW]",
        title="Potencia real estimada vs temperatura en cabeza",
        path=os.path.join(output_dir, "preal_vs_t_cabeza.png")
    )

    # 2) P_real vs P_cabeza
    plot_scatter_with_trend(
        x=df[col_p],
        y=df[col_preal],
        xlabel="Presión en cabeza [Pa]",
        ylabel="Potencia real estimada [kW]",
        title="Potencia real estimada vs presión en cabeza",
        path=os.path.join(output_dir, "preal_vs_p_cabeza.png")
    )

    # 3) P_real vs flujo másico
    plot_scatter_with_trend(
        x=df[col_mdot],
        y=df[col_preal],
        xlabel="Flujo másico [kg/s]",
        ylabel="Potencia real estimada [kW]",
        title="Potencia real estimada vs flujo másico",
        path=os.path.join(output_dir, "preal_vs_flujo_masico.png")
    )

    print("\nGráficas generadas:")
    print(os.path.join(output_dir, "preal_vs_t_cabeza.png"))
    print(os.path.join(output_dir, "preal_vs_p_cabeza.png"))
    print(os.path.join(output_dir, "preal_vs_flujo_masico.png"))


if __name__ == "__main__":
    generar_resultados_finales()


