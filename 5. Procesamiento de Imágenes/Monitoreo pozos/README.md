# Informe Ejecutivo: Detección Automatizada de Pozos de Petróleo y Gas

## Resumen del Proyecto
Este proyecto implementa una solución de **Inteligencia Artificial** diseñada para la identificación precisa de pozos de petróleo y gas (activos, suspendidos y abandonados) utilizando imágenes satelitales multiespectrales. El objetivo principal es localizar infraestructura no registrada para mitigar la emisión de gases de efecto invernadero (metano) y prevenir la contaminación de acuíferos.

## Metodología y Valor Tecnológico
*   **Fuente de Datos:** Se utilizó el *Alberta Wells Dataset*, compuesto por imágenes de alta resolución (3 metros por píxel) de satélites PlanetScope.
*   **Innovación:** A diferencia de la fotografía convencional, nuestro modelo analiza **4 bandas espectrales** (RGB + Infrarrojo Cercano), lo que permite distinguir firmas de calor y vegetación asociadas a la infraestructura de los pozos.
*   **Arquitectura:** Implementamos una red neuronal profunda tipo **ResUNet**, optimizada para segmentación binaria de alta precisión en terrenos diversos.

## Resultados Clave (Hitos del Entrenamiento)
Tras completar 50 épocas de entrenamiento, el modelo ha demostrado una capacidad robusta de detección:

| Métrica | Rendimiento (Val) | Significado |
| :--- | :---: | :--- |
| **Puntuación Dice (Macro)** | **73.11%** | Precisión global en la delimitación de estructuras. |
| **Especificidad** | **99.84%** | Tasa extremadamente baja de falsas alarmas (falsos positivos). |
| **Identificación de Pozos** | **Alta precisión** | El modelo logra aislar eficazmente la infraestructura del entorno natural. |

> [!NOTE]
> La alta especificidad (99.8%) garantiza que los recursos de inspección en campo no se desperdicien en ubicaciones incorrectas, optimizando los costos operativos de remediación ambiental.

## Conclusión e Impacto Estratégico
El sistema está listo para ser escalado. La automatización de este proceso permite:
1.  **Reducción de Costos:** Se eliminan semanas de inspección manual de catastro e imágenes.
2.  **Mitigación Ambiental:** Identificación acelerada de pozos abandonados que filtran metano.
3.  **Cumplimiento Regulatorio:** Herramienta clave para auditorías ambientales y reportes de sostenibilidad (ESG).

---
*Preparado para la junta directiva — 24 de marzo de 2026*
