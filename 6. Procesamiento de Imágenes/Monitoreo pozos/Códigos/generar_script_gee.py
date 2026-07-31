"""
Genera el codigo JavaScript para Google Earth Engine Code Editor
basado en los clusters de pozos generados por cluster_pozos.py.

Uso:
    uv run scripts/generar_script_gee.py
    uv run scripts/generar_script_gee.py --clusters clusters.json --output gee_script.js
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path


def cargar_clusters(json_path: str | Path) -> dict:
    """Carga los clusters desde un archivo JSON."""
    json_path = Path(json_path)
    if not json_path.exists():
        print(f"Error: no se encontro el archivo {json_path}")
        sys.exit(1)

    with open(json_path, "r", encoding="utf-8") as f:
        data = json.load(f)

    print(f"Clusters cargados: {data['num_clusters']}")
    print(f"Pozos totales: {data['num_pozos_total']}")
    return data


def generar_codigo_gee(clusters_data: dict, patch_size_px: int = 500, scale_m: int = 10) -> str:
    """
    Genera el codigo JavaScript para GEE Code Editor.

    Args:
        clusters_data: Dict con la informacion de clusters
        patch_size_px: Tamano del patch en pixeles (default: 500)
        scale_m: Resolucion en metros (default: 10 para Sentinel-2)

    Returns:
        Codigo JavaScript como string
    """
    clusters = clusters_data["clusters"]

    codigo = f"""// ============================================================
// Script de Google Earth Engine para exportar patches de Sentinel-2
// Generado automaticamente desde clusters.json
// ============================================================

// Configuracion
var PATCH_SIZE_PX = {patch_size_px};
var SCALE_M = {scale_m};
var START_DATE = '2024-01-01';
var END_DATE = '2024-12-31';
var CLOUD_COVER_MAX = 20;

// Bandas de Sentinel-2: R, G, B, NIR
var BANDS = ['B4', 'B3', 'B2', 'B8'];
var BAND_NAMES = ['red', 'green', 'blue', 'nir'];

// ============================================================
// Funcion para escalar imagen Sentinel-2
// ============================================================
function scaleSentinel2(image) {{
  var opticalBands = image.select(['B2', 'B3', 'B4', 'B8']).multiply(0.0001);
  return image.addBands(opticalBands, null, true);
}}

// ============================================================
// Funcion para crear composite libre de nubes
// ============================================================
function createCloudFreeComposite(geometry) {{
  var collection = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
    .filterDate(START_DATE, END_DATE)
    .filterBounds(geometry)
    .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', CLOUD_COVER_MAX))
    .map(scaleSentinel2);

  var composite = collection.median();
  composite = composite.select(BANDS, BAND_NAMES);

  return composite;
}}

// ============================================================
// Funcion para exportar un cluster
// ============================================================
function exportCluster(clusterId, bounds, numPozos) {{
  var geometry = ee.Geometry.Rectangle([
    bounds.min_lon,
    bounds.min_lat,
    bounds.max_lon,
    bounds.max_lat
  ], null, false);

  var composite = createCloudFreeComposite(geometry);

  var exportParams = {{
    image: composite,
    description: 'sentinel2_cluster_' + clusterId,
    folder: 'sentinel2_patches',
    fileNamePrefix: 'cluster_' + clusterId,
    region: geometry,
    scale: SCALE_M,
    maxPixels: 1e13,
    fileFormat: 'GeoTIFF',
    formatOptions: {{
      cloudOptimized: false
    }}
  }};

  Export.image.toDrive(exportParams);

  print('Cluster ' + clusterId + ': ' + numPozos + ' pozos');
  print('  Bounds: [' + bounds.min_lon.toFixed(4) + ', ' + bounds.min_lat.toFixed(4) +
        ', ' + bounds.max_lon.toFixed(4) + ', ' + bounds.max_lat.toFixed(4) + ']');
}}

// ============================================================
// Exportar todos los clusters
// ============================================================
print('Iniciando exportacion de ' + {len(clusters)} + ' clusters...');
print('Configuracion: ' + PATCH_SIZE_PX + 'x' + PATCH_SIZE_PX + ' px a ' + SCALE_M + 'm/px');
print('Periodo: ' + START_DATE + ' a ' + END_DATE);
print('Cobertura de nubes maxima: ' + CLOUD_COVER_MAX + '%');

var clusters = [
"""

    for i, cluster in enumerate(clusters):
        bounds = cluster["bounds"]
        codigo += f"""  {{
    id: {cluster['cluster_id']},
    bounds: {{
      min_lon: {bounds['min_lon']:.6f},
      min_lat: {bounds['min_lat']:.6f},
      max_lon: {bounds['max_lon']:.6f},
      max_lat: {bounds['max_lat']:.6f}
    }},
    num_pozos: {cluster['num_pozos']}
  }}"""
        if i < len(clusters) - 1:
            codigo += ","
        codigo += "\n"

    codigo += """];

// Exportar cada cluster
clusters.forEach(function(cluster) {
  exportCluster(cluster.id, cluster.bounds, cluster.num_pozos);
});

print('---------------------------------------------------');
print('Exportacion iniciada correctamente.');
print('Total de tareas: ' + clusters.length);
print('Revisa la pestana "Tasks" en GEE para aceptar las exportaciones.');
print('Los archivos se guardaran en Google Drive en la carpeta "sentinel2_patches"');
print('---------------------------------------------------');
"""

    return codigo


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Genera codigo JavaScript para GEE basado en clusters de pozos."
    )
    parser.add_argument(
        "--clusters",
        type=str,
        default="clusters.json",
        help="Ruta al JSON de clusters (default: clusters.json)",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="gee_export_script.js",
        help="Ruta de salida del script JavaScript (default: gee_export_script.js)",
    )
    parser.add_argument(
        "--patch-size-px",
        type=int,
        default=500,
        help="Tamano del patch en pixeles (default: 500)",
    )
    parser.add_argument(
        "--scale-m",
        type=int,
        default=10,
        help="Resolucion en metros (default: 10)",
    )
    args = parser.parse_args()

    clusters_data = cargar_clusters(args.clusters)
    codigo_gee = generar_codigo_gee(clusters_data, args.patch_size_px, args.scale_m)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write(codigo_gee)

    print(f"\nScript JavaScript generado: {output_path}")
    print(f"Total de clusters a exportar: {clusters_data['num_clusters']}")
    print(f"\nInstrucciones:")
    print(f"1. Abre Google Earth Engine Code Editor: https://code.earthengine.google.com/")
    print(f"2. Copia el contenido de {output_path}")
    print(f"3. Pegalo en el editor de GEE")
    print(f"4. Haz clic en 'Run' para ejecutar")
    print(f"5. Ve a la pestana 'Tasks' y acepta cada tarea de exportacion")
    print(f"6. Los GeoTIFFs se guardaran en Google Drive en la carpeta 'sentinel2_patches'")


if __name__ == "__main__":
    main()
