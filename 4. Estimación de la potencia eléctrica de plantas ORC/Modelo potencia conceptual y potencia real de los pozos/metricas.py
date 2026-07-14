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

def plot_ratio_R(r_values, path, sort_values=True):
    """
    Grafica el cociente:

        R = P_real_ORC_ML / Pmax_conceptual

    donde:
    R < 1 indica que la potencia real ORC estimada es menor que Pmax.
    R > 1 indica una posible inconsistencia física.
    """

    apply_elegant_style()

    r_values = np.asarray(r_values, dtype=float).ravel()

    # Eliminar valores no válidos
    valid_mask = np.isfinite(r_values)
    r_values = r_values[valid_mask]

    if sort_values:
        r_values = np.sort(r_values)

    x = np.arange(1, len(r_values) + 1)

    fig, ax = plt.subplots(figsize=(13.5, 6.2))

    # Región para R <= 1
    ax.fill_between(
        x,
        0,
        np.minimum(r_values, 1),
        color="#D8E8D2",
        alpha=0.45,
        label=r"Región físicamente esperada: $R \leq 1$"
    )

    # Región para R > 1
    ax.fill_between(
        x,
        1,
        r_values,
        where=r_values > 1,
        color="#F2B8B5",
        alpha=0.45,
        label=r"Posible inconsistencia: $R > 1$"
    )

    # Curva principal
    ax.plot(
        x,
        r_values,
        color="#184E77",
        linewidth=2.4,
        label=r"$R=\hat{P}_{\mathrm{real,ORC,ML}}/P_{\max}$"
    )

    ax.scatter(
        x,
        r_values,
        s=18,
        color="#5B3F8C",
        alpha=0.75,
        edgecolor="white",
        linewidth=0.4
    )

    # Línea de referencia R = 1
    ax.axhline(
        y=1.0,
        color="#C44E52",
        linestyle="--",
        linewidth=2,
        label=r"Límite de referencia $R=1$"
    )

    ax.set_title(
        "Relación entre potencia real ORC estimada y potencia máxima conceptual",
        pad=16
    )

    ax.set_xlabel("Muestra")
    ax.set_ylabel(r"Cociente $R$")

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
        r"$R<1$: potencia real estimada menor que la conceptual; "
        r"$R>1$: posible inconsistencia física",
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=9.5,
        color="#555555"
    )

    save_figure(path)


# ============================================================
# Cargar archivo final de predicciones
# ============================================================

df = pd.read_csv(INPUT_PATH)

# ============================================================
# Calcular R
# ============================================================

required_columns = [
    "Pmax_conceptual_kW",
    "Pmax_ML_kW",
    "P_real_ORC_ML_kW"
]

missing_columns = [col for col in required_columns if col not in df.columns]

if missing_columns:
    raise ValueError(
        f"Faltan columnas en el archivo {INPUT_PATH}: {missing_columns}"
    )

df["relacion_Preal_ML_Pmax_exergia"] = (
    df["P_real_ORC_ML_kW"]
    / df["Pmax_conceptual_kW"].replace(0, np.nan)
)

df["relacion_Preal_ML_Pmax_exergia"] = (
    df["relacion_Preal_ML_Pmax_exergia"]
    .replace([np.inf, -np.inf], np.nan)
)

# ============================================================
# Columnas que se usarán en la tabla
# ============================================================

columnas = {
    "$P_{\\max}$": "Pmax_conceptual_kW",
    "$\\hat{P}_{\\max,\\text{ML}}$": "Pmax_ML_kW",
    "$\\hat{P}_{\\text{real,ORC,ML}}$": "P_real_ORC_ML_kW",
    "$R$": "relacion_Preal_ML_Pmax_exergia"
}

# ============================================================
# Calcular mínimo, máximo, media y desviación estándar
# ============================================================

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

# Guardar tabla resumen
os.makedirs(os.path.dirname(OUTPUT_TABLE_CSV), exist_ok=True)
tabla_resumen.to_csv(OUTPUT_TABLE_CSV, index=False)

# Mostrar tabla en consola
print("\nResumen de predicciones finales:")
print(tabla_resumen)

# ============================================================
# Imprimir filas listas para Overleaf
# ============================================================

tabla_latex = tabla_resumen.copy()

for col in ["Mínimo", "Máximo", "Media", "Desv. estándar"]:
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

# ============================================================
# Generar gráfica de R
# ============================================================

plot_ratio_R(
    r_values=df["relacion_Preal_ML_Pmax_exergia"].values,
    path=OUTPUT_FIGURE,
    sort_values=SORT_VALUES
)

print("\nArchivos generados:")
print(OUTPUT_TABLE_CSV)
print(OUTPUT_FIGURE)
print(OUTPUT_FIGURE.replace(".png", ".svg"))