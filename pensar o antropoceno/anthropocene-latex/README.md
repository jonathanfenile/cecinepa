# Template de escrita — Das Questões

Projeto para **How to talk about the Anthropocene? A Science-bar essay towards ancestral futures**.

O projeto retoma a **primeira proposta de Crisis, com sete atos**. O primeiro ato conserva o texto fornecido por você. Os seis seguintes estão redigidos em inglês; cada ato é seguido por um início provisório de argumentação em inglês e por orientações de desenvolvimento em português. As partes II e III contêm sete espaços de planejamento cada, sem antecipar a redação de suas estórias.

## Começar

No Overleaf, crie um projeto usando **Upload Project**, carregue o ZIP e selecione `main.tex` como documento principal. Use **pdfLaTeX**. Se o projeto entrar dentro de uma pasta, selecione o `main.tex` dessa pasta.

Localmente, abra a pasta do projeto em um editor com uma distribuição LaTeX instalada. Execute:

```sh
latexmk -pdf main.tex
```

Também é possível executar duas vezes:

```sh
pdflatex main.tex
```

Não é necessário executar BibTeX ou Biber. A bibliografia é manual e editável, com notas abreviadas que acompanham os exemplos atuais da revista.

## Arquivos

| Arquivo | Uso |
|---|---|
| `main.tex` | Documento principal e chave para mostrar ou ocultar orientações. |
| `preambulo.tex` | Formatação, ambientes para atos e comandos de citação. |
| `resumos.tex` | Abstract, resumo e palavras-chave provisórios. |
| `partes/01-crisis.tex` | Sete atos completos, inícios acadêmicos e orientações. |
| `partes/02-quotation-marks.tex` | Estrutura para a segunda parte. |
| `partes/03-ancestral-futures.tex` | Estrutura para a terceira parte. |
| `referencias.tex` | Notas curtas e referências completas. |
| `dados_autoria.tex` | Ficha de autoria independente do manuscrito. |
| `template-preview.pdf` | Prévia do documento com orientações visíveis. |

## Dois modos de leitura

Em `main.tex`, altere:

```tex
\orientacoestrue
```

para:

```tex
\orientacoesfalse
```

O segundo modo oculta as caixas de orientação e os espaços dos atos ainda não escritos. Conserva os atos e os parágrafos acadêmicos já redigidos, os resumos provisórios e os títulos das três partes. A bibliografia passa a exibir somente as obras chamadas no conteúdo visível. **Ocultar orientações não significa concluir o artigo.** Complete os trechos, revise os resumos e confira as referências antes da submissão.

As orientações estão separadas do texto do ensaio. Para uma anotação particular que nunca aparecerá no PDF, comece a linha do código com `%`.

## Escrever novos atos

Na segunda e na terceira partes, substitua cada `\atoplanejado` por uma narrativa e pelo texto acadêmico correspondente:

```tex
\begin{ato}{A working title}
The narrative goes here.
\end{ato}

The academic discussion follows here.
```

A numeração dos atos recomeça em cada parte. Os títulos descritivos são editáveis. Para acrescentar uma orientação removível:

```tex
\begin{orientacao}{Questão para desenvolver}
Sua anotação de escrita.
\end{orientacao}
```

## Citar e acrescentar referências

As chamadas ficam em notas de rodapé. O comando usa sobrenome e título abreviado, com localizador opcional:

```tex
... material mediations.\fonte[pp.~16--17]{latour1994}
... body talk.\fonte[p.~206]{latour2004}
... quotation marks.\fonte[chap.~18]{cunha2017}
... geological classification.\fonte{iugs2024}
```

O argumento opcional é escrito por você: use `p.`, `pp.`, capítulo ou seção conforme a passagem. Em inglês, as notas usam `and`, `Translated by`, `vol.`, `no.` e `pp.`. Nenhum ano é acrescentado automaticamente às notas curtas. Evite usar o número do visualizador de um PDF como se fosse a paginação da edição.

Para várias obras na mesma nota:

```tex
... unequal responsibilities.\footnote{
  \refobra{malm-hornborg2014}; \refobra{haraway2015}.}
```

Para cadastrar outra obra, inclua em `referencias.tex`:

```tex
\declararobra{chave-nova}
  {Sobrenome, \emph{Título Abreviado}}
  {Sobrenome, Nome. \emph{Título Completo}. Editora, ano.}
```

Depois acrescente `\entradaobra{chave-nova}` na ordem alfabética correta dentro de `\imprimirreferencias`, no fim daquele arquivo. O sistema não ordena nem valida referências automaticamente. Confira os elementos da obra e acrescente DOI ou URL quando houver. Mantenha os títulos em itálico para obras independentes e entre aspas para artigos/capítulos. A lista segue a capitalização de títulos solicitada pela revista, inclusive nos títulos em português.

Para inserir as aspas deliberadas do argumento, use `\anthropocene`; isso produz “Anthropocene”. Para aspas comuns, use `\enquote{texto}`. O comando `\sciencebar` imprime apenas “Science-bar”; a definição conceitual e qualquer grafia barrada poderão ser desenvolvidas na parte II.

## Normas consultadas

Consulta em 5 de outubro de 2026: [diretrizes de submissão](https://periodicos.unb.br/index.php/dasquestoes/about/submissions) e [chamada Pensar o Antropoceno](https://periodicos.unb.br/index.php/dasquestoes/announcement/view/1032).

A revista pede formatação mínima e consistente; referências em MLA 9, adaptadas a citações em notas; resumo e palavras-chave em português e outra língua; bibliografia final; manuscrito sem identificação, inclusive nos metadados; e dados de autoria em arquivo separado. Aceita o arquivo textual em **Word, OpenOffice ou RTF**. Portanto, o LaTeX e o PDF deste projeto são instrumentos de escrita e conferência. Ao concluir, converta o manuscrito para um formato aceito e revise notas, aspas, itálicos, links e anonimato no arquivo convertido.

**A4, fonte de 12 pontos, margens de 2,5 cm e entrelinha 1,5 são escolhas editáveis deste template**, pois as diretrizes consultadas não fixam essas medidas para o texto. As caixas editoriais desaparecem no modo sem orientações. Os campos da ficha de autoria estão em branco, e o PDF principal tem o campo de autoria vazio. Confira também se o próprio conteúdo permite identificar quem escreveu.

## Limites e decisões da proposta

- Os textos acadêmicos e os resumos são **rascunhos de partida**, não resultados apresentados como concluídos. Reescreva-os na sua voz.
- O ato I preserva inclusive “sciences bar” e sua pontuação original. As falas dos atos são ficção do ensaio, não transcrições dos autores citados.
- A referência ao processo de 2024 diz respeito à rejeição da proposta de uma época geológica formal. A existência de transformações materiais e a utilidade de outros sentidos de Antropoceno constituem questões diferentes. Verifique novas decisões da ICS ao fechar o manuscrito.
- A falha de comunicação é formulada como hipótese do ensaio sobre práticas materiais e institucionais; não se atribui a Latour uma tese que ele teria formulado nesses mesmos termos.
- Na edição de 1994 de *Jamais Fomos Modernos*, a quarta garantia aparece como “Deus suprimido”. O vínculo com Science-bar é uma elaboração a explicar, não uma expressão já encontrada no livro.
- Nas citações de Cunha e Mauss, as entradas correspondem às edições Ubu de 2017 fornecidas. Os livros originais em PDF não integram o projeto.
- A bibliografia inclui as fontes das orientações. Obras apenas sugeridas para pesquisa adicional, como uma obra específica de Moore, não foram registradas como se já tivessem sido consultadas.

## Antes de converter o manuscrito

Complete a situação de escrita e os exemplos empíricos com suas observações e fontes; conclua as partes II e III; revise a equivalência dos resumos; oculte as orientações; confira as notas e a lista bibliográfica; preencha a ficha de autoria separada. Preserve os arquivos `.tex` como originais editáveis depois da conversão.
