#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
mkdir -p saida
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=saida main.tex
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=saida main.tex
printf '%s\n' 'PDF pronto: saida/main.pdf'
