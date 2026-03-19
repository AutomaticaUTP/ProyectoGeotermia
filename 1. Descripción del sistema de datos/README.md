# Sistema automatizado de recuperación de Datos geotérmicos

Repositorio oficial con el código fuente y la arquitectura de datos del artículo: **"Estimación de la capacidad de generación de energía eléctrica del agua coproducida en campos de petróleo y gas en Colombia a partir de técnicas de aprendizaje automático informado por la física"**.

Este repositorio contiene la implementación completa la solución técnica que automatiza el ciclo de vida de los datos geológicos y termodinámicos, desde su extracción en repositorios públicos (web scraping), pasando por su validación semántica asistida por Inteligencia Artificial (LLM local), hasta su ingesta estructurada en portales de datos abiertos (CKAN) y bases de datos relacionales (PostgreSQL).

## 🏗️ Arquitectura del sistema (Módulos)

El sistema adopta un paradigma de diseño modular con bajo acoplamiento, garantizando tolerancia a fallos y reanudación automática. Se divide en cuatro componentes principales:

1.  **Módulo 1: Adquisición de Datos (`scrapper_v2.ipynb`)**
      * Extrae de forma robusta e idempotente metadatos y archivos desde el Geothermal Data Repository (GDR).
      * Utiliza `TinyDB` para persistir el estado de las descargas y gestionar de forma segura los reintentos ante fallos de red.
2.  **Módulo 2: Procesamiento y Análisis Inteligente (`prepara_for_ingestion.ipynb`)**
      * Filtrado determinista para ubicar archivos tabulares comprimidos.
      * Emplea un servidor de inferencia local de IA (Llama.cpp + Instructor) para evaluar semánticamente la viabilidad del dataset frente a criterios de ingeniería geotérmica (Ciclo Orgánico de Rankine - ORC).
      * Extrae automáticamente variables físicas (Temperatura, Flujo de masa, Geoquímica).
3.  **Módulo 3: Ingesta y Publicación (`load_data_ckan.ipynb`)**
      * Publica de forma iterativa y recursiva los conjuntos de datos viables en una instancia CKAN.
      * Maneja automáticamente la descompresión de archivos jerárquicos para mejorar la accesibilidad pública de los datos.
4.  **Módulo 4: Estructuración Relacional (`sql_v1.sql` / `docker_postgres`)**
      * Transformación que centraliza los datos crudos hacia PostgreSQL.

## 📂 Estructura del repositorio

```text
.
├── docker_postgres/
│   ├── docker-compose.yml       # Orquestación del contenedor PostgreSQL/PostGIS
│   ├── postgres_data/           # Volumen persistente de la base de datos local
│   └── upload_docker.ipynb      # Notebook para la ingesta dinámica hacia la DB
├── Informe_de_descripción_del_sistema_de_datos_plantilla_UTP.pdf  # Documentación técnica extendida
├── load_data_ckan.ipynb         # Módulo 3: Wrapper de la API de CKAN (Publicación)
├── prepara_for_ingestion.ipynb  # Módulo 2: Pipeline de análisis cognitivo con LLM
├── scrapper_v2.ipynb            # Módulo 1: Pipeline de extracción de datos (Scraper)
└── sql_v1.sql                   # Esquema de tablas generadas automáticamente
```

## 🚀 Requisitos y configuración inicial

Para ejecutar este pipeline en su totalidad, se requiere la siguiente infraestructura y dependencias:

  * **Python 3.10+**
  * Instancia local o remota de **CKAN** (se requieren credenciales en un archivo `.env`).
  * Servidor de inferencia local **Llama.cpp** (ej. corriendo el modelo `mistral-14b-instruct` en el puerto 8000).
  * **Docker** y **Docker Compose** (para el entorno PostgreSQL).

**Librerías principales:**
`requests`, `beautifulsoup4`, `tinydb`, `pandas`, `pypdf`, `instructor`, `openai`, `pydantic`, `ckanapi`.

## ⚙️ Uso del sistema

El flujo de trabajo debe ejecutarse de manera estrictamente secuencial para mantener la integridad del pipeline:

1.  **Extracción (Scraping):** Ejecuta `scrapper_v2.ipynb` para descargar los lotes desde el repositorio de origen. Los archivos en crudo y el estado (`gdr_db.json`) se guardarán en la carpeta generada `gdr_data/`.
2.  **Evaluación Cognitiva:** Activa tu servidor LLM local. Luego, ejecuta `prepara_for_ingestion.ipynb`. Este proceso iterará sobre lo descargado, generará resúmenes estadísticos y guardará el veredicto en `metadata_analysis.json` para cada lote.
3.  **Publicación en CKAN:** Ejecuta `load_data_ckan.ipynb` para hacer un "push" de los datos catalogados como "viables" hacia tu portal CKAN.
4.  **Ingesta Relacional (Opcional):** Levanta el contenedor en la carpeta `docker_postgres` (`docker-compose up -d`), y corre `upload_docker.ipynb` para generar las tablas dinámicas de series de tiempo/geometría.


