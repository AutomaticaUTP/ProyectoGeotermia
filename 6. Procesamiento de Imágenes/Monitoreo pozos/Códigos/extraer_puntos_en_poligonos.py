"""
Extrae puntos (pozos) que se encuentren dentro de polígenos de un archivo GeoPackage
y genera un JSON con la metadata de los puntos que cumplieron el criterio.

Uso:
    uv run scripts/extraer_puntos_en_poligonos.py
    uv run scripts/extraer_puntos_en_poligonos.py --gpkg pozos_poligonos.gpkg --output pozos_en_poligonos.json
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

import geopandas as gpd


def load_gpkg(gpkg_path: str | Path) -> tuple[gpd.GeoDataFrame, gpd.GeoDataFrame]:
    """Carga las capas de polígonos y pozos del GeoPackage."""
    gpkg_path = Path(gpkg_path)
    if not gpkg_path.exists():
        print(f"Error: no se encontró el archivo {gpkg_path}")
        sys.exit(1)

    poligonos = gpd.read_file(gpkg_path, layer="poligonos")
    pozos = gpd.read_file(gpkg_path, layer="pozos")

    print(f"Polígonos cargados: {len(poligonos)}")
    print(f"Pozos cargados:     {len(pozos)}")

    return poligonos, pozos


def puntos_dentro(pozos: gpd.GeoDataFrame, poligonos: gpd.GeoDataFrame) -> gpd.GeoDataFrame:
    """Realiza un spatial join para quedarse solo con los puntos dentro de algún polígono."""
    # Quitar columnas duplicadas que ya existen en pozos
    pozos_limpio = pozos.drop(columns=["poligono", "dentro_poligono"], errors="ignore")

    pozos_en_poligonos = gpd.sjoin(
        pozos_limpio, poligonos[["NAME", "geometry"]], how="inner", predicate="within"
    )
    pozos_en_poligonos = pozos_en_poligonos.rename(columns={"NAME": "poligono"})
    pozos_en_poligonos = pozos_en_poligonos.drop(columns=["index_right"], errors="ignore")

    print(f"Pozos dentro de polígonos: {len(pozos_en_poligonos)}")

    return pozos_en_poligonos


def _safe_value(val: object) -> object:
    """Convierte un valor a un tipo serializable por JSON."""
    import numpy as np
    import pandas as pd

    # Manejar arrays/Series primero
    if isinstance(val, (np.ndarray, pd.Series, list, tuple)):
        try:
            val = val.item() if hasattr(val, "item") and val.size == 1 else val.tolist() if hasattr(val, "tolist") else list(val)
        except (ValueError, AttributeError):
            val = val.tolist() if hasattr(val, "tolist") else str(val)

    if isinstance(val, pd.Timestamp):
        return val.isoformat()

    try:
        if pd.isna(val):
            return None
    except (ValueError, TypeError):
        pass

    if isinstance(val, (np.integer,)):
        return int(val)
    if isinstance(val, (np.floating,)):
        return float(val)

    return val


def geodataframe_a_dict(gdf: gpd.GeoDataFrame) -> list[dict]:
    """Convierte un GeoDataFrame a una lista de dicts serializable a JSON."""
    records = []
    for _, row in gdf.iterrows():
        record = {}
        for col in gdf.columns:
            if col == "geometry":
                record["geometry"] = row.geometry.wkt
            else:
                record[col] = _safe_value(row[col])
        records.append(record)
    return records


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extrae pozos dentro de polígonos de un GeoPackage y genera un JSON."
    )
    parser.add_argument(
        "--gpkg",
        type=str,
        default="pozos_poligonos.gpkg",
        help="Ruta al archivo GeoPackage (default: pozos_poligonos.gpkg)",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="pozos_en_poligonos.json",
        help="Ruta de salida del JSON (default: pozos_en_poligonos.json)",
    )
    args = parser.parse_args()

    poligonos, pozos = load_gpkg(args.gpkg)
    pozos_filtrados = puntos_dentro(pozos, poligonos)

    records = geodataframe_a_dict(pozos_filtrados)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(records, f, ensure_ascii=False, indent=2)

    print(f"\nJSON generado: {output_path} ({len(records)} registros)")


if __name__ == "__main__":
    main()
