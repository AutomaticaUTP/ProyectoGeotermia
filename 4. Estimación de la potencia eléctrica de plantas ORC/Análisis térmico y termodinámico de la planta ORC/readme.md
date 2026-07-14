# Análisis ORC con R245fa

<p align = 'justify'>Este script estima el desempeño energético de una planta ORC utilizando agua de producción como fuente térmica y R245fa como fluido de trabajo. El cálculo se realiza para diferentes campos del polígono 12, considerando el caudal de agua producido y la temperatura de producción disponible.

## Objetivo

<p align = 'justify'>Calcular la potencia eléctrica neta que podría generarse mediante un ciclo ORC simple a partir del calor disponible en el agua de producción de distintos campos.

## Datos de entrada

El script utiliza una tabla interna con los siguientes datos por campo:

- `Campo`: nombre del campo.
- `BLD`: producción de agua en barriles por día.
- `T_prod`: temperatura de producción en °C.

## Metodología

<p align = 'justify'>Primero, el caudal de agua se convierte de barriles por día a metros cúbicos por segundo y luego a flujo másico usando una densidad constante del agua.

<p align = 'justify'>Posteriormente, se modela un ciclo ORC con R245fa. El ciclo considera:

- Condensación a temperatura fija,
- Evaporación con diferencia de temperatura tipo pinch,
- Sobrecalentamiento,
- Subenfriamiento,
- Eficiencia de turbina,
- Eficiencia de bomba.

<p align = 'justify'>Para cada campo se calcula el calor disponible, el flujo másico del fluido ORC, el trabajo de turbina, el trabajo de bomba, la potencia neta generada, la eficiencia térmica y el área estimada del evaporador.

<p align = 'justify'>Los campos con temperaturas de producción menores o iguales a 45 °C se descartan, asignando potencia cero.

## Variables principales de salida

| Variable | Descripción |
|---|---|
| `m_dot_ORC_kg_s` | Flujo másico del fluido ORC. |
| `Q_in_kW` | Calor térmico transferido al ciclo ORC. |
| `Potencia_generada_kW` | Potencia eléctrica neta estimada. |
| `Potencia_generada_MW` | Potencia eléctrica neta en MW. |
| `eta_th_percent` | Eficiencia térmica del ciclo. |
| `Area_evap_m2` | Área estimada del evaporador. |
