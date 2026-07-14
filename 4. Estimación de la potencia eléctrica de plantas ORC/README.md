# Estimación de la potencia eléctrica generada por plantas ORC

<p align = 'justify'>En esta carpeta del repositorio se encuentra contenida la información empleada y los modelos para estimar el potencial de generación de las plantas ORC, de los cuales existen 3 modelos hasta el momento, los cuales integran cálculos termodinámicos, análisis exergético, modelos de regresión y herramientas de aprendizaje automático para apoyar la estimación de potencia conceptual y potencia real esperada.

  
<p align = 'justify'>El repositorio se encuentra organizado en carpetas temáticas:

Estimacion_Potencia/
│
├── Análisis térmico y termodinámico de la planta ORC/
│
├── Bayesian regressor/
│
├── Modelo potencia conceptual y potencia real de los pozos/
│
└── README.md

## Análisis térmico y termodinámico de la planta ORC

<p align = 'justify'>Contiene los archivos relacionados con el análisis térmico y termodinámico de la planta ORC. En esta carpeta se estudian las condiciones de operación del ciclo, el comportamiento de las variables termodinámicas y la estimación de potencia a partir del funcionamiento de la planta.

## Bayesian regressor

<p align = 'justify'>Contiene el desarrollo asociado a modelos de regresión bayesiana. Estos modelos se utilizan para estimar potencia y, además, obtener una medida de incertidumbre en las predicciones. Esta parte es útil para analizar intervalos de confianza y evaluar la variabilidad esperada en los resultados.

## Modelo potencia conceptual y potencia real de los pozos

<p align = 'justify'>Contiene el modelo propuesto para estimar la potencia máxima conceptual y la potencia real ORC a partir de datos del recurso geotérmico y datos de operación. En esta carpeta se integran el análisis exergético, el preprocesamiento de las bases de datos, el entrenamiento de modelos de regresión y la generación de predicciones sobre los pozos o muestras del recurso.

