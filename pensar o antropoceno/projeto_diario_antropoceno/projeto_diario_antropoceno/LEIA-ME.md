# Diário de pesquisa sobre o Antropoceno

Projeto de escrita em LaTeX, em português, para um texto composto por entradas de diário que elaboram uma carta de intenções. As notas podem executar e desenvolver os procedimentos anunciados no corpo do diário. Os textos incluídos são exemplos substituíveis, e não uma versão final de seu ensaio.

## Comece por aqui

1. Extraia o ZIP para uma pasta do computador.
2. No VS Code, use **Arquivo > Abrir Pasta** e abra `projeto_diario_antropoceno`.
3. Edite o título em `dados.tex` e escreva em `texto/diario.tex`.
4. No Windows, execute `compilar.bat`; o PDF será criado em `saida/main.pdf`.

Com a extensão **LaTeX Workshop**, também é possível abrir `main.tex`, executar **LaTeX Workshop: Build LaTeX project** na paleta de comandos e visualizar o PDF em uma aba. A receita fornecida executa PDFLaTeX duas vezes, sem depender de Biber, BibTeX, Perl ou latexmk. Os comentários `!TeX root` dos arquivos de diário e notas indicam o arquivo principal.

## Instalação no Windows 11

- Instale **MiKTeX** ou **TeX Live**, que fornecem o compilador PDFLaTeX.
- Instale **VS Code** e a extensão **LaTeX Workshop**.
- No MiKTeX, permita a instalação dos pacotes solicitados; o projeto usa pacotes comuns, incluindo `babel-portuges`, `lmodern`, `geometry`, `setspace`, `footmisc`, `needspace`, `titlesec`, `etoolbox`, `microtype`, `xurl` e `hyperref`.
- Se aparecer uma mensagem sobre a opção `brazil`, instale o suporte ao português (`babel-portuges`; no TeX Live, coleção de português ou pacote do sistema `texlive-lang-portuguese`).
- Após instalar os programas, feche e reabra o VS Code para atualizar o PATH.

O **Pandoc** é necessário apenas para exportar para Word. Ele não participa da compilação do PDF.

## Entradas de diário

Acrescente uma entrada assim:

```latex
\entrada{21 de outubro de 2026}{O que pretendo comunicar}

Primeiro período. Segundo período. Terceiro período.
```

Os dois argumentos são a data e o título da entrada. Escreva as datas manualmente para que não mudem a cada compilação. Não há uma divisão obrigatória em seções: você pode construir a sequência livremente.

Os parágrafos do diário de exemplo têm três períodos, conforme sua preferência de escrita. O projeto não impede outros formatos nem tenta contar períodos automaticamente, porque abreviações e citações tornariam essa verificação pouco confiável. Você pode usar uma linha vazia para iniciar cada novo parágrafo.

## Notas de rodapé

### Uma nota curta no próprio texto

```latex
Quero tornar explícita esta intenção.\nota{Aqui desenvolvo a operação anunciada.}
```

`\nota{...}` é um atalho para o comando padrão `\footnote{...}`. Você pode usar qualquer um deles. A numeração é automática e contínua, inclusive quando acrescentar ou mudar a ordem das entradas.

### Uma nota longa em arquivo separado

No diário:

```latex
Esta intenção pede um desenvolvimento mais demorado.\notaarquivo{notas/02-minha-hipotese.tex}
```

Crie `notas/02-minha-hipotese.tex` e escreva apenas seu conteúdo:

```latex
Primeiro período da nota. Segundo período da nota. Terceiro período da nota.

Primeiro período do próximo parágrafo. Segundo período. Terceiro período.
```

Duplique `notas/modelo.tex` para começar rapidamente. Não coloque `\nota`, `\footnote`, `\begin{document}` ou `\end{document}` dentro desse arquivo. Linhas vazias criam parágrafos na mesma nota.

O arquivo separado ajuda a trabalhar notas com vários parágrafos sem ocupar toda a tela do diário. Ele não gera uma publicação separada: seu conteúdo aparece no rodapé do ponto em que é chamado. Notas muito extensas podem continuar na página seguinte; isso evita estouro da área imprimível e mantém a numeração.

### Referências dentro das notas

Para um livro:

```latex
Uma intenção de leitura.\nota{Latour, \textit{Jamais Fomos Modernos}, p.~45.}
```

A página acima é somente um exemplo de sintaxe: use a página da passagem realmente consultada. Para um artigo ou capítulo, use aspas em torno do título, como `Sobrenome, ``Título Abreviado'', p.~10`. Se a nota já contiver uma discussão longa, insira a referência abreviada diretamente nela, sem abrir uma nota dentro de outra.

As referências completas ficam em `referencias.tex`. A lista é manual, alfabética, sem numeração e com recuo francês; as duas obras de exemplo já têm entradas completas. Ao acrescentar uma obra, confira a edição, a capitalização de títulos e a posição alfabética.

Cada entrada da lista deve ficar dentro de `\referencia{...}`, como nos exemplos, para aplicar o recuo francês no PDF. Esse comando cuida apenas da apresentação: não gera nem verifica os dados bibliográficos. As citações abreviadas e a inclusão de obras na lista continuam sob seu controle.

### Atalhos no VS Code

O projeto inclui snippets locais. Em um arquivo `.tex`, digite o prefixo e use a sugestão do editor (se necessário, `Ctrl+Espaço`); avance pelos campos com `Tab`.

| Prefixo | O que insere |
| --- | --- |
| `entrada` | Data, título e um parágrafo-modelo de três períodos |
| `nota` | Uma nota curta |
| `notaarquivo` | Uma chamada para nota em arquivo separado |
| `citanota` | Um modelo de referência abreviada a livro em nota |

## O que foi configurado para Das Questões

Diretrizes consultadas em **21 de outubro de 2026**:
https://periodicos.unb.br/index.php/dasquestoes/about/submissions

- Manuscrito anônimo e documento de autoria separado.
- Resumo e palavras-chave em português e inglês.
- Citações em notas e referências completas no fim, seguindo MLA 9 com as adaptações da revista.
- Referências alfabéticas; livros em itálico; artigos e capítulos entre aspas; títulos com maiúsculas iniciais significativas; cidade omitida para livros; DOI/URL quando disponíveis.
- Exportação para Word, um dos formatos aceitos para submissão.

As diretrizes gerais pedem formatação mínima e consistente, mas não fixam fonte, margens, entrelinhas ou limite de palavras. Este projeto adota **A4, margens de 2,5 cm, fonte serifada Latin Modern de 12 pontos, entrelinhas 1,5 e notas de 10 pontos com espaçamento simples** como escolhas editoriais ajustáveis em `config/preambulo.tex`. Não se trata de um modelo oficial da revista; uma chamada temática pode trazer exigências adicionais.

A revista também acolhe experimentações na seção **Outras Formas** e pede que necessidades formais específicas sejam explicadas nos comentários ao editor. No seu caso, pode ser pertinente descrever a relação entre as intenções das entradas e seu desenvolvimento nas notas. A seção de submissão deverá acompanhar a modalidade/chamada pertinente ao seu trabalho.

## Exportar para Word

A revista lista Word, OpenOffice ou RTF como formatos de submissão; o PDF serve para leitura e conferência. Para gerar o Word:

1. Instale o **Pandoc** e reabra o terminal.
2. Execute `exportar_word.bat` no Windows ou `bash exportar_word.sh` no Linux/macOS.
3. Abra `saida/manuscrito.docx` e confira a paginação.

As notas curtas e as notas em arquivos separados são convertidas em **notas de rodapé nativas e editáveis**, incluindo seus parágrafos e itálicos. `config/modelo-word.docx` contém os estilos usados na conversão, e não o texto do manuscrito. O filtro `ferramentas/ajustar-word.lua` remove dados de autoria da exportação e aplica o recuo das referências.

Os comandos fornecidos foram testados. Caso acrescente comandos LaTeX não reconhecidos pelo Pandoc, a exportação deve informar o comando em vez de descartá-lo silenciosamente; adaptações mais elaboradas, tabelas especiais ou novas macros podem precisar de conversão própria. Revise notas, citações, caracteres e eventuais imagens no Word antes de submeter.

Depois de editar o Word, as alterações não voltam automaticamente ao LaTeX. Mantenha o LaTeX como fonte principal enquanto escreve e exporte novamente quando necessário. Evite editar simultaneamente duas versões diferentes do mesmo texto.

## Autoria e avaliação anônima

`autoria.tex` é um documento separado com os campos solicitados pela revista. Preencha-o e, para obter a versão editável, use:

```text
pandoc autoria.tex -o saida/autoria.docx
```

Não inclua `autoria.tex` com `\input` em `main.tex`. O manuscrito inicial não contém nome ou filiação, e os campos de autoria do PDF e da exportação Word são vazios. Antes de submeter, revise também o texto, os agradecimentos, comentários, propriedades e alterações controladas que você tenha acrescentado depois.

## Arquivos principais

| Arquivo | Função |
| --- | --- |
| `main.tex` | Reúne e compila o manuscrito |
| `dados.tex` | Título provisório |
| `texto/diario.tex` | Sua sequência de entradas |
| `texto/resumos.tex` | Resumos e palavras-chave |
| `notas/` | Desenvolvimento das notas longas |
| `referencias.tex` | Lista bibliográfica manual |
| `autoria.tex` | Dados pessoais, em documento separado |
| `config/preambulo.tex` | Formatação do PDF |
| `config/comandos.tex` | Os três comandos de escrita |
| `config/modelo-word.docx` | Estilos para exportar ao Word |
| `.vscode/` | Compilação e snippets locais |
| `saida/` | Arquivos gerados; nela estão os exemplos já compilados |

## Caracteres e escrita

Salve os arquivos em UTF-8 e escreva acentos normalmente. Em texto LaTeX, use `\%`, `\&`, `\_`, `\#` e `\$` para os caracteres especiais correspondentes. Para endereços eletrônicos, use `\url{https://exemplo.org}`.

Use `\textit{...}` para itálico e `\textbf{...}` para negrito. As aspas podem ser escritas como ``duas crases para abrir e duas aspas simples para fechar'', conforme os exemplos em LaTeX do projeto. Notas não devem ser inseridas nos títulos das entradas; coloque a chamada na primeira frase pertinente.

## Verificações realizadas no projeto

O projeto é verificado com compilação PDFLaTeX em duas passagens e exportação pelo Pandoc. O PDF é renderizado para revisão visual, e o Word é verificado quanto à presença das três notas nativas, à preservação dos dois parágrafos da nota longa e à ausência de autoria nos metadados. Esses testes cobrem o modelo fornecido; substitua os exemplos e confira novamente o manuscrito final.
