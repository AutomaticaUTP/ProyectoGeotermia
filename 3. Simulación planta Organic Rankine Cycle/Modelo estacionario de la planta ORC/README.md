# Simulación dinámica de Ciclo Rankine Orgánico (ORC)

Este repositorio contiene el código fuente, la interfaz interactiva y el modelo matemático de simulación transitoria de un Ciclo Rankine Orgánico (ORC). Este trabajo es parte integral de nuestra publicación científica y utiliza un **Enfoque de Parámetros Concentrados** para analizar la dinámica y el comportamiento fenomenológico del sistema a lo largo del tiempo.

El simulador está construido en **Python** utilizando **PyTorch** para la integración eficiente de los sistemas de ecuaciones diferenciales ordinarias (EDOs) y **Streamlit** para la visualización interactiva del tablero de control.

## 📋 Características Principales

* **Modelado Dinámico Basado en Física:** Simulación de los estados transitorios del evaporador, condensador y la bomba de fluido en tiempo real.
* **Aceleración Tensorial:** Resolución del sistema acoplado de EDOs utilizando tensores de PyTorch.
* **Selección de Fluidos de Trabajo:** Base de datos integrada con propiedades termodinámicas ($C_p$, $\rho$, $T_{crit}$) para R245fa, Pentano y R134a.
* **Análisis Fenomenológico:** Visualización de la inercia térmica, el retraso del flujo másico y la generación de potencia eléctrica.

## 🧮 Modelado Matemático

El núcleo del simulador resuelve el siguiente sistema de ecuaciones diferenciales que rigen los balances de energía y cantidad de movimiento del ciclo termodinámico:

**1. Dinámica del Evaporador**
$$C_{evap}\frac{dT_{evap}(t)}{dt}=UA_{evap}(T_{source}-T_{evap}(t))-\tilde{m}(t)C_p(T_{evap}(t)-T_{cond}(t))$$

**2. Dinámica del Condensador**
$$C_{cond}\frac{dT_{cond}(t)}{dt}=\tilde{m}(t)C_p(T_{evap}(t)-T_{cond}(t))(1-\eta_{turb})-UA_{cond}(T_{cond}(t)-T_{sink})$$

**3. Inercia de la Bomba**
$$\tau_{pump}\frac{d\tilde{m}(t)}{dt}=\tilde{m}_{target}-\tilde{m}(t)$$

**4. Generación de Potencia Eléctrica**
$$P_{electric}(t)=\tilde{m}(t)\cdot C_p\cdot(T_{evap}(t)-T_{cond}(t))\cdot\eta_{turb}$$

## ⚙️ Instalación y Requisitos

Este proyecto requiere Python 3.9 o superior. Las dependencias principales para ejecutar el modelo incluyen `streamlit==1.53.1`, `torch==2.10.0`, `matplotlib==3.10.8` , y `pandas==2.3.3`. 

Para preparar tu entorno local, sigue estos pasos:

1. Clona el repositorio:
```bash
git clone https://github.com/tu-usuario/orc-dynamic-simulation.git
cd 'ProyectoGeotermia/2. Simulación planta Organic Rankine Cycle/Modelo estacionario de la planta ORC/'
```

2. Instala las dependencias necesarias leyendo el archivo de configuración:
```bash
pip install -r requirements.txt
```

## 🚀 Uso del Simulador

Para ejecutar el tablero interactivo en tu navegador local, utiliza el siguiente comando:

```bash
streamlit run modelo_orc.py
```

Una vez iniciada la aplicación, podrás utilizar la barra lateral para:
* Modificar el fluido orgánico.
* Alterar las condiciones de contorno (temperatura de la fuente de calor y del sumidero).
* Ajustar la inercia del sistema (Masa térmica del evaporador y tiempo de aceleración de la bomba).

