# ============================================================
# DOMINIO DE APLICABILIDAD DEL MODELO ORC
#
# Figura:
#   Flujo másico vs Temperatura en cabeza
#   comparando:
#       - base del recurso
#       - base ORC real
#
# Salidas:
#   - PNG
#   - PDF
#   - SVG
#   - TXT para usar en Overleaf / PGFPlots
# ============================================================

import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


# ============================================================
# 1. CONFIGURACIÓN
# ============================================================

# Base del recurso procesada
# Puedes usar:
#   "results/base_recurso_con_exergia.csv"
# o
#   "results/predicciones_base_recurso.csv"
RESOURCE_PATH = "results/predicciones_base_recurso.csv"

# Base ORC procesada
ORC_PATH = "results/base_orc_real_procesada.csv"

# Carpeta de salida
OUTPUT_DIR = "figures/articulo"

# Archivos de salida
OUTPUT_BASE = os.path.join(
    OUTPUT_DIR,
    "dominio_aplicabilidad_orc"
)

# Columnas
COL_T_CABEZA = "T_cabeza_C"
COL_FLUJO = "flujo_masico_kg_s"

# Etiquetas
LABEL_RESOURCE = "Geothermal resource dataset"
LABEL_ORC = "ORC training dataset"

# Configuración visual
RESOURCE_MARKER = "x"
ORC_MARKER = "o"

RESOURCE_COLOR = "#B33A3A"   # rojo suave
ORC_COLOR = "#1F5A94"        # azul artículo

RESOURCE_SIZE = 42
ORC_SIZE = 24

RESOURCE_ALPHA = 0.85
ORC_ALPHA = 0.70

# Cambiar a True si quieres eje Y logarítmico
USE_LOG_SCALE_Y = False


# ============================================================
# 2. FUNCIONES AUXILIARES
# ============================================================

def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def load_csv(path):
    """
    Carga CSV considerando posibles problemas con BOM.
    """
    return pd.read_csv(path, encoding="utf-8-sig")


def clean_dataset(df, dataset_name):
    """
    Limpia y conserva solo las columnas necesarias.
    """
    required_cols = [COL_T_CABEZA, COL_FLUJO]

    missing = [c for c in required_cols if c not in df.columns]
    if missing:
        raise ValueError(
            f"En '{dataset_name}' faltan columnas: {missing}"
        )

    out = df.copy()

    out[COL_T_CABEZA] = pd.to_numeric(
        out[COL_T_CABEZA],
        errors="coerce"
    )

    out[COL_FLUJO] = pd.to_numeric(
        out[COL_FLUJO],
        errors="coerce"
    )

    out = out.dropna(subset=required_cols).copy()

    # Mantener solo valores positivos de flujo
    out = out[out[COL_FLUJO] > 0].copy()

    return out.reset_index(drop=True)


def apply_style():
    plt.rcParams.update({
        "figure.dpi": 120,
        "savefig.dpi": 400,
        "font.family": "DejaVu Sans",
        "font.size": 11,
        "axes.titlesize": 14,
        "axes.labelsize": 12,
        "axes.titleweight": "bold",
        "xtick.labelsize": 10,
        "ytick.labelsize": 10,
        "legend.fontsize": 10,
        "axes.spines.top": False,
        "axes.spines.right": False,
        "axes.grid": True,
        "grid.alpha": 0.22,
        "grid.linestyle": "--",
        "grid.linewidth": 0.7,
        "axes.facecolor": "#FAFAFA",
        "figure.facecolor": "white"
    })


def save_figure(fig, output_base):
    fig.tight_layout()

    png_path = output_base + ".png"
    pdf_path = output_base + ".pdf"
    svg_path = output_base + ".svg"

    fig.savefig(png_path, bbox_inches="tight")
    fig.savefig(pdf_path, bbox_inches="tight")
    fig.savefig(svg_path, bbox_inches="tight")

    plt.close(fig)

    return {
        "png": png_path,
        "pdf": pdf_path,
        "svg": svg_path
    }


def save_txt(resource_df, orc_df, output_base):
    """
    Guarda un TXT con los datos usados en la figura,
    útil para PGFPlots / Overleaf.
    """
    df_resource_txt = resource_df[[COL_T_CABEZA, COL_FLUJO]].copy()
    df_resource_txt["dataset"] = "resource"

    df_orc_txt = orc_df[[COL_T_CABEZA, COL_FLUJO]].copy()
    df_orc_txt["dataset"] = "orc"

    df_plot = pd.concat(
        [df_resource_txt, df_orc_txt],
        axis=0,
        ignore_index=True
    )

    txt_path = output_base + ".txt"
    df_plot.to_csv(
        txt_path,
        sep=" ",
        index=False,
        float_format="%.10g"
    )

    return txt_path


# ============================================================
# 3. FIGURA PRINCIPAL
# ============================================================

def plot_applicability_domain(resource_df, orc_df, output_base):
    apply_style()

    fig, ax = plt.subplots(figsize=(8.2, 6.2))

    # --------------------------------------------------------
    # ORC
    # --------------------------------------------------------
    ax.scatter(
        orc_df[COL_T_CABEZA],
        orc_df[COL_FLUJO],
        s=ORC_SIZE,
        c=ORC_COLOR,
        marker=ORC_MARKER,
        alpha=ORC_ALPHA,
        edgecolors="white",
        linewidths=0.35,
        label=LABEL_ORC,
        zorder=3
    )

    # --------------------------------------------------------
    # Recurso
    # --------------------------------------------------------
    ax.scatter(
        resource_df[COL_T_CABEZA],
        resource_df[COL_FLUJO],
        s=RESOURCE_SIZE,
        c=RESOURCE_COLOR,
        marker=RESOURCE_MARKER,
        alpha=RESOURCE_ALPHA,
        linewidths=1.05,
        label=LABEL_RESOURCE,
        zorder=4
    )

    # --------------------------------------------------------
    # Escala Y
    # --------------------------------------------------------
    if USE_LOG_SCALE_Y:
        ax.set_yscale("log")
        ylabel = r"Mass flow rate $\dot{m}$ [kg/s] (log scale)"
    else:
        ylabel = r"Mass flow rate $\dot{m}$ [kg/s]"

    # --------------------------------------------------------
    # Etiquetas
    # --------------------------------------------------------
    ax.set_xlabel(r"Wellhead temperature $T_{\mathrm{head}}$ [$^\circ$C]")
    ax.set_ylabel(ylabel)

    ax.set_title(
        "Applicability domain of the ORC power model",
        pad=12
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
    # Margen automático
    # --------------------------------------------------------
    x_all = np.concatenate([
        resource_df[COL_T_CABEZA].values,
        orc_df[COL_T_CABEZA].values
    ])

    y_all = np.concatenate([
        resource_df[COL_FLUJO].values,
        orc_df[COL_FLUJO].values
    ])

    x_min, x_max = np.nanmin(x_all), np.nanmax(x_all)
    y_min, y_max = np.nanmin(y_all), np.nanmax(y_all)

    x_margin = 0.04 * (x_max - x_min) if x_max > x_min else 1.0

    if not USE_LOG_SCALE_Y:
        y_margin = 0.06 * (y_max - y_min) if y_max > y_min else 1.0
        ax.set_ylim(
            max(0, y_min - y_margin),
            y_max + y_margin
        )
    else:
        ax.set_ylim(y_min * 0.85, y_max * 1.15)

    ax.set_xlim(
        x_min - x_margin,
        x_max + x_margin
    )

    # --------------------------------------------------------
    # Texto explicativo
    # --------------------------------------------------------
    ax.text(
        0.99,
        0.02,
        (
            "Blue circles: ORC training data\n"
            "Red crosses: geothermal resource data"
        ),
        transform=ax.transAxes,
        ha="right",
        va="bottom",
        fontsize=9.2,
        color="#555555"
    )

    return save_figure(fig, output_base)


# ============================================================
# 4. MAIN
# ============================================================

def main():
    ensure_dir(OUTPUT_DIR)

    print("\n" + "=" * 70)
    print("DOMINIO DE APLICABILIDAD DEL MODELO ORC")
    print("=" * 70)

    # --------------------------------------------------------
    # Cargar datos
    # --------------------------------------------------------
    df_resource = load_csv(RESOURCE_PATH)
    df_orc = load_csv(ORC_PATH)

    print(f"\nFilas originales recurso: {len(df_resource)}")
    print(f"Filas originales ORC:     {len(df_orc)}")

    # --------------------------------------------------------
    # Limpiar
    # --------------------------------------------------------
    df_resource = clean_dataset(df_resource, "resource")
    df_orc = clean_dataset(df_orc, "orc")

    print(f"\nFilas válidas recurso: {len(df_resource)}")
    print(f"Filas válidas ORC:     {len(df_orc)}")

    # --------------------------------------------------------
    # Guardar TXT
    # --------------------------------------------------------
    txt_path = save_txt(
        df_resource,
        df_orc,
        OUTPUT_BASE
    )

    # --------------------------------------------------------
    # Graficar
    # --------------------------------------------------------
    paths = plot_applicability_domain(
        resource_df=df_resource,
        orc_df=df_orc,
        output_base=OUTPUT_BASE
    )

    print("\nArchivos generados:")
    print(f"- TXT: {txt_path}")
    print(f"- PNG: {paths['png']}")
    print(f"- PDF: {paths['pdf']}")
    print(f"- SVG: {paths['svg']}")


# ============================================================
# 5. EJECUCIÓN
# ============================================================

if __name__ == "__main__":
    main()