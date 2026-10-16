# ============================================================
# ESTADÍSTICAS DESCRIPTIVAS DE LAS DOS BASES DE DATOS
#
# Calcula para cada variable:
#   - Número de datos válidos N
#   - Mínimo
#   - Máximo
#   - Desviación estándar
#
# Genera:
#   results/estadisticas_bases_datos.csv
#   results/estadisticas_bases_datos.txt
#
# ============================================================

import os
import numpy as np
import pandas as pd


# ============================================================
# 1. RUTAS DE LOS ARCHIVOS
# ============================================================

# Base del recurso geotérmico
RESOURCE_PATH = "results/predicciones_base_recurso.csv"

# Base ORC
# Cambia esta ruta si tu archivo tiene otro nombre
ORC_PATH = "results/base_orc_real_procesada.csv"

# Archivos de salida
OUTPUT_CSV = "results/estadisticas_bases_datos.csv"
OUTPUT_TXT = "results/estadisticas_bases_datos.txt"


# ============================================================
# 2. VARIABLES A ANALIZAR
# ============================================================

# ------------------------------------------------------------
# Base del recurso
# ------------------------------------------------------------
#
# Se indican:
#   nombre interno de la columna
#   nombre que aparecerá en la tabla
#   unidad
# ------------------------------------------------------------

VARIABLES_RESOURCE = [
    {
        "column": "T_ambiente_C",
        "name": "T_amb",
        "unit": "°C"
    },
    {
        "column": "T_cabeza_C",
        "name": "T_head",
        "unit": "°C"
    },
    {
        "column": "P_cabeza",
        "name": "P_head",
        "unit": "psig"
    },
    {
        "column": "flujo_masico_kg_s",
        "name": "m_dot",
        "unit": "kg/s"
    }
]


# ------------------------------------------------------------
# Base ORC
# ------------------------------------------------------------

VARIABLES_ORC = [
    {
        "column": "T_ambiente_C",
        "name": "T_amb",
        "unit": "°C"
    },
    {
        "column": "T_cabeza_C",
        "name": "T_head",
        "unit": "°C"
    },
    {
        "column": "flujo_masico_kg_s",
        "name": "m_dot",
        "unit": "kg/s"
    },
    {
        "column": "P_real_ORC_kW",
        "name": "P_real_ORC",
        "unit": "kW"
    }
]


# ============================================================
# 3. CARGAR CSV
# ============================================================

def cargar_csv(path):
    """
    Lee un CSV y limpia los nombres de columnas.
    """

    if not os.path.exists(path):
        raise FileNotFoundError(
            f"No se encontró el archivo:\n{path}"
        )

    df = pd.read_csv(
        path,
        sep=None,
        engine="python",
        encoding="utf-8-sig"
    )

    df.columns = (
        df.columns
        .str.replace("\ufeff", "", regex=False)
        .str.strip()
    )

    return df


# ============================================================
# 4. CALCULAR ESTADÍSTICAS
# ============================================================

def calcular_estadisticas(
    df,
    variables,
    dataset_name
):
    """
    Calcula:
        N
        mínimo
        máximo
        desviación estándar

    para cada variable.
    """

    resultados = []

    for variable in variables:

        columna = variable["column"]
        nombre = variable["name"]
        unidad = variable["unit"]

        # ----------------------------------------------------
        # Verificar existencia de la columna
        # ----------------------------------------------------

        if columna not in df.columns:

            print(
                f"ADVERTENCIA: '{columna}' "
                f"no existe en {dataset_name}."
            )

            continue

        # ----------------------------------------------------
        # Convertir a numérico
        # ----------------------------------------------------

        valores = pd.to_numeric(
            df[columna],
            errors="coerce"
        )

        # Eliminar NaN e infinitos
        valores = valores.replace(
            [np.inf, -np.inf],
            np.nan
        ).dropna()

        # ----------------------------------------------------
        # Estadísticas
        # ----------------------------------------------------

        if len(valores) == 0:

            minimo = np.nan
            maximo = np.nan
            desviacion = np.nan

        else:

            minimo = valores.min()
            maximo = valores.max()

            # Desviación estándar muestral
            desviacion = valores.mean()

        resultados.append({
            "Dataset": dataset_name,
            "Variable": nombre,
            "Unit": unidad,
            "N": len(valores),
            "Minimum": minimo,
            "Maximum": maximo,
            "Std_dev": desviacion
        })

    return resultados


# ============================================================
# 5. FORMATO LATEX
# ============================================================

def imprimir_latex(df_resultados):
    """
    Imprime las filas listas para pegar en la tabla de Overleaf.
    """

    print("\n")
    print("=" * 80)
    print("FILAS PARA OVERLEAF")
    print("=" * 80)

    for _, row in df_resultados.iterrows():

        dataset = row["Dataset"]
        variable = row["Variable"]
        unidad = row["Unit"]

        n = int(row["N"])

        minimo = row["Minimum"]
        maximo = row["Maximum"]
        std = row["Std_dev"]

        print(
            f"{dataset} & "
            f"{variable} & "
            f"{unidad} & "
            f"{n} & "
            f"{minimo:.2f} & "
            f"{maximo:.2f} & "
            f"{std:.2f} \\\\"
        )


# ============================================================
# 6. GUARDAR TXT
# ============================================================

def guardar_txt_latex(
    df_resultados,
    output_path
):
    """
    Guarda las filas de la tabla en un TXT.
    """

    os.makedirs(
        os.path.dirname(output_path),
        exist_ok=True
    )

    with open(
        output_path,
        "w",
        encoding="utf-8"
    ) as f:

        for _, row in df_resultados.iterrows():

            f.write(
                f"{row['Dataset']} & "
                f"{row['Variable']} & "
                f"{row['Unit']} & "
                f"{int(row['N'])} & "
                f"{row['Minimum']:.2f} & "
                f"{row['Maximum']:.2f} & "
                f"{row['Std_dev']:.2f} \\\\\n"
            )


# ============================================================
# 7. FUNCIÓN PRINCIPAL
# ============================================================

def main():

    print("\n" + "=" * 80)
    print("ESTADÍSTICAS DESCRIPTIVAS DE LAS BASES DE DATOS")
    print("=" * 80)

    # --------------------------------------------------------
    # Cargar bases
    # --------------------------------------------------------

    df_resource = cargar_csv(
        RESOURCE_PATH
    )

    df_orc = cargar_csv(
        ORC_PATH
    )

    print(
        f"\nFilas totales base recurso: "
        f"{len(df_resource)}"
    )

    print(
        f"Filas totales base ORC: "
        f"{len(df_orc)}"
    )

    # --------------------------------------------------------
    # Estadísticas base recurso
    # --------------------------------------------------------

    resultados_resource = calcular_estadisticas(
        df=df_resource,
        variables=VARIABLES_RESOURCE,
        dataset_name="Geothermal resource"
    )

    # --------------------------------------------------------
    # Estadísticas base ORC
    # --------------------------------------------------------

    resultados_orc = calcular_estadisticas(
        df=df_orc,
        variables=VARIABLES_ORC,
        dataset_name="ORC operating"
    )

    # --------------------------------------------------------
    # Unir resultados
    # --------------------------------------------------------

    resultados = (
        resultados_resource
        + resultados_orc
    )

    df_resultados = pd.DataFrame(
        resultados
    )

    # --------------------------------------------------------
    # Mostrar resultados
    # --------------------------------------------------------

    print("\n")
    print(df_resultados.to_string(
        index=False
    ))

    # --------------------------------------------------------
    # Guardar CSV
    # --------------------------------------------------------

    os.makedirs(
        os.path.dirname(OUTPUT_CSV),
        exist_ok=True
    )

    df_resultados.to_csv(
        OUTPUT_CSV,
        index=False,
        encoding="utf-8-sig",
        float_format="%.4f"
    )

    # --------------------------------------------------------
    # Guardar TXT LaTeX
    # --------------------------------------------------------

    guardar_txt_latex(
        df_resultados,
        OUTPUT_TXT
    )

    # --------------------------------------------------------
    # Mostrar LaTeX
    # --------------------------------------------------------

    imprimir_latex(
        df_resultados
    )

    print("\n")
    print("=" * 80)
    print("ARCHIVOS GENERADOS")
    print("=" * 80)

    print(
        f"\nCSV:\n{OUTPUT_CSV}"
    )

    print(
        f"\nTXT para Overleaf:\n{OUTPUT_TXT}"
    )


# ============================================================
# 8. EJECUCIÓN
# ============================================================

if __name__ == "__main__":
    main()