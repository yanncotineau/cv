#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./build.sh <path/to/file.tex>"
  exit 1
fi

TEX_FILE="$1"
TEX_DIR=$(dirname "$TEX_FILE")
TEX_NAME=$(basename "$TEX_FILE" .tex)

pdflatex -output-directory="$TEX_DIR" "$TEX_FILE"
rm -f "$TEX_DIR/$TEX_NAME.aux" "$TEX_DIR/$TEX_NAME.log" "$TEX_DIR/$TEX_NAME.out"
