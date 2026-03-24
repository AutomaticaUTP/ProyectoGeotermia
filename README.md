# Proyecto Geotermia

<p align = "justify">Repositorio oficial para el desarrollo de códigos, experimentos y herramientas computacionales asociadas al proyecto <strong>"Estimación de la capacidad de generación de energía eléctrica del agua coproducida en campos de petróleo y gas en Colombia a partir de técnicas de aprendizaje automático informado por la física."</strong>

<p align = "justify">Este repositorio integra diferentes componentes del flujo de trabajo del proyecto, desde el procesamiento de datos geofísicos para la estimación de parámetros geológicos, como el gradiente geotérmico, pasando por los métodos de simulación de generación de energía eléctrica a partir de la metodología ORC (*Organic Rankine Cycle*), los modelos de aprendizaje automático informado por la física y el procesamiento de imágenes para la estimación del impacto ambiental de los proyectos de explotación de hidrocarburos. 


## Estructura general del proyecto

El repositorio se encuentra organizado en cinco grandes etapas, cada una asociada a un componente clave del proyecto de investigación.

---

## 1. Descripción del sistema de datos

*Completar con descripción* 


## 2. Estimación de variables técnicas y geológicas

<p align = "justify"> En la primera etapa se condensan los modelos planteados para estimar variables técnicas y geológicas de los pozos, tales como el gradiente geotérmico, los perfiles de temperatura del fluido así como las temperaturas de salida y, finalmente, la caída de presión en pozos verticales bajo flujo líquido–líquido (aceite–agua). Esta etapa está divida en dos vertientes, el gradiente geotérmico y los parámetros del pozo; en la carpeta del gradiente geotérmico se encuentran las bases de datos empleadas en su estimación, el preprocesamiento de imágenes multiespectrales del <strong>LANDSAT 7</strong>, así como carpetas con los diferentes modelos de aprendizaje automático que se han desarrollado para la estimación del gradiente geotérmico, pasando de modelos con solo datos tabulares o solo con imágenes multiespectrales, a modelos multimodales que incluyen datos tabulares e imágenes multiespectrales para la esimación del gradiente. En la carpeta de parámetros del pozo se encuentran los modelos para estimar los perfiles de temperatura del fluido y la caída de presión en pozos verticales.

## 3. Simulación planta Organic Rankine Cycle (Jesus David)
<p align = "justify"> Se presentan dos tipos de enfoques para la simulación: un enfoque dinámico de la planta ORC y un enfoque
en estado estacionario de la planta ORC. Cada enfoque cuenta con un modelo y códigos. El modelo dinámico simula cada elemento de la planta ORC convencional para ver su comportamiento transitorio; por otro lado, el modelo estacionario toma en cuenta cada elemento y con ecuaciones físicas, se crea un modelo en conjunto de la planta. El modelo estacionario cuenta con dos códigos: un código donde se valida el modelo físico y otro donde se toma el modelo validado y se generaliza dejando abierto la posibilidad de cambiar parámetros de operación y de diseño.
*Completar con descripción* 

## 4. Redes neuronales informadas por la física
<p align = "justify">Se consolidan modelos orientados al uso de principios físicos en sistemas dinámicos, organizados en dos líneas de trabajo complementarias dentro de la carpeta. La primera corresponde al modelado de un sistema ideal masa–resorte mediante Hamiltonian Neural Networks (HNN), cuyo objetivo es aprender la dinámica del sistema a partir de sus variables de estado (posición y momento) y comparar el desempeño frente a una red neuronal tradicional (baseline), evaluando métricas como el error y la conservación de la energía. La segunda línea aborda el modelado de la dinámica de una bomba en un sistema ORC utilizando Physics-Informed Neural Networks (PINN), a partir de datos sintéticos generados por ecuaciones diferenciales bajo diferentes señales de entrada, e incorporando información física mediante la ecuación gobernante, condiciones iniciales y observaciones con ruido.

<p align = "justify">Cada subcarpeta incluye un notebook principal para la generación de datos, construcción, entrenamiento y evaluación de los modelos, así como módulos complementarios que implementan las arquitecturas de redes neuronales, la incorporación de la física mediante gradientes y residuos físicos, y estrategias de optimización.
 
## 5. Procesamiento de Imágenes (Lorena)

<p align = "justify"> La carpeta de procesamiento de imágenes está organizada en dos subcarpetas. La primera corresponde al dataset Alberta Wells, orientada al desarrollo de tareas de monitoreo de pozos. La segunda subcarpeta está enfocada al monitoreo ambiental y agrupa dos líneas de trabajo. La primera se centra en la segmentación de imágenes satelitales mediante técnicas de aprendizaje profundo. Para esta línea se emplean diversas bases de datos públicas, como DubaiDataset y DeepGlobe, para desarrollar tareas de segmentación multiclase, así como la Amazon Forest Dataset para segmentación binaria, enfocada en la clasificación de áreas de bosque y no bosque. La segunda línea de trabajo aborda aspectos geológicos, específicamente el análisis de susceptibilidad de la subsidencia del terreno. En esta sección se incluye la implementación del repositorio público disponible en: https://github.com/cbrengman/SarNet/tree/v1.0, el cual utiliza imágenes InSAR junto con redes neuronales para la detección y clasificación automática de deformaciones superficiales. También se se realiza un análisis exploratorio y un  procesamiento de imágenes InSAR con series temporales SBAS (Small Baseline Subset), con el objetivo de observar la evolución del desplazamiento del terreno. Para ello, se emplean herramientas como MintPy (Miami InSAR Time-Series Software in Python), utilizando la base de datos SanFranSenDT42, proporcionada por el laboratorio de propulsión a chorro de la NASA.
