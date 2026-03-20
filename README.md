# Proyecto Geotermia

<p align = "justify">Repositorio oficial para el desarrollo de códigos, experimentos y herramientas computacionales asociadas al proyecto <strong>"Estimación de la capacidad de generación de energía eléctrica del agua coproducida en campos de petróleo y gas en Colombia a partir de técnicas de aprendizaje automático informado por la física."</strong>

<p align = "justify">Este repositorio integra diferentes componentes del flujo de trabajo del proyecto, desde el procesamiento de datos geofísicos para la estimación de parámetros geológicos, como el gradiente geotérmico, pasando por los métodos de simulación de generación de energía eléctrica a partir de la metodología ORC (*Organic Rankine Cycle*), los modelos de aprendizaje automático informado por la física y el procesamiento de imágenes para la estimación del impacto ambiental de los proyectos de explotación de hidrocarburos. 


## Estructura general del proyecto

El repositorio se encuentra organizado en cinco grandes etapas, cada una asociada a un componente clave del proyecto de investigación.

---

## 1. Descripción del sistema de datos

*Completar con descripción* 


## 2. Estimación de variables técnicas y geológicas

<p align = "justify"> En la primera estapa se condensan los modelos planteados para estimar variables técnicas y geológicas de los pozos, tales como el gradiente geotérmico, los perfiles de temperatura del fluido así como las temperaturas de salida y, finalmente, la caída de presión en pozos verticales bajo flujo líquido–líquido (aceite–agua). Esta etapa está divida en dos vertientes, el gradiente geotérmico y los parámetros del pozo; en la carpeta del gradiente geotérmico se encuentran las bases de datos empleadas en su estimación, el preprocesamiento de imágenes multiespectrales del <strong>LANDSAT 7</strong>, así como carpetas con los diferentes modelos de aprendizaje automático que se han desarrollado para la estimación del gradiente geotérmico, pasando de modelos con solo datos tabulares o solo con imágenes multiespectrales, a modelos multimodales que incluyen datos tabulares e imágenes multiespectrales para la esimación del gradiente. En la carpeta de parámetros del pozo se encuentran los modelos para estimar los perfiles de temperatura del fluido y la caída de presión en pozos verticales.

## 3. Simulación planta Organic Rankine Cycle (Jesus David)

*Completar con descripción* 

## 4. Redes neuronales informadas por la física (Alexandra)
<p align = "justify">Se consolidan modelos orientados al uso de principios físicos en sistemas dinámicos. Como fase inicial, se desarrolló un experimento enfocado en el modelado de un sistema físico mediante Hamiltonian Neural Networks (HNN), aplicado a un sistema ideal masa–resorte. El objetivo principal es aprender la dinámica del sistema, es decir, su evolución temporal a partir de las variables de estado (posición y momento), y comparar el desempeño entre una red neuronal tradicional (baseline) y una red neuronal informada por principios físicos.

<p align = "justify">La carpeta incluye un notebook principal en el que se generan los datos del sistema, se construyen y entrenan los modelos, y posteriormente se evalúan mediante la integración de sus dinámicas, comparando métricas como el error y la conservación de la energía. Adicionalmente, se incluyen módulos complementarios para la definición del modelo HNN, que incorpora la estructura física mediante gradientes, y para las arquitecturas de redes neuronales base, incluyendo perceptrones multicapa y autoencoders.
 
## 5. Procesamiento de Imágenes (Lorena)

*Completar con descripción* 
