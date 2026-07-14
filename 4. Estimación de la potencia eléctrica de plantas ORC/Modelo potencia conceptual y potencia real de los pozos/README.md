# Modelo de Potencia Máxima Conceptual y Potencia Real ORC

<p align = 'justify'>Esta carpeta contiene la metodología propuesta para estimar la potencia máxima conceptual de un recurso geotérmico y la potencia real esperada de una planta ORC. El enfoque combina análisis exergético y modelos de regresión supervisada.

<p align = 'justify'>La metodología surge de una situación práctica: se dispone de una base de datos del recurso geotérmico con variables como temperatura ambiente, temperatura en cabeza y flujo, pero no se conoce directamente la potencia que podría obtenerse mediante una planta ORC. Por otro lado, se cuenta con una segunda base de datos en la que se tienen variables similares y la potencia producida por una planta ORC real. A partir de esta relación, se plantea entrenar modelos que permitan transferir el conocimiento de la base ORC hacia la base del recurso.

<p align = 'justify'>En esta etapa inicial se utilizan datos simulados para validar el funcionamiento general del procedimiento antes de aplicar el modelo a bases de datos reales.

## Objetivo

Estimar dos variables principales:

1. **Potencia máxima conceptual** del recurso geotérmico.
2. **Potencia real ORC esperada** para las condiciones del recurso.

<p align = 'justify'>La potencia máxima conceptual se calcula mediante análisis exergético. La potencia real ORC se estima mediante un modelo de regresión entrenado con datos de operación de planta.

## Planteamiento metodológico

El modelo trabaja con dos bases de datos.

### Base del recurso geotérmico

Esta base representa las condiciones del recurso. Contiene variables como:

| Variable | Descripción |
|---|---|
| `T_ambiente_C` | Temperatura ambiente. |
| `T_cabeza_C` | Temperatura del fluido en cabeza de pozo. |
| `P_cabeza` | Presión en cabeza de pozo. |
| `unidad_presion` | Unidad de la presión reportada. |
| `flujo_bpd` | Flujo volumétrico en barriles por día. |

<p align = 'justify'>Esta base no contiene la potencia real producida por una planta ORC. Por esta razón, primero se calcula una potencia máxima conceptual mediante análisis exergético.

### Base de operación ORC

<p align = 'justify'>Esta base representa datos de operación de una planta ORC. Contiene variables similares a la base del recurso, pero además incluye la potencia real producida:

| Variable | Descripción |
|---|---|
| `T_ambiente_C` | Temperatura ambiente. |
| `T_cabeza_C` | Temperatura asociada al recurso. |
| `flujo_volumetrico_gpm` | Flujo volumétrico en galones por minuto. |
| `P_real_ORC_kW` | Potencia real generada por la planta ORC. |

Esta base se utiliza para entrenar el modelo que estima la potencia real ORC.

## Justificación del enfoque

<p align = 'justify'>La base del recurso permite caracterizar las condiciones geotérmicas de los pozos o puntos de interés, pero no permite conocer directamente la potencia eléctrica que podría producir una planta ORC. En cambio, la base de operación ORC sí contiene la potencia real producida por una planta, junto con variables de entrada equivalentes.

<p align = 'justify'>Por esta razón, se propone un enfoque de dos etapas. Primero, se calcula la potencia máxima conceptual del recurso mediante exergía, lo cual permite establecer un límite termodinámico de referencia. Luego, se entrena un modelo de regresión bayesiano con la base ORC para aprender la relación entre las condiciones de entrada y la potencia real producida.

<p align = 'justify'>Una vez entrenados los modelos, ambos se aplican sobre la base del recurso. De esta manera, para cada muestra del recurso se obtiene una estimación de la potencia máxima conceptual y una estimación de la potencia real ORC esperada.

## Flujo general

El procedimiento general es el siguiente:

```text
Base del recurso
    ├── Preprocesamiento
    ├── Conversión de presión y flujo
    ├── Cálculo de flujo másico
    ├── Análisis exergético
    └── Obtención de Pmax conceptual

Base ORC
    ├── Preprocesamiento
    ├── Conversión de flujo
    ├── Cálculo de flujo másico
    └── Uso de P_real_ORC como variable objetivo

Modelos de regresión
    ├── Modelo 1: estimación de Pmax conceptual
    └── Modelo 2: estimación de P_real_ORC

Aplicación final
    ├── Pmax conceptual estimada
    ├── P_real_ORC estimada
    ├── métricas de evaluación
    └── cociente R
