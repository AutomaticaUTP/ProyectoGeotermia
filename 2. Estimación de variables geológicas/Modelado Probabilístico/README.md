# Estimación del gradiente geotérmico mediante modelado probabilístico

<p align='justify'>Este repositorio reúne los datos y códigos de los modelos desarrollados para la <strong>estimación del gradiente geotérmico aparente</strong> en Colombia a partir de variables geológicas, geofísicas y espaciales. El proyecto se fundamenta en el uso de <strong>Procesos Gaussianos (GP)</strong> como marco de modelado probabilístico, lo que permite no solo obtener predicciones puntuales del gradiente sino también cuantificar la incertidumbre asociada a cada estimación, aspecto clave en la exploración de recursos geotérmicos.</p>

<p align='justify'>Los datos provienen principalmente de pozos de hidrocarburos distribuidos en cuencas sedimentarias colombianas, complementados con información geofísica derivada de modelos globales y regionales. Las variables consideradas describen propiedades de la corteza terrestre, el campo gravitacional, el campo magnético y el régimen tectónico de cada localización, integrando así múltiples fuentes de información sobre el estado térmico del subsuelo.</p>

---

<p align='justify'>El propósito principal de esta carpeta del repositorio es construir y comparar distintas configuraciones de GPs variacionales (<em>Sparse Variational Gaussian Processes</em>, SVGP) para determinar en qué medida cada componente del modelo —la estructura del kernel, la distribución variacional y la inicialización de hiperparámetros— contribuye a la calidad predictiva. Para ello, se plantean tres experimentos progresivos que evolucionan en complejidad: desde un modelo base con kernel aditivo simple, pasando por una optimización de la distribución variacional y la inicialización, hasta un kernel compuesto con términos de interacción entre la componente geológica y la componente espacial.</p>

<p align='justify'>Además de servir como entorno de experimentación, este repositorio busca mantener una organización clara y reproducible del flujo de trabajo, desde la preparación de los datos y el preprocesamiento de la variable objetivo mediante transformación logarítmica y estandarización, hasta el entrenamiento, evaluación por cuantiles y comparación de modelos. De esta manera, se pretende facilitar tanto el análisis técnico de resultados como la reutilización de la metodología en estudios posteriores sobre exploración y caracterización geotérmica en Colombia.</p>

---

## Fuentes de información consideradas

Este proyecto se basa en variables estructuradas de diversa procedencia:

- **Variables geofísicas**: anomalías magnéticas, gravimétricas (Bouguer y aire libre), gradiente vertical de gravedad y profundidad de Curie, derivadas de modelos globales y regionales.
- **Variables geológicas y tectónicas**: profundidad del Moho, distancia al basamento cristalino, tipo de falla y presencia de dominio volcánico, obtenidas del Servicio Geológico Colombiano (SGC) y la Agencia Nacional de Hidrocarburos (ANH).
- **Variables espaciales**: coordenadas geográficas proyectadas en UTM zona 18N (EPSG:32618) y elevación superficial.
- **Variable objetivo**: gradiente geotérmico aparente (°C/km), estimado a partir de mediciones de temperatura en pozos petroleros corregidas por el método empírico de la AAPG (INGEOMINAS, 2009).

---

## Estructura del repositorio

```
modelado probabilístico/
│
├── Baseline_GPs.ipynb                   # Experimento 1: SVGP base con kernel aditivo RBF
├── Baseline_GPs_Init_Opti.ipynb         # Experimento 2: distribución natural + NGD + inicialización heurística
├── Baseline_GPs_Init_Opti_Kernel.ipynb  # Experimento 3: kernel compuesto con término de interacción
│
├── data_weights.csv                     # Dataset con variables de entrada y pesos por cuartil
└── README.md
```

---

## Descripción de los experimentos

### Experimento 1 — `Baseline_GPs.ipynb`
Modelo base con distribución variacional de Cholesky y optimización Adam. El kernel es la suma de dos RBF anisotrópicos, uno para las variables geológicas y otro para las coordenadas espaciales.

### Experimento 2 — `Baseline_GPs_Init_Opti.ipynb`
Introduce la distribución variacional natural (`NaturalVariationalDistribution`) optimizada mediante gradiente natural (NGD), lo que mejora significativamente la convergencia. Se agrega una inicialización heurística de los lengthscales basada en la dimensionalidad de cada grupo de features: $\ell = \sqrt{d} \cdot \log(d)$.

### Experimento 3 — `Baseline_GPs_Init_Opti_Kernel.ipynb`
Incorpora un kernel compuesto que añade un término de interacción entre la componente geológica y la espacial:

$$k_{\text{total}} = \sigma_1^2\, k_{\text{geo}}^{\text{RBF}} + \sigma_2^2\, k_{\text{coord}}^{\text{Matérn}} + \sigma_3^2\left(k_{\text{geo}}^{\text{RBF}} \times k_{\text{coord}}^{\text{Matérn}}\right)$$

Reemplaza el RBF espacial por un kernel Matérn ($\nu = 1.5$), más adecuado para procesos geológicos con variaciones no suaves. Incluye además pesos de muestra en la función de pérdida (ELBO) para dar mayor relevancia a los gradientes extremos durante el entrenamiento.

---

## Preprocesamiento de la variable objetivo

La variable objetivo se transforma antes del entrenamiento mediante una composición de transformaciones:

$$y'' = \frac{\log(y) - \mu_{\log}}{\sigma_{\log}}$$

Las predicciones se desestandarizan y se deshace la transformación logarítmica teniendo en cuenta que la distribución resultante es log-normal:

$$\hat{y} = \exp\!\left(\mu_{\log} + \frac{\sigma_{\log}^2}{2}\right)$$

donde $\mu_{\log}$ y $\sigma_{\log}^2$ son la media y varianza predichas en el espacio logarítmico original.

---

## Requisitos

```bash
pip install gpytorch torch pandas numpy scikit-learn matplotlib seaborn pyproj geopandas
```

Los notebooks están diseñados para ejecutarse en **Google Colab**. La ruta del archivo de datos debe ajustarse según la ubicación en Google Drive:

```python
dir = "ruta/a/data_weights.csv"
data = pd.read_csv(dir, index_col=0)
```

---

## Referencias

- INGEOMINAS (2009). *Mapa Preliminar de Gradientes Geotérmicos de Colombia*. Bogotá.
- Mejía et al. (2024). Estimación del gradiente geotérmico en Colombia mediante modelos de inteligencia artificial.
- Servicio Geológico Colombiano — [Sistema de Información Geotérmica SIGT°](https://www.arcgis.com/apps/dashboards/0186f2c2b6e74866b849025b0bf6fd90)
- Hensman, J., Matthews, A., & Ghahramani, Z. (2015). *Scalable Variational Gaussian Process Classification*. AISTATS.
- Khan, M. & Lin, W. (2017). *Conjugate-Computation Variational Inference*. AISTATS.
