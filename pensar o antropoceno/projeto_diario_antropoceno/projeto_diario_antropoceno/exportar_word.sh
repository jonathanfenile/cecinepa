#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
mkdir -p saida
pandoc main.tex --from=latex --to=docx --standalone --reference-doc=config/modelo-word.docx --lua-filter=ferramentas/ajustar-word.lua --metadata=lang:pt-BR --output=saida/manuscrito.docx
printf '%s\n' 'Word pronto: saida/manuscrito.docx'
