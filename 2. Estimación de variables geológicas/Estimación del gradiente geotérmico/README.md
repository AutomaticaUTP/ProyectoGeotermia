# Estimación del gradiente geotérmico mediante modelos multimodales

<p align = 'justify'>Este repositorio reúne los datos, códigos de preprocesamiento y de los modelos desarrollados para la <strong>estimación del gradiente geotérmico</strong> a partir de la integración de <strong>datos tabulares</strong> e <strong>imágenes satelitales multiespectrales</strong>. El proyecto parte de la idea de que la caracterización del potencial geotérmico puede enriquecerse cuando se combinan fuentes de información heterogéneas, capaces de describir tanto las propiedades observadas en campo o derivadas de análisis previos, como los patrones espaciales y espectrales presentes en imágenes satelitales.

<p align = 'justify'> En este contexto, los <strong>datos tabulares</strong> incluyen variables geológicas, geofísicas y topográficas asociados a pozos de hidrocarburos alrededor del país. Por otra parte, las <strong>imágenes multiespectrales</strong> permiten capturar información de la superficie terrestre en distintas bandas del espectro electromagnético, lo que facilita la identificación de rasgos relacionados con alteraciones minerales, estructuras geológicas, cobertura del suelo y otras señales indirectamente vinculadas con sistemas geotérmicos.

---

<p align = 'justify'>El propósito principal de esta carpeta del repositorio es construir y comparar distintos enfoques de modelado para determinar en qué medida cada fuente de información contribuye a la predicción del gradiente geotérmico. Para ello, se plantean tres líneas de trabajo complementarias: modelos basados únicamente en datos tabulares, modelos basados únicamente en imágenes multiespectrales y <strong>modelos multimodales</strong> que fusionan ambas fuentes dentro de una misma arquitectura de aprendizaje, donde se espera que la combinación de ambas modalidades permita mejorar el desempeño predictivo de los modelos unimodales.

<p align = 'justify'>Además de servir como entorno de experimentación, este repositorio busca mantener una organización clara y reproducible del flujo de trabajo, desde la preparación de los datos y el preprocesamiento de imágenes LANDSAT, hasta el entrenamiento, validación y comparación de modelos. De esta manera, se pretende facilitar tanto el análisis técnico de resultados como la reutilización de la metodología en estudios posteriores sobre exploración y caracterización geotérmica.

---

## Fuentes de información consideradas

Este proyecto se basa en dos grandes tipos de entrada:

- **Datos tabulares**: variables geológicas y geofísicas estructuradas asociadas pozos de hidrocarburos alrededor de Colombia.
- **Imágenes multiespectrales**: escenas satelitales procesadas para extraer información espectral y espacial relevante de Colombia.

---
