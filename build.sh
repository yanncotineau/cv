#!/bin/bash
set -e

VERBOSE=0
POSITIONAL=()

for arg in "$@"; do
  case "$arg" in
    -v) VERBOSE=1 ;;
    *)  POSITIONAL+=("$arg") ;;
  esac
done

build_one() {
  local TEX_FILE="$1"
  local TEX_DIR
  TEX_DIR=$(dirname "$TEX_FILE")
  local TEX_NAME
  TEX_NAME=$(basename "$TEX_FILE" .tex)

  rm -f "$TEX_DIR/$TEX_NAME.pdf"
  if [ "$VERBOSE" = "1" ]; then
    pdflatex -output-directory="$TEX_DIR" "$TEX_FILE"
  else
    pdflatex -interaction=batchmode -output-directory="$TEX_DIR" "$TEX_FILE" > /dev/null
  fi
  rm -f "$TEX_DIR/$TEX_NAME.aux" "$TEX_DIR/$TEX_NAME.log" "$TEX_DIR/$TEX_NAME.out"
}

if [ "${POSITIONAL[0]}" = "--all" ]; then
  while IFS= read -r -d '' TEX_FILE; do
    echo "Building $TEX_FILE..."
    build_one "$TEX_FILE"
  done < <(find "$(dirname "$0")" -name "*.tex" -print0 | sort -z)
elif [ -n "${POSITIONAL[0]}" ]; then
  build_one "${POSITIONAL[0]}"
else
  echo "Usage: ./build.sh [options] <path/to/file.tex>"
  echo "       ./build.sh [options] --all"
  echo ""
  echo "Options:"
  echo "  -v    Verbose: print full pdflatex output"
  exit 1
fi
