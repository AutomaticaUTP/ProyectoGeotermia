# ============================================================
# HISTOGRAMAS DE POTENCIA GEOTÉRMICA
#
# Genera para Pmax conceptual y Preal ORC estimada:
#
# 1. Histograma de frecuencias
# 2. Histograma de frecuencias + curva KDE
#
# Exporta:
# - Figuras PDF a 600 dpi
# - Datos TXT para PGFPlots / Overleaf
# - Valores individuales originales en TXT
#
# Ambos modelos utilizan los mismos intervalos de potencia.
# ============================================================

from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from scipy.stats import gaussian_kde


# ============================================================
# 1. CONFIGURACIÓN GENERAL
# ============================================================

INPUT_CSV = Path(
    "results/predicciones_base_recurso.csv"
)

OUTPUT_DIR = Path(
    "figures/histogramas"
)

OUTPUT_DIR.mkdir(
    parents=True,
    exist_ok=True
)


# ------------------------------------------------------------
# Columnas de potencia
# ------------------------------------------------------------

COL_PMAX = "Pmax_conceptual_kW"

COL_PREAL = "P_real_ORC_ML_kW"


# ------------------------------------------------------------
# Configuración estadística
# ------------------------------------------------------------

# Anchura de cada intervalo en kW.
# Se utiliza el mismo valor para ambos histogramas.

BIN_WIDTH = 5.0

# Número de puntos utilizados para dibujar la curva KDE.

N_KDE_POINTS = 500

# Método de selección del ancho de banda del KDE.
# Puede cambiarse por "silverman".

KDE_BANDWIDTH = "scott"


# ------------------------------------------------------------
# Filtrado espacial
# ------------------------------------------------------------

# False:
# Utiliza todas las observaciones con potencia válida del CSV.
#
# True:
# Aplica el mismo filtro geográfico del script de mapas.
#
# Para analizar la distribución de toda la base de pozos,
# se recomienda dejarlo en False.

FILTRAR_COMO_MAPAS = False

COL_LONGITUD = "longitud"
COL_LATITUD = "latitud"

LON_MIN = -79.7
LON_MAX = -67.9

LAT_MIN = -1.4
LAT_MAX = 13.65


# ============================================================
# 2. CONFIGURACIÓN VISUAL
# ============================================================

# Colores compatibles con la estética del artículo.

COLOR_PMAX = "#40566B"

COLOR_PREAL = "#7893A8"

COLOR_KDE = "#B33A3A"

COLOR_EDGE = "#263746"

COLOR_GRID = "#D8E1E8"


# Tamaño de figura.

FIGSIZE = (7.2, 5.2)

DPI = 600


# ============================================================
# 3. CARGAR Y LIMPIAR BASE DE DATOS
# ============================================================

def cargar_datos(path):

    if not path.exists():

        raise FileNotFoundError(
            f"No se encontró el archivo: {path}"
        )

    df = pd.read_csv(
        path,
        encoding="utf-8-sig"
    )

    required = [
        COL_PMAX,
        COL_PREAL
    ]

    if FILTRAR_COMO_MAPAS:

        required.extend([
            COL_LONGITUD,
            COL_LATITUD
        ])

    missing = [
        col
        for col in required
        if col not in df.columns
    ]

    if missing:

        raise ValueError(
            f"Faltan columnas en el CSV: {missing}"
        )

    df = df.copy()

    # Convertir las potencias a valores numéricos.

    for col in [COL_PMAX, COL_PREAL]:

        df[col] = pd.to_numeric(
            df[col],
            errors="coerce"
        )

        # Tratar infinitos como datos no válidos.

        df[col] = df[col].replace(
            [np.inf, -np.inf],
            np.nan
        )

    # --------------------------------------------------------
    # Aplicar filtro geográfico solamente si se solicita.
    # --------------------------------------------------------

    if FILTRAR_COMO_MAPAS:

        for col in [
            COL_LONGITUD,
            COL_LATITUD
        ]:

            df[col] = pd.to_numeric(
                df[col],
                errors="coerce"
            )

        df = df.dropna(
            subset=[
                COL_LONGITUD,
                COL_LATITUD
            ]
        ).copy()

        df = df[
            df[COL_LONGITUD].between(
                LON_MIN,
                LON_MAX
            )
            &
            df[COL_LATITUD].between(
                LAT_MIN,
                LAT_MAX
            )
        ].copy()

    return df.reset_index(
        drop=True
    )


# ============================================================
# 4. EXTRAER VALORES VÁLIDOS
# ============================================================

def extraer_potencia(df, columna):

    valores = pd.to_numeric(
        df[columna],
        errors="coerce"
    ).to_numpy(dtype=float)

    valores = valores[
        np.isfinite(valores)
    ]

    if len(valores) == 0:

        raise ValueError(
            f"No hay valores válidos para {columna}"
        )

    return valores


# ============================================================
# 5. DEFINIR INTERVALOS COMUNES
# ============================================================

def definir_bins_comunes(
    valores_pmax,
    valores_preal,
    bin_width=5.0
):

    if bin_width <= 0:

        raise ValueError(
            "BIN_WIDTH debe ser mayor que cero."
        )

    todos = np.concatenate([
        valores_pmax,
        valores_preal
    ])

    minimo = min(
        0.0,
        float(np.min(todos))
    )

    maximo = float(
        np.max(todos)
    )

    limite_inf = (
        np.floor(minimo / bin_width)
        * bin_width
    )

    limite_sup = (
        np.ceil(maximo / bin_width)
        * bin_width
    )

    # Evitar un rango vacío.

    if limite_sup <= limite_inf:

        limite_sup = limite_inf + bin_width

    n_bins = int(
        round(
            (limite_sup - limite_inf)
            / bin_width
        )
    )

    edges = limite_inf + (
        np.arange(n_bins + 1)
        * bin_width
    )

    return edges


# ============================================================
# 6. CALCULAR HISTOGRAMA
# ============================================================

def calcular_histograma(
    valores,
    edges
):

    frecuencias, _ = np.histogram(
        valores,
        bins=edges
    )

    bordes_izquierdos = edges[:-1]

    bordes_derechos = edges[1:]

    centros = (
        bordes_izquierdos
        +
        bordes_derechos
    ) / 2.0

    anchuras = (
        bordes_derechos
        -
        bordes_izquierdos
    )

    frecuencias_relativas = (
        frecuencias / len(valores)
    )

    df_hist = pd.DataFrame({

        "bin_left_kW":
            bordes_izquierdos,

        "bin_right_kW":
            bordes_derechos,

        "bin_center_kW":
            centros,

        "frequency":
            frecuencias,

        "relative_frequency":
            frecuencias_relativas,

        "percentage":
            frecuencias_relativas * 100,

        "density":
            frecuencias
            /
            (len(valores) * anchuras)

    })

    return df_hist


# ============================================================
# 7. CALCULAR KDE
# ============================================================

def calcular_kde(
    valores,
    edges,
    bin_width
):

    # Se requiere variación real entre observaciones
    # para estimar una distribución KDE.

    if (
        len(valores) < 2
        or np.unique(valores).size < 2
    ):

        raise ValueError(
            "Se necesitan al menos dos valores "
            "distintos para calcular el KDE."
        )

    kde = gaussian_kde(
        valores,
        bw_method=KDE_BANDWIDTH
    )

    x_kde = np.linspace(
        edges[0],
        edges[-1],
        N_KDE_POINTS
    )

    # Densidad de probabilidad.
    # La integral de la KDE sobre toda la recta es 1.

    densidad = kde(
        x_kde
    )

    # Convertir densidad a frecuencia aproximada.
    #
    # Esto permite superponer la KDE directamente
    # sobre un histograma cuyo eje Y es frecuencia.
    #
    # KDE escalada = densidad * N * anchura del bin

    kde_frecuencia = (
        densidad
        *
        len(valores)
        *
        bin_width
    )

    df_kde = pd.DataFrame({

        "power_kW":
            x_kde,

        "kde_density":
            densidad,

        "kde_frequency":
            kde_frecuencia

    })

    return df_kde


# ============================================================
# 8. ESTILO GENERAL DE LAS FIGURAS
# ============================================================

def configurar_ejes(
    ax,
    edges,
    ymax
):

    ax.set_xlabel(
        "Electrical power [kW]",
        fontsize=11
    )

    ax.set_ylabel(
        "Frequency",
        fontsize=11
    )

    ax.set_xlim(
        edges[0],
        edges[-1]
    )

    ax.set_ylim(
        0,
        ymax
    )

    ax.grid(
        axis="y",
        linestyle="--",
        linewidth=0.6,
        color=COLOR_GRID,
        alpha=0.8
    )

    ax.set_axisbelow(
        True
    )

    ax.spines["top"].set_visible(
        False
    )

    ax.spines["right"].set_visible(
        False
    )

    ax.tick_params(
        labelsize=10
    )


# ============================================================
# 9. GUARDAR FIGURAS
# ============================================================

def guardar_figura(
    fig,
    output_path
):

    fig.savefig(
        output_path,
        format="pdf",
        dpi=DPI,
        bbox_inches="tight",
        facecolor="white"
    )

    plt.close(
        fig
    )

    print(
        f"PDF guardado: {output_path}"
    )


# ============================================================
# 10. GUARDAR TXT
# ============================================================

def guardar_txt(
    df,
    output_path
):

    df.to_csv(
        output_path,
        sep=" ",
        index=False,
        float_format="%.10g"
    )

    print(
        f"TXT guardado: {output_path}"
    )


# ============================================================
# 11. HISTOGRAMA SIMPLE
# ============================================================

def generar_histograma_simple(
    df_hist,
    edges,
    color,
    output_pdf,
    ymax
):

    fig, ax = plt.subplots(
        figsize=FIGSIZE,
        dpi=DPI
    )

    ax.bar(
        df_hist["bin_center_kW"],
        df_hist["frequency"],
        width=np.diff(edges),
        align="center",
        color=color,
        edgecolor=COLOR_EDGE,
        linewidth=0.55,
        alpha=0.90
    )

    configurar_ejes(
        ax,
        edges,
        ymax
    )

    fig.tight_layout()

    guardar_figura(
        fig,
        output_pdf
    )


# ============================================================
# 12. HISTOGRAMA + KDE
# ============================================================

def generar_histograma_kde(
    df_hist,
    df_kde,
    edges,
    color,
    output_pdf,
    ymax
):

    fig, ax = plt.subplots(
        figsize=FIGSIZE,
        dpi=DPI
    )

    # --------------------------------------------------------
    # Histograma
    # --------------------------------------------------------

    ax.bar(
        df_hist["bin_center_kW"],
        df_hist["frequency"],
        width=np.diff(edges),
        align="center",
        color=color,
        edgecolor=COLOR_EDGE,
        linewidth=0.55,
        alpha=0.65,
        label="Histogram"
    )

    # --------------------------------------------------------
    # KDE escalada a frecuencia
    # --------------------------------------------------------

    ax.plot(
        df_kde["power_kW"],
        df_kde["kde_frequency"],
        color=COLOR_KDE,
        linewidth=2.0,
        label="KDE"
    )

    configurar_ejes(
        ax,
        edges,
        ymax
    )

    ax.legend(
        loc="upper right",
        frameon=True,
        fontsize=10
    )

    fig.tight_layout()

    guardar_figura(
        fig,
        output_pdf
    )


# ============================================================
# 13. PROCESAR CADA POTENCIA
# ============================================================

def procesar_potencia(
    valores,
    nombre_archivo,
    color,
    edges
):

    print(
        "\n" + "-" * 65
    )

    print(
        f"Procesando: {nombre_archivo}"
    )

    print(
        "-" * 65
    )

    # --------------------------------------------------------
    # Estadísticas
    # --------------------------------------------------------

    print(
        f"Observaciones válidas: {len(valores)}"
    )

    print(
        f"Mínimo: {np.min(valores):.3f} kW"
    )

    print(
        f"Máximo: {np.max(valores):.3f} kW"
    )

    print(
        f"Media: {np.mean(valores):.3f} kW"
    )

    print(
        f"Desviación estándar: {np.std(valores):.3f} kW"
    )

    # --------------------------------------------------------
    # Histograma
    # --------------------------------------------------------

    df_hist = calcular_histograma(
        valores,
        edges
    )

    # --------------------------------------------------------
    # KDE
    # --------------------------------------------------------

    df_kde = calcular_kde(
        valores,
        edges,
        BIN_WIDTH
    )

    # --------------------------------------------------------
    # Escala vertical común entre las dos versiones
    # de una misma variable
    # --------------------------------------------------------

    frecuencia_max = float(
        df_hist["frequency"].max()
    )

    kde_max = float(
        df_kde["kde_frequency"].max()
    )

    ymax = 1.10 * max(
        frecuencia_max,
        kde_max,
        1.0
    )

    # --------------------------------------------------------
    # Rutas TXT
    # --------------------------------------------------------

    txt_hist = (
        OUTPUT_DIR
        /
        f"hist_{nombre_archivo}.txt"
    )

    txt_kde = (
        OUTPUT_DIR
        /
        f"kde_{nombre_archivo}.txt"
    )

    txt_raw = (
        OUTPUT_DIR
        /
        f"valores_{nombre_archivo}.txt"
    )

    # --------------------------------------------------------
    # Rutas PDF
    # --------------------------------------------------------

    pdf_hist = (
        OUTPUT_DIR
        /
        f"hist_{nombre_archivo}.pdf"
    )

    pdf_hist_kde = (
        OUTPUT_DIR
        /
        f"hist_kde_{nombre_archivo}.pdf"
    )

    # --------------------------------------------------------
    # Exportar datos para Overleaf
    # --------------------------------------------------------

    guardar_txt(
        df_hist,
        txt_hist
    )

    guardar_txt(
        df_kde,
        txt_kde
    )

    guardar_txt(
        pd.DataFrame({
            "power_kW": valores
        }),
        txt_raw
    )

    # --------------------------------------------------------
    # Generar histograma simple
    # --------------------------------------------------------

    generar_histograma_simple(
        df_hist=df_hist,
        edges=edges,
        color=color,
        output_pdf=pdf_hist,
        ymax=ymax
    )

    # --------------------------------------------------------
    # Generar histograma con KDE
    # --------------------------------------------------------

    generar_histograma_kde(
        df_hist=df_hist,
        df_kde=df_kde,
        edges=edges,
        color=color,
        output_pdf=pdf_hist_kde,
        ymax=ymax
    )

    return {

        "histograma_pdf":
            str(pdf_hist),

        "histograma_kde_pdf":
            str(pdf_hist_kde),

        "histograma_txt":
            str(txt_hist),

        "kde_txt":
            str(txt_kde),

        "valores_txt":
            str(txt_raw)

    }


# ============================================================
# 14. FUNCIÓN PRINCIPAL
# ============================================================

def main():

    print(
        "\n" + "=" * 70
    )

    print(
        "GENERACIÓN DE HISTOGRAMAS DE POTENCIA"
    )

    print(
        "=" * 70
    )

    # --------------------------------------------------------
    # Cargar base
    # --------------------------------------------------------

    df = cargar_datos(
        INPUT_CSV
    )

    print(
        f"\nRegistros en la base procesada: {len(df)}"
    )

    # --------------------------------------------------------
    # Extraer las dos potencias
    # --------------------------------------------------------

    valores_pmax = extraer_potencia(
        df,
        COL_PMAX
    )

    valores_preal = extraer_potencia(
        df,
        COL_PREAL
    )

    # --------------------------------------------------------
    # Crear los mismos intervalos para ambas variables
    # --------------------------------------------------------

    edges = definir_bins_comunes(
        valores_pmax,
        valores_preal,
        BIN_WIDTH
    )

    print(
        "\nIntervalos comunes:"
    )

    print(
        f"Desde {edges[0]:.2f} kW "
        f"hasta {edges[-1]:.2f} kW"
    )

    print(
        f"Anchura: {BIN_WIDTH:.2f} kW"
    )

    # --------------------------------------------------------
    # Generar archivos Pmax
    # --------------------------------------------------------

    resultados_pmax = procesar_potencia(

        valores=valores_pmax,

        nombre_archivo="pmax",

        color=COLOR_PMAX,

        edges=edges
    )

    # --------------------------------------------------------
    # Generar archivos Preal ORC
    # --------------------------------------------------------

    resultados_preal = procesar_potencia(

        valores=valores_preal,

        nombre_archivo="preal_orc",

        color=COLOR_PREAL,

        edges=edges
    )

    print(
        "\n" + "=" * 70
    )

    print(
        "ARCHIVOS GENERADOS CORRECTAMENTE"
    )

    print(
        "=" * 70
    )

    return {
        "Pmax": resultados_pmax,
        "Preal_ORC": resultados_preal
    }


# ============================================================
# 15. EJECUCIÓN INDEPENDIENTE
# ============================================================

if __name__ == "__main__":

    resultados = main()