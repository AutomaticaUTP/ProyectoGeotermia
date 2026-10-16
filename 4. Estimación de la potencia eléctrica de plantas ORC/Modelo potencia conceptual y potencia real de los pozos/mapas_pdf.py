# ============================================================
# MAPAS DE DISTRIBUCIÓN ESPACIAL DE POTENCIA GEOTÉRMICA
#
# Genera:
#   1. Mapa de potencia máxima conceptual
#   2. Mapa de potencia real ORC estimada
#
# Ambos mapas utilizan:
#   - misma extensión geográfica
#   - misma escala de color
#   - mismo mapa base Esri
#   - misma rosa de los vientos
#   - salida PDF a 600 dpi
# ============================================================

import os

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import contextily as ctx
import html
import folium

from matplotlib.colors import Normalize, to_hex
from matplotlib.cm import ScalarMappable
from matplotlib.patches import Circle, Polygon
from matplotlib.ticker import FuncFormatter


# ============================================================
# 1. CONFIGURACIÓN
# ============================================================

INPUT_CSV = (
    "results/"
    "predicciones_base_recurso.csv"
)

OUTPUT_DIR = (
    "figures/mapas"
)

OUTPUT_PMAX = os.path.join(
    OUTPUT_DIR,
    "mapa_pmax_conceptual.pdf"
)

OUTPUT_PREAL = os.path.join(
    OUTPUT_DIR,
    "mapa_preal_orc.pdf"
)

OUTPUT_PMAX_HTML = os.path.join(
    OUTPUT_DIR,
    "mapa_pmax_conceptual.html"
)

OUTPUT_PREAL_HTML = os.path.join(
    OUTPUT_DIR,
    "mapa_preal_orc.html"
)


# ------------------------------------------------------------
# Columnas
# ------------------------------------------------------------

COL_LONGITUD = "longitud"
COL_LATITUD = "latitud"

COL_PMAX = "Pmax_conceptual_kW"

COL_PREAL = "P_real_ORC_ML_kW"

# Columnas adicionales para información interactiva
# ============================================================
# COLUMNAS PARA INFORMACIÓN DE LOS POZOS
# ============================================================

COL_UWI = "UWI"
COL_POZO = "pozo"
COL_CAMPO = "campo"

COL_LONGITUD = "longitud"
COL_LATITUD = "latitud"

COL_T_CABEZA = "T_cabeza_C"
COL_P_CABEZA = "P_cabeza"
COL_UNIDAD_PRESION = "unidad_presion"

COL_FLUJO_MASICO = "flujo_masico_kg_s"

COL_PMAX = "Pmax_conceptual_kW"
COL_PREAL = "P_real_ORC_ML_kW"




# ============================================================
# 2. EXTENSIÓN GEOGRÁFICA
# ============================================================

LON_MIN = -79.7
LON_MAX = -67.9

LAT_MIN = -1.4
LAT_MAX = 13.65


# ============================================================
# 3. CONFIGURACIÓN VISUAL
# ============================================================

# Paleta de colores.
#
# Mantiene una transición clara de baja a alta potencia.
CMAP = "YlGnBu"

# Tamaño de los pozos
POINT_SIZE = 58

# Transparencia
POINT_ALPHA = 0.95

# Color del borde de los puntos
POINT_EDGE_COLOR = "#263746"

# Grosor del borde
POINT_EDGE_WIDTH = 0.60


# ============================================================
# 4. CARGAR Y LIMPIAR DATOS
# ============================================================

def cargar_datos(path):
    """
    Carga la base de predicciones y prepara las columnas
    necesarias para construir los mapas.
    """

    df = pd.read_csv(
        path,
        encoding="utf-8-sig"
    )

    required_columns = [
        COL_LONGITUD,
        COL_LATITUD,
        COL_PMAX,
        COL_PREAL
    ]

    missing = [
        col
        for col in required_columns
        if col not in df.columns
    ]

    if missing:
        raise ValueError(
            "Faltan las siguientes columnas "
            "en el archivo:\n"
            f"{missing}"
        )

    df = df.copy()

    # Convertir a valores numéricos
    for col in required_columns:

        df[col] = pd.to_numeric(
            df[col],
            errors="coerce"
        )

    # Eliminar únicamente registros sin coordenadas
    df = df.dropna(
        subset=[
            COL_LONGITUD,
            COL_LATITUD
        ]
    ).copy()

    # Coordenadas geográficas válidas
    df = df[
        df[COL_LATITUD].between(
            -90,
            90
        )
        &
        df[COL_LONGITUD].between(
            -180,
            180
        )
    ].copy()

    # Mantener únicamente puntos dentro de la extensión
    # utilizada para Colombia.
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
# 5. ROSA DE LOS VIENTOS
# ============================================================

def agregar_rosa_vientos(ax):
    """
    Agrega una rosa de los vientos al mapa.
    """

    rosa = ax.inset_axes([
        0.865,
        0.865,
        0.135,
        0.135
    ])

    rosa.set_xlim(
        -1.25,
        1.25
    )

    rosa.set_ylim(
        -1.25,
        1.25
    )

    rosa.set_aspect(
        "equal"
    )

    rosa.axis(
        "off"
    )

    color_oscuro = "#3F566B"
    color_borde = "#263746"
    color_claro = "#F1F3F5"

    # --------------------------------------------------------
    # Círculos exteriores
    # --------------------------------------------------------

    rosa.add_patch(
        Circle(
            (0, 0),
            1.0,
            facecolor="#F1F3F5",
            edgecolor=color_oscuro,
            linewidth=1.0,
            zorder=1
        )
    )

    rosa.add_patch(
        Circle(
            (0, 0),
            0.78,
            facecolor="none",
            edgecolor=color_oscuro,
            linewidth=0.7,
            zorder=2
        )
    )

    # --------------------------------------------------------
    # Estrella de ocho puntas
    # --------------------------------------------------------

    angulos = np.arange(
        0,
        360,
        45
    )

    for i, angulo in enumerate(
        angulos
    ):

        a = np.deg2rad(
            90 - angulo
        )

        # Direcciones principales
        if i % 2 == 0:

            radio = 0.88
            ancho = 0.17

        else:

            radio = 0.62
            ancho = 0.11

        punta = np.array([
            radio * np.cos(a),
            radio * np.sin(a)
        ])

        perpendicular = np.array([
            np.cos(
                a + np.pi / 2
            ),
            np.sin(
                a + np.pi / 2
            )
        ])

        izquierda = (
            perpendicular
            *
            ancho
        )

        derecha = (
            -perpendicular
            *
            ancho
        )

        triangulo1 = Polygon(
            [
                [0, 0],
                izquierda,
                punta
            ],
            closed=True,
            facecolor=(
                color_oscuro
                if i % 2 == 0
                else color_claro
            ),
            edgecolor=color_borde,
            linewidth=0.6,
            zorder=3
        )

        triangulo2 = Polygon(
            [
                [0, 0],
                derecha,
                punta
            ],
            closed=True,
            facecolor=(
                color_claro
                if i % 2 == 0
                else "#CBD7DF"
            ),
            edgecolor=color_borde,
            linewidth=0.6,
            zorder=3
        )

        rosa.add_patch(
            triangulo1
        )

        rosa.add_patch(
            triangulo2
        )

    # --------------------------------------------------------
    # Centro
    # --------------------------------------------------------

    rosa.add_patch(
        Circle(
            (0, 0),
            0.12,
            facecolor="#F1F3F5",
            edgecolor=color_borde,
            linewidth=1,
            zorder=5
        )
    )

    rosa.add_patch(
        Circle(
            (0, 0),
            0.035,
            facecolor=color_oscuro,
            edgecolor="none",
            zorder=6
        )
    )

    # --------------------------------------------------------
    # Letras
    # --------------------------------------------------------

    rosa.text(
        0,
        1.15,
        "N",
        ha="center",
        va="center",
        fontsize=10,
        fontweight="bold",
        color=color_oscuro
    )

    rosa.text(
        1.15,
        0,
        "E",
        ha="center",
        va="center",
        fontsize=10,
        fontweight="bold",
        color=color_oscuro
    )

    rosa.text(
        0,
        -1.20,
        "S",
        ha="center",
        va="center",
        fontsize=10,
        fontweight="bold",
        color=color_oscuro
    )

    rosa.text(
        -1.20,
        0,
        "O",
        ha="center",
        va="center",
        fontsize=10,
        fontweight="bold",
        color=color_oscuro
    )


# ============================================================
# 6. FORMATO DE COORDENADAS
# ============================================================

def formato_longitud(
    x,
    pos
):
    """
    Formato de longitud para Colombia.
    """

    if x < 0:

        return (
            f"{abs(x):.1f}° O"
        )

    elif x > 0:

        return (
            f"{abs(x):.1f}° E"
        )

    return "0.0°"


def formato_latitud(
    y,
    pos
):
    """
    Formato de latitud.
    """

    if abs(y) < 1e-10:

        return "0.0°"

    elif y > 0:

        return (
            f"{abs(y):.1f}° N"
        )

    else:

        return (
            f"{abs(y):.1f}° S"
        )


# ============================================================
# 7. CONFIGURACIÓN DEL MAPA
# ============================================================

def configurar_mapa_base(ax):
    """
    Configura extensión, basemap, cuadrícula,
    ticks, bordes y rosa de los vientos.
    """

    # --------------------------------------------------------
    # Límites
    # --------------------------------------------------------

    ax.set_xlim(
        LON_MIN,
        LON_MAX
    )

    ax.set_ylim(
        LAT_MIN,
        LAT_MAX
    )

    # --------------------------------------------------------
    # Basemap Esri
    # --------------------------------------------------------

    ctx.add_basemap(
        ax,
        source=(
            ctx.providers.Esri
            .WorldGrayCanvas
        ),
        crs="EPSG:4326",
        zoom=8,
        attribution=False,
        reset_extent=False
    )

    # Mantener exactamente los límites
    ax.set_xlim(
        LON_MIN,
        LON_MAX
    )

    ax.set_ylim(
        LAT_MIN,
        LAT_MAX
    )

    # --------------------------------------------------------
    # Cuadrícula
    # --------------------------------------------------------

    ax.grid(
        True,
        linestyle="--",
        linewidth=0.55,
        color="#AFAFAF",
        alpha=0.55,
        zorder=5
    )

    # --------------------------------------------------------
    # Ticks
    # --------------------------------------------------------

    ax.set_xticks([
        -77.5,
        -75.0,
        -72.5,
        -70.0
    ])

    ax.set_yticks([
        0.0,
        5.0,
        10.0
    ])

    ax.xaxis.set_major_formatter(
        FuncFormatter(
            formato_longitud
        )
    )

    ax.yaxis.set_major_formatter(
        FuncFormatter(
            formato_latitud
        )
    )

    ax.tick_params(
        axis="both",
        which="major",
        labelsize=9,
        length=5,
        width=0.8,
        direction="out",
        pad=8
    )

    # --------------------------------------------------------
    # Bordes
    # --------------------------------------------------------

    ax.spines[
        "top"
    ].set_visible(
        False
    )

    ax.spines[
        "right"
    ].set_visible(
        False
    )

    ax.spines[
        "left"
    ].set_color(
        "#333333"
    )

    ax.spines[
        "bottom"
    ].set_color(
        "#333333"
    )

    ax.spines[
        "left"
    ].set_linewidth(
        0.8
    )

    ax.spines[
        "bottom"
    ].set_linewidth(
        0.8
    )

    # --------------------------------------------------------
    # Rosa de los vientos
    # --------------------------------------------------------

    agregar_rosa_vientos(
        ax
    )

    # --------------------------------------------------------
    # Atribución
    # --------------------------------------------------------

    ax.text(
        0.004,
        0.004,
        (
            "Tiles (C) Esri -- "
            "Esri, DeLorme, NAVTEQ"
        ),
        transform=ax.transAxes,
        fontsize=4.5,
        color="#303030",
        ha="left",
        va="bottom",
        zorder=20
    )


# ============================================================
# 8. GENERAR UN MAPA DE POTENCIA
# ============================================================

def generar_mapa(
    df,
    columna_potencia,
    titulo,
    output_pdf,
    norm
):
    """
    Genera un mapa estático de potencia.
    """

    # Eliminar únicamente filas sin la potencia correspondiente
    df_plot = df.dropna(
        subset=[
            columna_potencia
        ]
    ).copy()

    if df_plot.empty:

        raise ValueError(
            f"No hay datos válidos para "
            f"{columna_potencia}"
        )

    # --------------------------------------------------------
    # Figura
    # --------------------------------------------------------

    fig = plt.figure(
        figsize=(
            7.41,
            8.91
        ),
        dpi=600,
        facecolor="white"
    )

    # Se deja espacio a la derecha para la barra de color
    ax = fig.add_axes([
        0.09,
        0.045,
        0.825,
        0.95
    ])

    # --------------------------------------------------------
    # Mapa base
    # --------------------------------------------------------

    configurar_mapa_base(
        ax
    )

    # --------------------------------------------------------
    # Pozos
    # --------------------------------------------------------

    scatter = ax.scatter(
        df_plot[
            COL_LONGITUD
        ],
        df_plot[
            COL_LATITUD
        ],
        s=POINT_SIZE,
        c=df_plot[
            columna_potencia
        ],
        cmap=CMAP,
        norm=norm,
        edgecolors=POINT_EDGE_COLOR,
        linewidths=POINT_EDGE_WIDTH,
        alpha=POINT_ALPHA,
        zorder=10
    )

    # --------------------------------------------------------
    # Título
    # --------------------------------------------------------

    #ax.set_title(
    #    titulo,
    #    fontsize=13,
    #    fontweight="bold",
    #    color="#263746",
    #    pad=12
    #)

    # --------------------------------------------------------
    # Barra de color
    # --------------------------------------------------------

    cax = fig.add_axes([
        0.925,
        0.16,
        0.018,
        0.68
    ])

    cbar = fig.colorbar(
        scatter,
        cax=cax,
        extend="max"   # agrega la extensión triangular arriba
    )

    cbar.set_label(
        "Potencia [kW]",
        fontsize=10,
        labelpad=8
    )

    # Ticks de la barra
    ticks = np.linspace(
        norm.vmin,
        norm.vmax,
        6
    )

    labels = [
        f"{t:.0f}"
        for t in ticks
    ]

    # La última etiqueta se muestra con +
    labels[-1] = f"{ticks[-1]:.0f}+"

    cbar.set_ticks(ticks)
    cbar.set_ticklabels(labels)

    cbar.ax.tick_params(
        labelsize=8
    )

    # --------------------------------------------------------
    # Guardar
    # --------------------------------------------------------

    os.makedirs(
        os.path.dirname(
            output_pdf
        ),
        exist_ok=True
    )

    fig.savefig(
        output_pdf,
        format="pdf",
        dpi=600,
        facecolor="white",
        bbox_inches=None,
        pad_inches=0
    )

    plt.close(
        fig
    )

    print(
        f"Mapa guardado: "
        f"{output_pdf}"
    )

# ============================================================
# 9. FUNCIONES PARA MAPAS INTERACTIVOS
# ============================================================

def formatear_valor(valor, decimales=3):
    """
    Formatea valores para popup y tooltip.
    """

    if pd.isna(valor):
        return "Sin dato"

    try:
        return f"{float(valor):,.{decimales}f}"
    except (TypeError, ValueError):
        return html.escape(str(valor))


def obtener_texto_seguro(row, columna):
    """
    Obtiene una columna de texto si existe.
    """

    if columna not in row.index:
        return "Sin dato"

    valor = row[columna]

    if pd.isna(valor):
        return "Sin dato"

    return html.escape(str(valor))


def obtener_color_continuo(valor, norm):
    """
    Convierte un valor de potencia en un color
    utilizando exactamente la misma paleta YlGnBu
    empleada en los mapas PDF.
    """

    if pd.isna(valor):
        return "#808080"

    cmap = plt.get_cmap(CMAP)

    # Valores por encima del máximo utilizan
    # el último color de la escala.
    valor_normalizado = np.clip(
        norm(float(valor)),
        0.0,
        1.0
    )

    return to_hex(
        cmap(valor_normalizado)
    )


# ============================================================
# MAPA INTERACTIVO
# ============================================================

def generar_mapa_interactivo(
    df,
    columna_potencia,
    titulo,
    output_html,
    norm
):
    """
    Genera un mapa interactivo HTML.

    Cada pozo muestra:
        - nombre del pozo
        - UWI
        - campo
        - coordenadas
        - caudal [bbl/d]
        - flujo másico [kg/s]
        - temperatura en cabeza [°C]
        - presión en cabeza
        - Pmax conceptual [kW]
        - potencia real ORC estimada [kW]
    """

    # --------------------------------------------------------
    # Copia y datos válidos
    # --------------------------------------------------------

    df_plot = df.copy()

    df_plot = df_plot.dropna(
        subset=[
            COL_LONGITUD,
            COL_LATITUD,
            columna_potencia
        ]
    ).copy()

    if df_plot.empty:
        raise ValueError(
            f"No hay datos válidos para {columna_potencia}"
        )

    # --------------------------------------------------------
    # Centro del mapa
    # --------------------------------------------------------

    centro_lat = float(
        df_plot[COL_LATITUD].mean()
    )

    centro_lon = float(
        df_plot[COL_LONGITUD].mean()
    )

    # --------------------------------------------------------
    # Crear mapa
    # --------------------------------------------------------

    mapa = folium.Map(
        location=[
            centro_lat,
            centro_lon
        ],
        zoom_start=6,
        tiles=None,
        control_scale=True
    )

    # ========================================================
    # MAPAS BASE
    # ========================================================

    # Esri gris
    folium.TileLayer(
        tiles=(
            "https://server.arcgisonline.com/"
            "ArcGIS/rest/services/"
            "Canvas/World_Light_Gray_Base/"
            "MapServer/tile/{z}/{y}/{x}"
        ),
        attr="Tiles © Esri",
        name="Esri Light Gray",
        control=True,
        show=True
    ).add_to(mapa)

    # OpenStreetMap
    folium.TileLayer(
        tiles="OpenStreetMap",
        name="OpenStreetMap",
        control=True,
        show=False
    ).add_to(mapa)

    # Esri satélite
    folium.TileLayer(
        tiles=(
            "https://server.arcgisonline.com/"
            "ArcGIS/rest/services/"
            "World_Imagery/"
            "MapServer/tile/{z}/{y}/{x}"
        ),
        attr="Tiles © Esri",
        name="Esri World Imagery",
        control=True,
        show=False
    ).add_to(mapa)

    # Esri topográfico
    folium.TileLayer(
        tiles=(
            "https://server.arcgisonline.com/"
            "ArcGIS/rest/services/"
            "World_Topo_Map/"
            "MapServer/tile/{z}/{y}/{x}"
        ),
        attr="Tiles © Esri",
        name="Esri World Topographic",
        control=True,
        show=False
    ).add_to(mapa)

    # ========================================================
    # FUNCIONES AUXILIARES INTERNAS
    # ========================================================

    def valor_seguro(row, columna):

        if columna not in row.index:
            return np.nan

        return row[columna]


    def texto_seguro(row, columna):

        if columna not in row.index:
            return "Sin dato"

        valor = row[columna]

        if pd.isna(valor):
            return "Sin dato"

        return html.escape(
            str(valor)
        )


    def numero_seguro(
        valor,
        decimales=2
    ):

        if pd.isna(valor):
            return "Sin dato"

        try:
            return (
                f"{float(valor):,.{decimales}f}"
            )

        except (TypeError, ValueError):
            return html.escape(
                str(valor)
            )

    # ========================================================
    # CAPA DE POZOS
    # ========================================================

    capa_pozos = folium.FeatureGroup(
        name=titulo,
        show=True
    )

    for _, row in df_plot.iterrows():

        # ----------------------------------------------------
        # Datos
        # ----------------------------------------------------

        pozo = texto_seguro(
        row,
        COL_POZO
        )

        uwi = texto_seguro(
            row,
            COL_UWI
        )

        campo = texto_seguro(
            row,
            COL_CAMPO
        )

        temperatura = valor_seguro(
            row,
            COL_T_CABEZA
        )

        presion = valor_seguro(
            row,
            COL_P_CABEZA
        )

        flujo_masico = valor_seguro(
            row,
            COL_FLUJO_MASICO
        )

        pmax = valor_seguro(
            row,
            COL_PMAX
        )

        preal = valor_seguro(
            row,
            COL_PREAL
        )

        if (
            COL_UNIDAD_PRESION in row.index
            and pd.notna(row[COL_UNIDAD_PRESION])
        ):
            unidad_presion = html.escape(
                str(row[COL_UNIDAD_PRESION])
            )
        else:
            unidad_presion = "psig"

        # ----------------------------------------------------
        # Unidad presión
        # ----------------------------------------------------

        if (
            COL_UNIDAD_PRESION in row.index
            and
            pd.notna(
                row[COL_UNIDAD_PRESION]
            )
        ):

            unidad_presion = html.escape(
                str(
                    row[COL_UNIDAD_PRESION]
                )
            )

        else:

            unidad_presion = "psig"

        # ----------------------------------------------------
        # Color según potencia del mapa
        # ----------------------------------------------------

        potencia_color = row[
            columna_potencia
        ]

        color = obtener_color_continuo(
            potencia_color,
            norm
        )

        # ====================================================
        # POPUP COMPLETO
        # ====================================================

        popup_html = f"""
        <div style="
            font-family: Arial;
            font-size: 13px;
            width: 350px;
        ">

            <div style="
                font-size: 16px;
                font-weight: bold;
                color: #1F4E79;
                margin-bottom: 10px;
                border-bottom: 1px solid #D9D9D9;
                padding-bottom: 6px;
            ">
                {pozo}
            </div>

            <table style="
                border-collapse: collapse;
                width: 100%;
            ">

                <tr>
                    <td style="padding:4px;">
                        <b>Pozo</b>
                    </td>
                    <td style="padding:4px;">
                        {pozo}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>UWI</b>
                    </td>
                    <td style="padding:4px;">
                        {uwi}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Campo</b>
                    </td>
                    <td style="padding:4px;">
                        {campo}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Latitud</b>
                    </td>
                    <td style="padding:4px;">
                        {float(row[COL_LATITUD]):.6f}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Longitud</b>
                    </td>
                    <td style="padding:4px;">
                        {float(row[COL_LONGITUD]):.6f}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Temperatura en cabeza</b>
                    </td>
                    <td style="padding:4px;">
                        {numero_seguro(temperatura, 2)} °C
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Presión en cabeza</b>
                    </td>
                    <td style="padding:4px;">
                        {numero_seguro(presion, 2)} {unidad_presion}
                    </td>
                </tr>

                <tr>
                    <td style="padding:4px;">
                        <b>Flujo másico</b>
                    </td>
                    <td style="padding:4px;">
                        {numero_seguro(flujo_masico, 5)} kg/s
                    </td>
                </tr>

                <tr style="
                    border-top:1px solid #D9D9D9;
                ">
                    <td style="
                        padding:6px 4px;
                        color:#184E77;
                    ">
                        <b>Potencia máxima conceptual</b>
                    </td>
                    <td style="
                        padding:6px 4px;
                        color:#184E77;
                    ">
                        <b>{numero_seguro(pmax, 3)} kW</b>
                    </td>
                </tr>

                <tr>
                    <td style="
                        padding:6px 4px;
                        color:#B33A3A;
                    ">
                        <b>Potencia real ORC estimada</b>
                    </td>
                    <td style="
                        padding:6px 4px;
                        color:#B33A3A;
                    ">
                        <b>{numero_seguro(preal, 3)} kW</b>
                    </td>
                </tr>

            </table>

        </div>
        """

        # ====================================================
        # TOOLTIP
        # ====================================================

        tooltip_html = f"""
        <div style="
            font-family:Arial;
            font-size:12px;
            line-height:1.5;
        ">

            <b>Pozo:</b> {pozo}<br>

            <b>UWI:</b> {uwi}<br>

            <b>Campo:</b> {campo}<br>

            <b>T. cabeza:</b>
            {numero_seguro(temperatura, 2)} °C<br>

            <b>Presión:</b>
            {numero_seguro(presion, 2)} {unidad_presion}<br>

            <b>Flujo másico:</b>
            {numero_seguro(flujo_masico, 5)} kg/s<br>

            <b>Pmax:</b>
            {numero_seguro(pmax, 2)} kW<br>

            <b>Preal ORC:</b>
            {numero_seguro(preal, 2)} kW

        </div>
        """

        # ====================================================
        # MARCADOR
        # ====================================================

        folium.CircleMarker(

            location=[
                float(
                    row[COL_LATITUD]
                ),
                float(
                    row[COL_LONGITUD]
                )
            ],

            radius=6,

            color="#263746",

            weight=0.7,

            fill=True,

            fill_color=color,

            fill_opacity=0.95,

            popup=folium.Popup(
                popup_html,
                max_width=400
            ),

            tooltip=folium.Tooltip(
                tooltip_html,
                sticky=True
            )

        ).add_to(
            capa_pozos
        )

    capa_pozos.add_to(
        mapa
    )

    # ========================================================
    # LEYENDA CONTINUA
    # ========================================================

    cmap = plt.get_cmap(
        CMAP
    )

    colores_leyenda = [
        to_hex(
            cmap(x)
        )
        for x in np.linspace(
            0,
            1,
            8
        )
    ]

    gradiente_css = ", ".join(
        colores_leyenda
    )

    leyenda_html = f"""
    <div style="
        position:fixed;
        bottom:35px;
        left:35px;
        width:280px;
        z-index:9999;
        background:white;
        padding:12px 14px;
        border:1.5px solid #555;
        border-radius:6px;
        box-shadow:0 1px 6px rgba(0,0,0,0.30);
        font-family:Arial;
        font-size:12px;
    ">

        <div style="
            font-weight:bold;
            margin-bottom:8px;
            color:#263746;
        ">
            Potencia [kW]
        </div>

        <div style="
            width:100%;
            height:18px;
            background:
            linear-gradient(
                to right,
                {gradiente_css}
            );
            border:1px solid #777;
        ">
        </div>

        <div style="
            display:flex;
            justify-content:space-between;
            margin-top:4px;
            font-size:11px;
        ">

            <span>
                {norm.vmin:.0f}
            </span>

            <span>
                {norm.vmax:.0f}+
            </span>

        </div>

    </div>
    """

    mapa.get_root().html.add_child(
        folium.Element(
            leyenda_html
        )
    )

    # ========================================================
    # TÍTULO
    # ========================================================

    titulo_html = f"""
    <div style="
        position:fixed;
        top:15px;
        left:50%;
        transform:translateX(-50%);
        z-index:9999;
        background:rgba(255,255,255,0.95);
        padding:8px 18px;
        border-radius:6px;
        box-shadow:0 1px 5px rgba(0,0,0,0.25);
        font-family:Arial;
        font-size:16px;
        font-weight:bold;
        color:#263746;
        white-space:nowrap;
    ">
        {titulo}
    </div>
    """

    mapa.get_root().html.add_child(
        folium.Element(
            titulo_html
        )
    )

    # ========================================================
    # VISTA
    # ========================================================

    mapa.fit_bounds([
        [
            LAT_MIN,
            LON_MIN
        ],
        [
            LAT_MAX,
            LON_MAX
        ]
    ])

    # --------------------------------------------------------
    # Control de capas
    # --------------------------------------------------------

    folium.LayerControl(
        collapsed=False
    ).add_to(
        mapa
    )

    # ========================================================
    # GUARDAR
    # ========================================================

    os.makedirs(
        os.path.dirname(
            output_html
        ),
        exist_ok=True
    )

    mapa.save(
        output_html
    )

    print(
        f"Mapa interactivo guardado: "
        f"{output_html}"
    )


# ============================================================
# 9. FUNCIÓN PRINCIPAL
# ============================================================

def main():

    print(
        "\n"
        + "=" * 70
    )

    print(
        "MAPAS DE DISTRIBUCIÓN ESPACIAL DE POTENCIA"
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
        f"\nPozos con coordenadas válidas: "
        f"{len(df)}"
    )

    # --------------------------------------------------------
    # ESCALA COMÚN DE POTENCIA
    # --------------------------------------------------------
    #
    # Ambos mapas utilizan exactamente el mismo vmin y vmax.
    #
    # vmin = 0 kW
    # vmax = máximo considerando simultáneamente Pmax y Preal.
    # --------------------------------------------------------

    valores_pmax = df[
        COL_PMAX
    ].dropna().to_numpy()

    valores_preal = df[
        COL_PREAL
    ].dropna().to_numpy()

    todos_los_valores = np.concatenate([
        valores_pmax,
        valores_preal
    ])

    if len(
        todos_los_valores
    ) == 0:

        raise ValueError(
            "No existen valores de potencia "
            "para generar los mapas."
        )

    potencia_min = 0.0

    potencia_max = 75.0

    print(
        "\nEscala común utilizada:"
    )

    print(
        f"  mínimo = "
        f"{potencia_min:.3f} kW"
    )

    print(
        f"  máximo = "
        f"{potencia_max:.3f} kW"
    )

    norm = Normalize(
        vmin=potencia_min,
        vmax=potencia_max
    )

    # --------------------------------------------------------
    # MAPA PMAX
    # --------------------------------------------------------

    generar_mapa(
        df=df,
        columna_potencia=COL_PMAX,
        titulo=(
            "Distribución espacial de la "
            "potencia máxima conceptual"
        ),
        output_pdf=OUTPUT_PMAX,
        norm=norm
    )

    # --------------------------------------------------------
    # MAPA POTENCIA REAL ORC
    # --------------------------------------------------------

    generar_mapa(
        df=df,
        columna_potencia=COL_PREAL,
        titulo=(
            "Distribución espacial de la "
            "potencia real ORC estimada"
        ),
        output_pdf=OUTPUT_PREAL,
        norm=norm
    )

    generar_mapa_interactivo(
        df=df,
        columna_potencia=COL_PMAX,
        titulo=(
            "Potencia máxima conceptual por pozo"
        ),
        output_html=OUTPUT_PMAX_HTML,
        norm=norm
    )

    generar_mapa_interactivo(
        df=df,
        columna_potencia=COL_PREAL,
        titulo=(
            "Potencia real ORC estimada por pozo"
        ),
        output_html=OUTPUT_PREAL_HTML,
        norm=norm
    )

    # --------------------------------------------------------
    # Final
    # --------------------------------------------------------

    print(
        "\n"
        + "=" * 70
    )

    print(
        "LOS DOS MAPAS FUERON GENERADOS CORRECTAMENTE"
    )

    print(
        "=" * 70
    )


# ============================================================
# 10. EJECUCIÓN INDEPENDIENTE
# ============================================================

if __name__ == "__main__":

    main()