import os
import html

import numpy as np
import pandas as pd
import folium

from matplotlib.colors import Normalize


# ============================================================
# CONFIGURACIÓN
# ============================================================

INPUT_CSV = "results/predicciones_base_recurso.csv"

# Se conserva el nombre anterior para el mapa de Pmax.
OUTPUT_HTML = "results/mapa_interactivo_pozos_potencia.html"
OUTPUT_HTML_PMAX = OUTPUT_HTML

# Nuevo mapa de potencia real ORC estimada.
OUTPUT_HTML_PREAL = (
    "results/mapa_interactivo_pozos_preal.html"
)


# ------------------------------------------------------------
# Nombres de columnas
# ------------------------------------------------------------

COL_UWI = "UWI"
COL_POZO = "pozo"
COL_LONGITUD = "longitud"
COL_LATITUD = "latitud"
COL_CAMPO = "campo"

COL_PMAX = "Pmax_conceptual_kW"
COL_PREAL = "P_real_ORC_ML_kW"
COL_FLUJO_MASICO = "flujo_masico_kg_s"
COL_T_CABEZA = "T_cabeza_C"
COL_P_CABEZA = "P_cabeza"

# Columna opcional. Si existe, se mostrará su unidad real.
COL_UNIDAD_PRESION = "unidad_presion"


# ============================================================
# NIVELES DISCRETOS DE POTENCIA
# ============================================================
#
# Se utilizan los mismos intervalos para Pmax y Preal.
# Esto facilita la comparación visual entre ambos mapas.
# ============================================================

POWER_BINS = [
    0,
    1,
    5,
    10,
    25,
    50,
    100,
    np.inf
]

POWER_LABELS = [
    "< 1 kW",
    "1 – 5 kW",
    "5 – 10 kW",
    "10 – 25 kW",
    "25 – 50 kW",
    "50 – 100 kW",
    "≥ 100 kW"
]

POWER_COLORS = [
    "#D9D9D9",
    "#C6DBEF",
    "#9ECAE1",
    "#6BAED6",
    "#3182BD",
    "#08519C",
    "#4A1486"
]


# ============================================================
# FUNCIONES AUXILIARES
# ============================================================

def validar_columnas(df):
    """Comprueba que las columnas necesarias estén disponibles."""

    required_columns = [
        COL_UWI,
        COL_POZO,
        COL_LONGITUD,
        COL_LATITUD,
        COL_CAMPO,
        COL_PMAX,
        COL_PREAL,
        COL_FLUJO_MASICO,
        COL_T_CABEZA,
        COL_P_CABEZA
    ]

    missing = [
        col
        for col in required_columns
        if col not in df.columns
    ]

    if missing:
        raise ValueError(
            "Faltan las siguientes columnas en el archivo:\n"
            f"{missing}"
        )


def limpiar_datos(df):
    """Limpia coordenadas y variables utilizadas en el mapa."""

    df = df.copy()

    numeric_columns = [
        COL_LONGITUD,
        COL_LATITUD,
        COL_PMAX,
        COL_PREAL,
        COL_FLUJO_MASICO,
        COL_T_CABEZA,
        COL_P_CABEZA
    ]

    for col in numeric_columns:
        df[col] = pd.to_numeric(
            df[col],
            errors="coerce"
        )

    # Eliminar únicamente pozos sin coordenadas.
    df = df.dropna(
        subset=[
            COL_LATITUD,
            COL_LONGITUD
        ]
    ).copy()

    # Límites geográficos válidos.
    df = df[
        df[COL_LATITUD].between(-90, 90)
        &
        df[COL_LONGITUD].between(-180, 180)
    ].copy()

    return df.reset_index(
        drop=True
    )


def asignar_niveles_potencia(
    df,
    col_potencia
):
    """
    Clasifica la variable de potencia seleccionada
    en intervalos discretos.
    """

    df = df.copy()

    df["nivel_potencia"] = pd.cut(
        df[col_potencia],
        bins=POWER_BINS,
        labels=POWER_LABELS,
        include_lowest=True,
        right=False
    )

    return df


def obtener_color(valor):
    """Devuelve el color correspondiente al intervalo de potencia."""

    if pd.isna(valor):
        return "#808080"

    for i in range(
        len(POWER_BINS) - 1
    ):
        limite_inf = POWER_BINS[i]
        limite_sup = POWER_BINS[i + 1]

        if (
            limite_inf
            <= valor
            < limite_sup
        ):
            return POWER_COLORS[i]

    return "#808080"


def formatear_numero(
    valor,
    decimales=3
):
    """Formatea números para mostrarlos en popup y tooltip."""

    if pd.isna(valor):
        return "Sin dato"

    return f"{valor:,.{decimales}f}"


def obtener_unidad_presion(row):
    """
    Usa la unidad de presión de la base si está disponible.
    En caso contrario conserva psig como valor por defecto.
    """

    if (
        COL_UNIDAD_PRESION in row.index
        and pd.notna(
            row[COL_UNIDAD_PRESION]
        )
    ):
        return html.escape(
            str(
                row[COL_UNIDAD_PRESION]
            )
        )

    return "psig"


# ============================================================
# GENERADOR INTERNO DE MAPAS
# ============================================================

def _generar_mapa_por_potencia(
    input_csv,
    output_html,
    col_potencia_mapa,
    titulo_mapa,
    titulo_leyenda,
    nombre_capa
):
    """
    Genera un mapa interactivo cuya simbología se define
    mediante la columna indicada en col_potencia_mapa.

    El popup siempre muestra Pmax y Preal para facilitar
    la comparación entre ambos resultados.
    """

    # ========================================================
    # CARGAR DATOS
    # ========================================================

    df = pd.read_csv(
        input_csv
    )

    validar_columnas(
        df
    )

    df_mapa = limpiar_datos(
        df
    )

    df_mapa = asignar_niveles_potencia(
        df_mapa,
        col_potencia=col_potencia_mapa
    )

    if df_mapa.empty:
        raise ValueError(
            "No existen pozos con coordenadas válidas "
            "para generar el mapa."
        )

    print(
        f"\nPozos cargados en {titulo_mapa}: "
        f"{len(df_mapa)}"
    )

    # ========================================================
    # CENTRO
    # ========================================================

    centro_lat = float(
        df_mapa[COL_LATITUD].mean()
    )

    centro_lon = float(
        df_mapa[COL_LONGITUD].mean()
    )

    # ========================================================
    # CREAR MAPA
    # ========================================================

    mapa = folium.Map(
        location=[
            centro_lat,
            centro_lon
        ],
        zoom_start=7,
        tiles=None
    )

    # ========================================================
    # MAPAS BASE
    # ========================================================

    folium.TileLayer(
        tiles="OpenStreetMap",
        name="OpenStreetMap",
        control=True
    ).add_to(
        mapa
    )

    folium.TileLayer(
        tiles=(
            "https://server.arcgisonline.com/"
            "ArcGIS/rest/services/World_Imagery/"
            "MapServer/tile/{z}/{y}/{x}"
        ),
        attr="Tiles © Esri",
        name="Esri World Imagery",
        control=True
    ).add_to(
        mapa
    )

    folium.TileLayer(
        tiles=(
            "https://server.arcgisonline.com/"
            "ArcGIS/rest/services/World_Topo_Map/"
            "MapServer/tile/{z}/{y}/{x}"
        ),
        attr="Tiles © Esri",
        name="Esri World Topographic",
        control=True
    ).add_to(
        mapa
    )

    # ========================================================
    # CAPA DE POZOS
    # ========================================================

    capa_pozos = folium.FeatureGroup(
        name=nombre_capa,
        show=True
    )

    for _, row in df_mapa.iterrows():

        potencia_conceptual = row[
            COL_PMAX
        ]

        potencia_real = row[
            COL_PREAL
        ]

        potencia_para_color = row[
            col_potencia_mapa
        ]

        color = obtener_color(
            potencia_para_color
        )

        pozo = html.escape(
            str(
                row[COL_POZO]
            )
        )

        uwi = html.escape(
            str(
                row[COL_UWI]
            )
        )

        campo = html.escape(
            str(
                row[COL_CAMPO]
            )
        )

        unidad_presion = obtener_unidad_presion(
            row
        )

        nivel = (
            html.escape(
                str(
                    row[
                        "nivel_potencia"
                    ]
                )
            )
            if pd.notna(
                row[
                    "nivel_potencia"
                ]
            )
            else "Sin clasificación"
        )

        # ====================================================
        # POPUP
        # ====================================================

        popup_html = f"""
        <div style="
            font-family:Arial;
            font-size:13px;
            width:310px;
        ">

        <div style="
            font-size:15px;
            font-weight:bold;
            color:#1F4E79;
            margin-bottom:8px;
        ">
        {pozo}
        </div>

        <table style="
            border-collapse:collapse;
            width:100%;
        ">

        <tr>
            <td style="padding:4px;"><b>UWI</b></td>
            <td style="padding:4px;">{uwi}</td>
        </tr>

        <tr>
            <td style="padding:4px;"><b>Campo</b></td>
            <td style="padding:4px;">{campo}</td>
        </tr>

        <tr>
            <td style="padding:4px;"><b>Latitud</b></td>
            <td style="padding:4px;">
                {row[COL_LATITUD]:.6f}
            </td>
        </tr>

        <tr>
            <td style="padding:4px;"><b>Longitud</b></td>
            <td style="padding:4px;">
                {row[COL_LONGITUD]:.6f}
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Potencia máxima conceptual</b>
            </td>
            <td style="padding:4px;">
                {formatear_numero(potencia_conceptual)} kW
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Potencia real ORC estimada</b>
            </td>
            <td style="padding:4px;">
                {formatear_numero(potencia_real)} kW
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Temperatura en cabeza</b>
            </td>
            <td style="padding:4px;">
                {formatear_numero(row[COL_T_CABEZA], 3)} °C
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Presión en cabeza</b>
            </td>
            <td style="padding:4px;">
                {formatear_numero(row[COL_P_CABEZA], 3)}
                {unidad_presion}
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Flujo másico</b>
            </td>
            <td style="padding:4px;">
                {formatear_numero(row[COL_FLUJO_MASICO], 5)}
                kg/s
            </td>
        </tr>

        <tr>
            <td style="padding:4px;">
                <b>Nivel de potencia del mapa</b>
            </td>
            <td style="padding:4px;">
                {nivel}
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
            {formatear_numero(row[COL_T_CABEZA], 3)} °C<br>
            <b>P. cabeza:</b>
            {formatear_numero(row[COL_P_CABEZA], 3)}
            {unidad_presion}<br>
            <b>Flujo másico:</b>
            {formatear_numero(row[COL_FLUJO_MASICO], 5)}
            kg/s<br>
            <b>Potencia máxima conceptual:</b>
            {formatear_numero(potencia_conceptual, 3)}
            kW<br>
            <b>Potencia real estimada:</b>
            {formatear_numero(potencia_real, 3)}
            kW
        </div>
        """

        folium.CircleMarker(
            location=[
                row[COL_LATITUD],
                row[COL_LONGITUD]
            ],
            radius=6,
            popup=folium.Popup(
                popup_html,
                max_width=360
            ),
            tooltip=folium.Tooltip(
                tooltip_html,
                sticky=True
            ),
            color="black",
            weight=0.6,
            fill=True,
            fill_color=color,
            fill_opacity=0.90
        ).add_to(
            capa_pozos
        )

    capa_pozos.add_to(
        mapa
    )

    # ========================================================
    # LEYENDA
    # ========================================================

    items_leyenda = ""

    for etiqueta, color in zip(
        POWER_LABELS,
        POWER_COLORS
    ):
        items_leyenda += f"""
        <div style="
            display:flex;
            align-items:center;
            margin-bottom:5px;
        ">
            <span style="
                display:inline-block;
                width:18px;
                height:18px;
                background:{color};
                border:1px solid #555;
                margin-right:7px;
            ">
            </span>
            <span>{etiqueta}</span>
        </div>
        """

    leyenda_html = f"""
    <div style="
        position:fixed;
        bottom:35px;
        left:35px;
        width:230px;
        z-index:9999;
        background:white;
        padding:12px;
        border:2px solid #444;
        border-radius:6px;
        box-shadow:0 1px 6px rgba(0,0,0,0.35);
        font-family:Arial;
        font-size:13px;
    ">

        <div style="
            font-weight:bold;
            font-size:14px;
            margin-bottom:8px;
            color:#1F4E79;
        ">
            {titulo_leyenda}
        </div>

        {items_leyenda}

        <div style="
            margin-top:8px;
            font-size:11px;
            color:#555;
        ">
            Potencia expresada en kW
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
        color:#1F4E79;
    ">
        {titulo_mapa}
    </div>
    """

    mapa.get_root().html.add_child(
        folium.Element(
            titulo_html
        )
    )

    # ========================================================
    # AJUSTAR VISTA
    # ========================================================

    mapa.fit_bounds([
        [
            df_mapa[COL_LATITUD].min(),
            df_mapa[COL_LONGITUD].min()
        ],
        [
            df_mapa[COL_LATITUD].max(),
            df_mapa[COL_LONGITUD].max()
        ]
    ])

    folium.LayerControl(
        collapsed=False
    ).add_to(
        mapa
    )

    # ========================================================
    # GUARDAR
    # ========================================================

    directory = os.path.dirname(
        output_html
    )

    if directory:
        os.makedirs(
            directory,
            exist_ok=True
        )

    mapa.save(
        output_html
    )

    print(
        "\nMapa generado correctamente:"
    )

    print(
        output_html
    )

    return output_html


# ============================================================
# MAPA 1: PMAX CONCEPTUAL
# ============================================================

def generar_mapa_pozos(
    input_csv=INPUT_CSV,
    output_html=OUTPUT_HTML_PMAX
):
    """
    Conserva el mapa original:
    los colores representan Pmax conceptual.
    """

    return _generar_mapa_por_potencia(
        input_csv=input_csv,
        output_html=output_html,
        col_potencia_mapa=COL_PMAX,
        titulo_mapa=(
            "Potencia máxima conceptual estimada por pozo"
        ),
        titulo_leyenda=(
            "Potencia máxima conceptual"
        ),
        nombre_capa=(
            "Pozos - Pmax conceptual"
        )
    )


# ============================================================
# MAPA 2: POTENCIA REAL ORC
# ============================================================

def generar_mapa_pozos_preal(
    input_csv=INPUT_CSV,
    output_html=OUTPUT_HTML_PREAL
):
    """
    Nuevo mapa:
    los colores representan la potencia real ORC estimada.
    """

    return _generar_mapa_por_potencia(
        input_csv=input_csv,
        output_html=output_html,
        col_potencia_mapa=COL_PREAL,
        titulo_mapa=(
            "Potencia real ORC estimada por pozo"
        ),
        titulo_leyenda=(
            "Potencia real ORC estimada"
        ),
        nombre_capa=(
            "Pozos - potencia real ORC"
        )
    )


# ============================================================
# GENERAR LOS DOS MAPAS
# ============================================================

def generar_mapas_pozos(
    input_csv=INPUT_CSV,
    output_pmax=OUTPUT_HTML_PMAX,
    output_preal=OUTPUT_HTML_PREAL
):
    """
    Genera los dos mapas:
    1. Pmax conceptual.
    2. Potencia real ORC estimada.
    """

    mapa_pmax = generar_mapa_pozos(
        input_csv=input_csv,
        output_html=output_pmax
    )

    mapa_preal = generar_mapa_pozos_preal(
        input_csv=input_csv,
        output_html=output_preal
    )

    return {
        "Pmax": mapa_pmax,
        "Preal": mapa_preal
    }


if __name__ == "__main__":
    generar_mapas_pozos()
