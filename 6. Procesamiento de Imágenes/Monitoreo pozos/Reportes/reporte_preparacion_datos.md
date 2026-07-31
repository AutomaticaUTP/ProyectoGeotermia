# Reporte de Preparación de Datos Satelitales

**Fecha:** 2026-07-30  
**Proyecto:** Oil & Gas Well Segmentation  
**Objetivo:** Preparar patches satelitales para inferencia con modelo entrenado en Alberta Wells Dataset

---

## 1. Contexto

Se busca validar un modelo de segmentación entrenado con el **Alberta Wells Dataset** (Zenodo) utilizando datos de pozos colombianos. El modelo fue entrenado con imágenes de **Planet Labs** a resolución de **3 m/px**, con patches de aproximadamente **350x350 píxeles** (~1050m x 1050m), y posteriormente redimensionados a **224x224** para aprovechar el backbone preentrenado de **EfficientNet**.

---

## 2. Análisis del Alberta Wells Dataset

### Características principales (extraídas del paper)

| Parámetro | Valor |
|-----------|-------|
| **Resolución espacial** | 3 m/px |
| **Tamaño de patch** | ~350x350 px (1050m x 1050m) |
| **Fuente de imagen** | Planet Labs (multiespectral) |
| **Bandas** | RGB + posiblemente NIR |
| **Total de pozos** | 213,447 |
| **Total de patches** | 188,000+ |
| **Pozos por patch** | Variable (ver Figura 1 del paper) |
| **Geografía** | Alberta, Canadá |

### Resolución por pixel

- **1 pixel = 3m x 3m = 9 m²**
- **1 pixel = 0.000009 km²**
- **Patch completo ≈ 1.1025 km²**

---

## 3. Análisis del Dataset de Pozos Colombianos

### Archivo fuente: `sources/pozos_en_poligonos.json`

**Total de pozos:** 9,816  
**Total de campos por pozo:** 105  
**Campos clave:** coordenadas (lon/lat), profundidad, temperatura, gradiente geotérmico, conductividad térmica, presión, geometría WKT, polígono de pertenencia.

### Distribución por polígono (cuencas)

| Polígono | Pozos |
|----------|-------|
| Llanos | 4,693 |
| Velazquez-Landazuri | 3,186 |
| San Lucas-Zulia | 831 |
| Putumayo | 288 |
| Trinidad | 224 |
| Prado-Villarrica | 187 |
| VIM-Cesar | 177 |
| Neiva | 69 |
| Morrosquillo-Cansona | 67 |
| Paipa-Samaca | 58 |
| Pitalito-Florencia | 19 |
| Guajira | 17 |

### Distribución por fuente

| Fuente | Pozos |
|--------|-------|
| FUENTE1_BIP | 8,244 |
| FUENTE2_UIS_DD1 | 1,338 |
| FUENTE1_F16_VMM | 199 |
| FUENTE1_F16_PUT12 | 35 |

### Estados de pozos (WELL_STA)

| Estado | Cantidad |
|--------|----------|
| ACT (Activo) | 234 |
| PRODUCTOR | 170 |
| TAPONADO_Y_ABANDONADO | 129 |
| Sin registro | ~9,283 (94.5%) |

**Nota:** El 86% de los pozos no tiene estado registrado en el campo `WELL_STA`.

---

## 4. Estrategia de Extracción de Imágenes Satelitales

### Problema identificado

- **Planet Labs** (fuente original del Alberta Dataset) **no está disponible gratuitamente** en Google Earth Engine.
- Los "polígonos" en el JSON son **cuencas sedimentarias completas** (ej: Llanos Orientales), no áreas pequeñas. Exportar media Colombia es inviable.
- Exportar **9,816 patches individuales** excede los límites de GEE (~3,000 tareas concurrentes).

### Solución propuesta

**Clustering espacial** de pozos usando **K-means** para agrupar pozos cercanos y exportar **1 GeoTIFF por cluster**.

#### Parámetros de clustering

- **Número de clusters:** 130 (~75 pozos/cluster)
- **Buffer:** 2 km alrededor de cada cluster
- **Estadísticas:** Min 1 pozo/cluster, Max 734 pozos/cluster, Promedio 75.5

### Fuente satelital seleccionada

**Sentinel-2** (COPERNICUS/S2_SR_HARMONIZED)

| Parámetro | Valor |
|-----------|-------|
| **Resolución espacial** | 10 m/px |
| **Bandas utilizadas** | B4 (Red), B3 (Green), B2 (Blue), B8 (NIR) |
| **Composite temporal** | Mediana de 2024 |
| **Filtro de nubes** | < 20% cobertura |
| **Formato de exportación** | GeoTIFF multibanda |

### Tamaño de patch en GEE

- **500x500 píxeles a 10 m/px** = **5 km x 5 km** por cluster
- Esto proporciona margen suficiente para centrar en cada pozo y extraer patches individuales posteriormente.

---

## 5. Scripts Creados

### 5.1. `scripts/cluster_pozos.py`

**Propósito:** Agrupa los 9,816 pozos en clusters espaciales usando K-means.

**Uso:**
```bash
uv run scripts/cluster_pozos.py
uv run scripts/cluster_pozos.py --input sources/pozos_en_poligonos.json --output clusters.json
uv run scripts/cluster_pozos.py --num-clusters 200 --buffer-km 2.0
```

**Parámetros:**
- `--input`: Ruta al JSON de pozos (default: `sources/pozos_en_poligonos.json`)
- `--output`: Ruta de salida del JSON de clusters (default: `clusters.json`)
- `--num-clusters`: Número de clusters (default: calculado automáticamente ~75 pozos/cluster)
- `--buffer-km`: Buffer en km alrededor de cada cluster (default: 2.0)

**Resultado:** `clusters.json` con estructura:
```json
{
  "num_clusters": 130,
  "num_pozos_total": 9816,
  "buffer_km": 2.0,
  "clusters": [
    {
      "cluster_id": 0,
      "num_pozos": 43,
      "indices_pozos": [0, 5, 12, ...],
      "bounds": {
        "min_lon": -73.688226,
        "max_lon": -73.346070,
        "min_lat": 7.459982,
        "max_lat": 7.737395,
        "center_lon": -73.517148,
        "center_lat": 7.598689
      }
    },
    ...
  ]
}
```

### 5.2. `scripts/generar_script_gee.py`

**Propósito:** Genera automáticamente el código JavaScript para Google Earth Engine Code Editor basado en los clusters.

**Uso:**
```bash
uv run scripts/generar_script_gee.py
uv run scripts/generar_script_gee.py --clusters clusters.json --output gee_script.js
uv run scripts/generar_script_gee.py --patch-size-px 500 --scale-m 10
```

**Parámetros:**
- `--clusters`: Ruta al JSON de clusters (default: `clusters.json`)
- `--output`: Ruta de salida del script JavaScript (default: `gee_export_script.js`)
- `--patch-size-px`: Tamaño del patch en píxeles (default: 500)
- `--scale-m`: Resolución en metros (default: 10)

**Resultado:** `gee_export_script.js` listo para copiar/pegar en GEE Code Editor.

### 5.3. `scripts/extraer_texto_pdf.py`

**Propósito:** Extrae el texto del paper de Alberta Wells Dataset por chunks (páginas) para análisis.

**Uso:**
```bash
uv run scripts/extraer_texto_pdf.py
uv run scripts/extraer_texto_pdf.py --pdf "sources/Alberta Wells Dataset Paper.pdf"
uv run scripts/extraer_texto_pdf.py --chunk-size 5 --mostrar-todo
```

---

## 6. Flujo de Trabajo Completo

```
┌─────────────────────────────────────────────────────────────┐
│ FASE 1: CLUSTERING (Python local)                           │
├─────────────────────────────────────────────────────────────┤
│ 1. Leer pozos_en_poligonos.json (9,816 pozos)               │
│ 2. Aplicar K-means → 130 clusters                           │
│ 3. Generar clusters.json con bounds y IDs                   │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ FASE 2: EXPORTACIÓN (Google Earth Engine)                   │
├─────────────────────────────────────────────────────────────┤
│ 1. Generar gee_export_script.js desde clusters.json         │
│ 2. Copiar/pegar en GEE Code Editor                          │
│ 3. Ejecutar script → 130 tareas de exportación              │
│ 4. Aceptar tareas en pestaña "Tasks"                        │
│ 5. GeoTIFFs se guardan en Google Drive/sentinel2_patches/   │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ FASE 3: PROCESAMIENTO LOCAL (Python)                        │
├─────────────────────────────────────────────────────────────┤
│ 1. Descargar GeoTIFFs desde Google Drive                    │
│ 2. Para cada cluster (130 GeoTIFFs):                        │
│    - Leer GeoTIFF con rasterio                              │
│    - Para cada pozo en el cluster:                          │
│      * Obtener coordenadas (lon/lat)                        │
│      * Convertir a píxeles usando transform del GeoTIFF     │
│      * Recortar patch centrado en el pozo                   │
│      * Redimensionar a 224x224                              │
│      * Guardar como .npy o .pt para inferencia              │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ FASE 4: INFERENCIA (PyTorch)                                │
├─────────────────────────────────────────────────────────────┤
│ 1. Cargar modelo entrenado (EfficientNet backbone)          │
│ 2. Para cada patch 224x224:                                 │
│    - Normalizar (mean/std de ImageNet o Alberta Dataset)    │
│    - Pasar por modelo → máscara de segmentación             │
│    - Guardar resultado                                      │
└─────────────────────────────────────────────────────────────┘
```

---

## 7. Consideraciones Técnicas

### Diferencias entre Alberta Dataset y datos actuales

| Aspecto | Alberta Dataset | Datos Colombianos |
|---------|----------------|-------------------|
| **Fuente satelital** | Planet Labs | Sentinel-2 |
| **Resolución** | 3 m/px | 10 m/px |
| **Cobertura espectral** | Multiespectral (detalles en paper) | RGB + NIR |
| **Época de imágenes** | No especificado | 2024 |
| **Geografía** | Alberta, Canadá | Colombia (diversas cuencas) |

### Impacto en el modelo

- **Diferencia de resolución:** 3.3x menor resolución en Sentinel-2 vs Planet Labs
- **Diferencia espectral:** Posibles diferencias en las respuestas espectrales
- **Diferencia geográfica:** Contexto geológico y vegetación diferentes
- **Transfer learning:** El modelo puede requerir fine-tuning o adaptación

### Recomendaciones

1. **Validación visual:** Antes de inferencia masiva, validar visualmente algunos patches extraídos
2. **Normalización:** Verificar si los valores de reflectancia de Sentinel-2 requieren normalización específica
3. **Fine-tuning:** Considerar fine-tuning del modelo con un subconjunto de datos colombianos etiquetados
4. **Análisis de sensibilidad:** Probar el modelo con diferentes configuraciones de preprocessing

---

## 8. Próximos Pasos

### Inmediatos

- [ ] Ejecutar `gee_export_script.js` en Google Earth Engine
- [ ] Descargar los 130 GeoTIFFs desde Google Drive
- [ ] Crear script Python para procesar GeoTIFFs y extraer patches individuales

### Posteriores

- [ ] Desarrollar script de inferencia con el modelo entrenado
- [ ] Validar resultados con datos de verdad terrestre (si están disponibles)
- [ ] Analizar métricas de desempeño (IoU, precision, recall)
- [ ] Documentar hallazgos y diferencias con Alberta Dataset

---

## 9. Archivos Generados

| Archivo | Descripción | Ubicación |
|---------|-------------|-----------|
| `clusters.json` | Clusters de pozos con bounds geográficos | Raíz del proyecto |
| `gee_export_script.js` | Script JavaScript para GEE | Raíz del proyecto |
| `scripts/cluster_pozos.py` | Script de clustering K-means | `scripts/` |
| `scripts/generar_script_gee.py` | Generador de script GEE | `scripts/` |
| `scripts/extraer_texto_pdf.py` | Extractor de texto del paper | `scripts/` |

---

## 10. Dependencias Agregadas

Se agregaron las siguientes dependencias al `pyproject.toml`:

```toml
dependencies = [
    ...
    "pymupdf>=1.24.0",      # Para extracción de texto de PDFs
    "scikit-learn>=1.4.0",  # Para clustering K-means
]
```

**Instalación:**
```bash
uv sync
```

---

## 11. Referencias

1. **Alberta Wells Dataset Paper:** `sources/Alberta Wells Dataset Paper.pdf`
   - Seth, P., Lin, M., Dwamena, B.Y., Boutot, J., Kang, M., & Rolnick, D. (2025)
   - arXiv:2410.09032v3 [cs.CV]
   - Dataset disponible en: https://zenodo.org/records/13743323

2. **Sentinel-2 en GEE:**
   - Colección: `COPERNICUS/S2_SR_HARMONIZED`
   - Documentación: https://developers.google.com/earth-engine/datasets/catalog/COPERNICUS_S2_SR_HARMONIZED

3. **Google Earth Engine:**
   - Code Editor: https://code.earthengine.google.com/
   - Documentación de exportación: https://developers.google.com/earth-engine/guides/exporting

---

**Fin del reporte**
