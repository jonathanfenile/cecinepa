@echo off
setlocal
cd /d "%~dp0"
where pandoc >nul 2>nul
if errorlevel 1 (
  echo Pandoc nao encontrado. Instale-o e reabra o terminal.
  exit /b 1
)
if not exist saida mkdir saida
pandoc main.tex --from=latex --to=docx --standalone --reference-doc=config/modelo-word.docx --lua-filter=ferramentas/ajustar-word.lua --metadata=lang:pt-BR --output=saida/manuscrito.docx
if errorlevel 1 exit /b 1
echo Word pronto: saida\manuscrito.docx
