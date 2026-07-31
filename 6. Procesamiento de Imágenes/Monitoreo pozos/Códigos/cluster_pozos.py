"""
Agrupa pozos en clusters espaciales usando K-means y genera un JSON
con los bounds de cada cluster para exportar desde Google Earth Engine.

Uso:
    uv run scripts/cluster_pozos.py
    uv run scripts/cluster_pozos.py --input sources/pozos_en_poligonos.json --output clusters.json
    uv run scripts/cluster_pozos.py --num-clusters 200 --buffer-km 2.0
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

import numpy as np
from sklearn.cluster import KMeans


def cargar_pozos(json_path: str | Path) -> list[dict]:
    """Carga los pozos desde un archivo JSON."""
    json_path = Path(json_path)
    if not json_path.exists():
        print(f"Error: no se encontró el archivo {json_path}")
        sys.exit(1)

    with open(json_path, "r", encoding="utf-8") as f:
        pozos = json.load(f)

    print(f"Pozos cargados: {len(pozos)}")
    return pozos


def extraer_coordenadas(pozos: list[dict]) -> np.ndarray:
    """Extrae las coordenadas (lon, lat) de los pozos."""
    coords = []
    for pozo in pozos:
        lon = pozo.get("lon") or pozo.get("LONGITUD")
        lat = pozo.get("lat") or pozo.get("LATITUD")
        if lon is not None and lat is not None:
            coords.append([lon, lat])
        else:
            print(f"Advertencia: pozo {pozo.get('UWI', 'N/A')} sin coordenadas válidas")
    
    coords_array = np.array(coords)
    print(f"Coordenadas extraídas: {len(coords_array)} pozos")
    return coords_array


def calcular_num_clusters_optimo(num_pozos: int, pozos_por_cluster: int = 75) -> int:
    """Calcula el número óptimo de clusters basado en la cantidad de pozos."""
    num_clusters = max(1, num_pozos // pozos_por_cluster)
    print(f"Número de clusters calculado: {num_clusters} (~{pozos_por_cluster} pozos/cluster)")
    return num_clusters


def aplicar_kmeans(coords: np.ndarray, num_clusters: int) -> np.ndarray:
    """Aplica K-means clustering a las coordenadas."""
    print(f"Aplicando K-means con {num_clusters} clusters...")
    kmeans = KMeans(n_clusters=num_clusters, random_state=42, n_init=10)
    labels = kmeans.fit_predict(coords)
    print(f"Clustering completado")
    return labels


def calcular_bounds_cluster(
    coords_cluster: np.ndarray, buffer_km: float = 2.0
) -> dict:
    """
    Calcula los bounds (bounding box) de un cluster con un buffer adicional.
    
    Args:
        coords_cluster: Array de coordenadas [lon, lat] del cluster
        buffer_km: Buffer en kilómetros alrededor del cluster
    
    Returns:
        Dict con keys: min_lon, max_lon, min_lat, max_lat, center_lon, center_lat
    """
    min_lon, min_lat = coords_cluster.min(axis=0)
    max_lon, max_lat = coords_cluster.max(axis=0)
    center_lon, center_lat = coords_cluster.mean(axis=0)
    
    # Convertir buffer de km a grados (aproximación)
    # 1 grado de latitud ≈ 111 km
    # 1 grado de longitud ≈ 111 km * cos(latitud)
    buffer_lat = buffer_km / 111.0
    buffer_lon = buffer_km / (111.0 * np.cos(np.radians(center_lat)))
    
    # Aplicar buffer
    min_lon_buffered = min_lon - buffer_lon
    max_lon_buffered = max_lon + buffer_lon
    min_lat_buffered = min_lat - buffer_lat
    max_lat_buffered = max_lat + buffer_lat
    
    return {
        "min_lon": float(min_lon_buffered),
        "max_lon": float(max_lon_buffered),
        "min_lat": float(min_lat_buffered),
        "max_lat": float(max_lat_buffered),
        "center_lon": float(center_lon),
        "center_lat": float(center_lat),
    }


def generar_clusters(
    pozos: list[dict], 
    coords: np.ndarray, 
    labels: np.ndarray,
    buffer_km: float
) -> list[dict]:
    """Genera la lista de clusters con su información."""
    clusters = []
    unique_labels = np.unique(labels)
    
    for label in unique_labels:
        mask = labels == label
        coords_cluster = coords[mask]
        indices_cluster = np.where(mask)[0].tolist()
        
        bounds = calcular_bounds_cluster(coords_cluster, buffer_km)
        
        cluster_info = {
            "cluster_id": int(label),
            "num_pozos": int(len(coords_cluster)),
            "indices_pozos": indices_cluster,
            "bounds": bounds,
        }
        clusters.append(cluster_info)
    
    return clusters


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Agrupa pozos en clusters espaciales para exportar desde GEE."
    )
    parser.add_argument(
        "--input",
        type=str,
        default="sources/pozos_en_poligonos.json",
        help="Ruta al JSON de pozos (default: sources/pozos_en_poligonos.json)",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="clusters.json",
        help="Ruta de salida del JSON de clusters (default: clusters.json)",
    )
    parser.add_argument(
        "--num-clusters",
        type=int,
        default=None,
        help="Número de clusters (default: calculado automáticamente ~75 pozos/cluster)",
    )
    parser.add_argument(
        "--buffer-km",
        type=float,
        default=2.0,
        help="Buffer en km alrededor de cada cluster (default: 2.0)",
    )
    args = parser.parse_args()

    pozos = cargar_pozos(args.input)
    coords = extraer_coordenadas(pozos)
    
    if args.num_clusters is None:
        num_clusters = calcular_num_clusters_optimo(len(coords))
    else:
        num_clusters = args.num_clusters
    
    labels = aplicar_kmeans(coords, num_clusters)
    clusters = generar_clusters(pozos, coords, labels, args.buffer_km)
    
    output_data = {
        "num_clusters": len(clusters),
        "num_pozos_total": len(pozos),
        "buffer_km": args.buffer_km,
        "clusters": clusters,
    }
    
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(output_data, f, ensure_ascii=False, indent=2)
    
    print(f"\nClusters generados: {len(clusters)}")
    print(f"JSON guardado: {output_path}")
    
    print("\nEstadísticas de clusters:")
    sizes = [c["num_pozos"] for c in clusters]
    print(f"  Pozos por cluster - Min: {min(sizes)}, Max: {max(sizes)}, Promedio: {np.mean(sizes):.1f}")


if __name__ == "__main__":
    main()
