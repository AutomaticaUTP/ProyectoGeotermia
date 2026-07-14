# Perfiles de temperatura del pozo

<p align = 'justify'>Este código implementa un modelo térmico simplificado para un pozo vertical, con el fin de estimar cómo evoluciona la temperatura de un fluido mientras circula por el pozo e intercambia calor con la formación rocosa. El modelo calcula tanto el perfil de temperatura del fluido a lo largo de la profundidad, <code>T(z)</code>, como la temperatura de salida en función del tiempo, <code>Tout(t)</code>.

<p align = 'justify'>La formación se representa con una temperatura que aumenta linealmente con la profundidad según un gradiente geotérmico, mientras que el intercambio de calor con la roca se modela mediante una resistencia térmica transitoria tipo Ramey o line-source. A partir de esta formulación, el script resuelve la temperatura del fluido para flujo ascendente o descendente, considerando la inercia térmica del flujo a través del caudal másico y el calor específico.

<p align = 'justify'>El código incluye funciones para calcular la resistencia térmica de la formación, resolver el perfil térmico del pozo en un instante dado y ejecutar simulaciones en series de tiempo. Además, permite representar mezclas agua-petróleo mediante un calor específico efectivo, por lo que no está limitado únicamente al agua.

<p align = 'justify'>Se trata de una herramienta útil para análisis preliminares del comportamiento térmico en pozos, aunque bajo supuestos simplificados: propiedades constantes, gradiente geotérmico lineal y ausencia de resistencias adicionales de tubería, cemento o convección interna. El bloque principal del script incluye un ejemplo completo de uso y genera gráficos de la evolución temporal de la temperatura de entrada y salida, así como de los perfiles térmicos a lo largo del pozo.

---

# Caída de presión en pozo vertical con mezcla aceite–agua

<p align = 'justify'>Este código calcula la caída de presión en un pozo vertical para una mezcla de aceite y agua, considerando dos aportes principales: el componente hidrostático, debido al peso de la columna de fluido, y el componente por fricción, asociado al rozamiento con la tubería. Con ello, permite estimar tanto la presión a lo largo de la profundidad como la caída total de presión entre cabeza y fondo.

<p align = 'justify'>El modelo usa un enfoque homogéneo o no-slip, por lo que ambas fases se tratan como una sola mezcla con propiedades efectivas de densidad y viscosidad. A partir de estas propiedades se calcula el número de Reynolds y el factor de fricción de Darcy, usando expresiones estándar para régimen laminar, transicional y turbulento.

<p align = 'justify'>Además de obtener la caída total de presión, el script permite construir el perfil de presión <code>P(z)</code> cuando se conoce una presión de referencia en cabeza o en fondo del pozo. El bloque principal incluye ejemplos para producción e inyección, junto con gráficos del perfil de presión y de la contribución hidrostática y friccional al gradiente total.

---

# Análisis de Sensibilidad de Temperatura en Cabeza de Pozo

<p align = 'justify'>Este modelo estima la temperatura del fluido en cabeza de pozo a partir de información térmica del fondo y de las condiciones físicas del pozo. Para ello, aplica un modelo térmico vertical que representa el intercambio de calor entre el fluido ascendente y la formación geológica.

<p align = 'justify'>El análisis considera que las variables reales de cada pozo permanecen fijas, mientras que se modifican parámetros asumidos relacionados con la roca, el fluido, la geometría del pozo y el comportamiento térmico del sistema. Con esto se evalúa cómo cambian las temperaturas estimadas en superficie ante variaciones en dichos parámetros.

<p align = 'justify'>El procedimiento aplica un análisis de sensibilidad global mediante índices de Sobol, lo que permite identificar qué parámetros tienen mayor influencia sobre la temperatura en cabeza de pozo. Además, genera un análisis tipo tornado para visualizar el efecto individual de cada parámetro asumido sobre la respuesta del modelo.
