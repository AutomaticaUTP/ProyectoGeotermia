# Fundamentos y Modelo Matemático: Segmentación de Pozos de Petróleo y Gas

## 1. Introducción: ¿Qué es la Segmentación de Imágenes?
Para el ojo humano, identificar una estructura como un pozo de petróleo en una fotografía aérea es una tarea intuitiva. Sin embargo, para una computadora, una imagen es solo una matriz gigante de números. La **segmentación semántica de imágenes** es la técnica matemática mediante la cual un algoritmo asigna a cada píxel individual de la imagen una categoría o "etiqueta" (en nuestro caso: "fondo" o "pozo petrolero").

El objetivo es crear una función matemática (la red neuronal) que transforme una imagen de entrada $X$ en una máscara binaria $Y$, donde cada píxel $y_{i,j} \in \{0, 1\}$. El valor $1$ representa la presencia confirmada de infraestructura petrolera, y $0$ el terreno circundante.

## 2. La Arquitectura del Modelo: ResUNet
Para resolver este complejo problema geométrico, empleamos una arquitectura de aprendizaje profundo (Deep Learning) conocida como **ResUNet**. Esta combina las ventajas de dos estructuras de vanguardia: **U-Net** y **ResNet**.

### 2.1 El Enfoque U-Net (Codificador-Decodificador)
La arquitectura U-Net tiene forma de letra "U" y aborda el problema en dos fases:
1. **El Codificador (Contracción):** Comprime gradualmente la imagen. A través de operaciones de convolución matemática, extrae características abstractas (como líneas, esquinas, texturas). A medida que avanza, la resolución espacial disminuye, pero la "comprensión semántica" del algoritmo aumenta. 
2. **El Decodificador (Expansión):** Toma esta matriz comprimida y comienza a expandirla paso a paso para reconstruir la imagen original, asignando las etiquetas de probabilidad a cada píxel.
3. **Conexiones de Salto (Skip Connections):** Para no perder los bordes afilados y los detalles finos durante la compresión, U-Net copia directamente la información de alta resolución del codificador hacia el decodificador.

**Justificación:** Esto asegura que la computadora no solo entienda "qué" hay en la imagen (pozo), sino "dónde" está exactamente (sus límites precisos).

### 2.2 Redes Residuales (ResNet-34)
En nuestro modelo, la parte "codificadora" utiliza un bloque matemático llamado **ResNet-34**. A medida que las redes neuronales se construyen con más capas para aprender conceptos más difíciles, se enfrentan al problema del "desvanecimiento del gradiente" (la señal matemática se debilita a cero y el modelo deja de aprender).

ResNet soluciona esto introduciendo **conexiones residuales**. En lugar de forzar a la red a aprender una transformación completa $H(x)$, se le pide que aprenda solo la diferencia (o residuo) $F(x)$. Matemáticamente, la salida de la capa es:
$$ y = F(x) + x $$

**Justificación:** En términos sencillos, estas conexiones crean un "atajo" que permite que la información fluya sin obstáculos. Esto permite construir redes sumamente potentes y estables, capaces de detectar patrones sutiles del terreno que de otra manera pasarían desapercibidos.

## 3. Optimizando el Aprendizaje: Funciones de Costo (Loss)
Para que el modelo aprenda de sus errores, necesita medirlos matemáticamente. Esta métrica se denomina **Función de Costo**. 

Detectar pozos petroleros tiene un reto estadístico crítico: el "desequilibrio de clases". El 99% de una fotografía satelital es terreno vacío, y apenas un 1% es el pozo en sí. Si no corregimos esto, la computadora optará por el camino fácil y predecirá que *todo* es fondo, aparentando tener una precisión engañosa del 99%. 

Para obligar al modelo a encontrar los pozos, combinamos dos funciones matemáticas rigurosas:

### 3.1 Pérdida Focal (Focal Loss)
La Pérdida Focal modifica la fórmula estándar de error introduciendo un factor de modulación ponderado $(1 - p_t)^\gamma$.
$$ FL(p_t) = -\alpha_t (1 - p_t)^\gamma \log(p_t) $$
- $p_t$: es la certeza del modelo en su predicción (de 0 a 1).
- $\gamma$ (gamma): Es un factor de atenuación. Si la red adivina un píxel de "fondo vacío" fácilmente ($p_t$ cercano a 1), el término $(1 - p_t)$ tiende a cero, ignorando ese píxel. Pero si el modelo duda en un píxel difícil, el error se magnifica.

**Justificación:** Obliga al algoritmo a ignorar las aburridas extensiones de tierra y a concentrar casi todo su esfuerzo matemático en las anomalías y en los píxeles más difíciles: los pozos reales.

### 3.2 Coeficiente de Dice (Dice Loss)
El Índice de Dice es una medida de similitud geométrica entre dos conjuntos.
$$ \text{Dice} = \frac{2 |A \cap B|}{|A| + |B|} $$
Donde $A$ son los píxeles que la computadora *predice* como pozo, y $B$ son los píxeles del pozo *real*. $\cap$ representa la intersección (superposición). La pérdida se define como $1 - \text{Dice}$.

**Justificación:** A diferencia de contar simplemente cuántos píxeles adivinó bien, la pérdida Dice evalúa la **forma geométrica** total de la predicción. Asegura que la huella del pozo generada por la IA se superponga perfectamente con la realidad.

## 4. Entrada Multiespectral (RGB + NIR)
Las fotografías convencionales (como las de un teléfono celular) utilizan combinaciones de tres bandas del espectro visible: Rojo, Verde y Azul (RGB). Nuestro modelo opera con matrices tridimensionales que incorporan un cuarto canal adicional: el **Infrarrojo Cercano (NIR, por sus siglas en inglés)**.

**Justificación:** La vegetación sana refleja la luz infrarroja de manera extremadamente brillante, mientras que los materiales artificiales (metales, caminos compactados de las instalaciones petroleras) la absorben. Añadir el canal matemático NIR le otorga al algoritmo una "visión sobrehumana", permitiéndole separar de manera trivial las instalaciones industriales de su entorno forestal o desértico, reduciendo drásticamente las alarmas falsas.

---

## 5. Referencias

1. Ronneberger, O., Fischer, P., & Brox, T. (2015). *U-Net: Convolutional Networks for Biomedical Image Segmentation*. Medical Image Computing and Computer-Assisted Intervention (MICCAI).
2. He, K., Zhang, X., Ren, S., & Sun, J. (2016). *Deep Residual Learning for Image Recognition*. Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition (CVPR).
3. Lin, T. Y., Goyal, P., Girshick, R., He, K., & Dollár, P. (2017). *Focal Loss for Dense Object Detection*. Proceedings of the IEEE International Conference on Computer Vision (ICCV).
4. Milletari, F., Navab, N., & Ahmadi, S. A. (2016). *V-Net: Fully Convolutional Neural Networks for Volumetric Medical Image Segmentation*. International Conference on 3D Vision (3DV). (Aplicación pionera del Coeficiente Dice en Redes Neuronales).
