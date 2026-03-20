# Proyecto Geotermia

<p align = "justify">Repositorio oficial para el desarrollo de códigos, experimentos y herramientas computacionales asociadas al proyecto <strong>"Estimación de la capacidad de generación de energía eléctrica del agua coproducida en campos de petróleo y gas en Colombia a partir de técnicas de aprendizaje automático informado por la física."</strong>

<p align = "justify">Este repositorio integra diferentes componentes del flujo de trabajo del proyecto, desde el procesamiento de datos geofísicos para la estimación de parámetros geológicos, como el gradiente geotérmico, pasando por los métodos de simulación de generación de energía eléctrica a partir de la metodología ORC (*Organic Rankine Cycle*), los modelos de aprendizaje automático informado por la física y el procesamiento de imágenes para la estimación del impacto ambiental de los proyectos de explotación de hidrocarburos. 


## Estructura general del proyecto

El repositorio se encuentra organizado en cuatro grandes etapas, cada una asociada a un componente clave del proyecto de investigación.

---

## 1. Descripción del sistema de datos

*Completar con descripción* 


## 2. Estimación de variables técnicas y geológicas

<p align = "justify"> En la primera estapa se condensan los modelos planteados para estimar variables técnicas y geológicas de los pozos, tales como el gradiente geotérmico, los perfiles de temperatura del fluido así como las temperaturas de salida y, finalmente, la caída de presión en pozos verticales bajo flujo líquido–líquido (aceite–agua). Esta etapa está divida en dos vertientes, el gradiente geotérmico y los parámetros del pozo; en la carpeta del gradiente geotérmico se encuentran las bases de datos empleadas en su estimación, el preprocesamiento de imágenes multiespectrales del <strong>LANDSAT 7</strong>, así como carpetas con los diferentes modelos de aprendizaje automático que se han desarrollado para la estimación del gradiente geotérmico, pasando de modelos con solo datos tabulares o solo con imágenes multiespectrales, a modelos multimodales que incluyen datos tabulares e imágenes multiespectrales para la esimación del gradiente. En la carpeta de parámetros del pozo se encuentran los modelos para estimar los perfiles de temperatura del fluido y la caída de presión en pozos verticales.

## 3. Simulación planta Organic Rankine Cycle (Jesus David)

*Completar con descripción* 

## 4. Redes neuronales informadas por la física (Alexandra)
<p align = "justify"> Simulación y modelado del sistema físico masa–resorte ideal utilizando redes neuronales, con el objetivo de comparar un modelo tradicional con una red neuronal hamiltoniana
 

## 5. Procesamiento de Imágenes (Lorena)

*Completar con descripción* 
