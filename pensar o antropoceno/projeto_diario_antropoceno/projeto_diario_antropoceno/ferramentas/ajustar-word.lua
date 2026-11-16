-- Mantém o documento anônimo e limpa comandos exclusivamente tipográficos.
-- O leitor LaTeX do Pandoc expande os comandos simples de config/comandos.tex.
function Meta(meta)
  meta.author = nil
  meta.date = nil
  meta.institute = nil
  meta.email = nil
  meta.orcid = nil
  meta.lang = pandoc.MetaString('pt-BR')
  return meta
end

local function verificar_raw(el)
  if el.format == 'latex' then
    error('O Pandoc não reconheceu este comando LaTeX: ' .. el.text ..
      '\nUse um comando simples equivalente antes de exportar para Word.')
  end
end

function RawInline(el) return verificar_raw(el) end
function RawBlock(el) return verificar_raw(el) end

-- O leitor LaTeX apresenta o nome da língua como um primeiro Span.
-- Retira apenas esse argumento do ambiente, preservando o conteúdo.
function Div(el)
  if el.classes:includes('otherlanguage') then
    local primeiro = el.content[1]
    if primeiro and primeiro.t == 'Para' and primeiro.content[1]
       and primeiro.content[1].t == 'Span' then
      local nome = pandoc.utils.stringify(primeiro.content[1])
      if nome == 'english' or nome == 'brazil' then
        primeiro.content:remove(1)
        while primeiro.content[1] and
          (primeiro.content[1].t == 'SoftBreak' or primeiro.content[1].t == 'Space') do
          primeiro.content:remove(1)
        end
      end
    end
    return el.content
  end
end

-- Aplica recuo francês às referências, sem transformar as notas em bibliografia.
function Pandoc(doc)
  local nas_referencias = false
  local blocos = pandoc.List()
  for _, bloco in ipairs(doc.blocks) do
    if bloco.t == 'Header' then
      nas_referencias = pandoc.utils.stringify(bloco.content) == 'Referências'
    end
    if nas_referencias and bloco.t == 'Para' then
      blocos:insert(pandoc.Div({bloco}, pandoc.Attr('', {}, {['custom-style']='Bibliography'})))
    else
      blocos:insert(bloco)
    end
  end
  doc.blocks = blocos
  return doc
end
