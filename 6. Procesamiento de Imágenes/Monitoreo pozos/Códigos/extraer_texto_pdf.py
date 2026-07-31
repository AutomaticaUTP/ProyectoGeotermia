"""
Extrae el texto de un PDF por chunks (páginas) para análisis.

Uso:
    uv run scripts/extraer_texto_pdf.py
    uv run scripts/extraer_texto_pdf.py --pdf "sources/Alberta Wells Dataset Paper.pdf"
    uv run scripts/extraer_texto_pdf.py --chunk-size 5
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

import fitz  # pymupdf


def cargar_pdf(pdf_path: str | Path) -> fitz.Document:
    """Carga el documento PDF."""
    pdf_path = Path(pdf_path)
    if not pdf_path.exists():
        print(f"Error: no se encontró el archivo {pdf_path}")
        sys.exit(1)

    doc = fitz.open(pdf_path)
    print(f"PDF cargado: {pdf_path.name}")
    print(f"Total de páginas: {len(doc)}")
    return doc


def extraer_texto_por_paginas(doc: fitz.Document, pagina_inicial: int = 0, max_paginas: int | None = None) -> list[dict]:
    """Extrae el texto de cada página del PDF."""
    chunks = []
    total_paginas = len(doc)
    
    if max_paginas is None:
        max_paginas = total_paginas
    
    pagina_final = min(pagina_inicial + max_paginas, total_paginas)
    
    for num_pagina in range(pagina_inicial, pagina_final):
        pagina = doc[num_pagina]
        texto = pagina.get_text("text")
        
        chunks.append({
            "pagina": num_pagina + 1,
            "texto": texto.strip(),
        })
    
    return chunks


def extraer_texto_por_bloques(doc: fitz.Document, chunk_size: int = 3) -> list[dict]:
    """Extrae el texto agrupando varias páginas por chunk."""
    chunks = []
    total_paginas = len(doc)
    
    for i in range(0, total_paginas, chunk_size):
        texto_combinado = []
        paginas_incluidas = []
        
        for j in range(i, min(i + chunk_size, total_paginas)):
            pagina = doc[j]
            texto = pagina.get_text("text")
            texto_combinado.append(texto.strip())
            paginas_incluidas.append(j + 1)
        
        chunks.append({
            "paginas": paginas_incluidas,
            "texto": "\n\n".join(texto_combinado),
        })
    
    return chunks


def mostrar_chunks(chunks: list[dict], mostrar_todo: bool = False) -> None:
    """Muestra los chunks extraídos."""
    print(f"\n{'='*80}")
    print(f"TOTAL DE CHUNKS: {len(chunks)}")
    print(f"{'='*80}\n")
    
    for i, chunk in enumerate(chunks, 1):
        if "pagina" in chunk:
            header = f"CHUNK {i} - PÁGINA {chunk['pagina']}"
        else:
            header = f"CHUNK {i} - PÁGINAS {chunk['paginas']}"
        
        print(f"\n{'='*80}")
        print(header)
        print(f"{'='*80}\n")
        
        texto = chunk["texto"]
        
        if mostrar_todo:
            print(texto)
        else:
            print(texto[:2000])
            if len(texto) > 2000:
                print(f"\n... [texto truncado, {len(texto)} caracteres en total] ...")
        
        print()


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extrae el texto de un PDF por chunks para análisis."
    )
    parser.add_argument(
        "--pdf",
        type=str,
        default="sources/Alberta Wells Dataset Paper.pdf",
        help="Ruta al archivo PDF (default: sources/Alberta Wells Dataset Paper.pdf)",
    )
    parser.add_argument(
        "--chunk-size",
        type=int,
        default=1,
        help="Número de páginas por chunk (default: 1)",
    )
    parser.add_argument(
        "--pagina-inicial",
        type=int,
        default=0,
        help="Página inicial (0-indexado, default: 0)",
    )
    parser.add_argument(
        "--max-paginas",
        type=int,
        default=None,
        help="Máximo de páginas a procesar (default: todas)",
    )
    parser.add_argument(
        "--mostrar-todo",
        action="store_true",
        help="Mostrar el texto completo sin truncar",
    )
    args = parser.parse_args()

    doc = cargar_pdf(args.pdf)
    
    if args.chunk_size == 1:
        chunks = extraer_texto_por_paginas(doc, args.pagina_inicial, args.max_paginas)
    else:
        chunks = extraer_texto_por_bloques(doc, args.chunk_size)
    
    mostrar_chunks(chunks, args.mostrar_todo)


if __name__ == "__main__":
    main()
