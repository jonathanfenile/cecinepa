@echo off
setlocal
cd /d "%~dp0"
where pdflatex >nul 2>nul
if errorlevel 1 (
  echo PDFLaTeX nao encontrado. Instale MiKTeX ou TeX Live e reabra o terminal.
  exit /b 1
)
if not exist saida mkdir saida
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=saida main.tex
if errorlevel 1 exit /b 1
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=saida main.tex
if errorlevel 1 exit /b 1
echo PDF pronto: saida\main.pdf
