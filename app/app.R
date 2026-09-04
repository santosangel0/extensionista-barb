library(shiny)
library(bslib)

# ============================================================
# CUSTOM CSS
# ============================================================
custom_css <- "
/* ---- Geral ---- */
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #f0f4f8;
}

.container-content {
  max-width: 920px;
  margin: 0 auto;
  padding: 20px 15px;
}

/* ---- Hero / Banner ---- */
.hero-section {
  text-align: center;
  padding: 55px 30px;
  background: linear-gradient(135deg, #0d3b66 0%, #1a5276 40%, #2980b9 100%);
  color: white;
  border-radius: 18px;
  margin: 10px 0 25px 0;
  box-shadow: 0 6px 25px rgba(0,0,0,0.25);
}
.hero-section h1 { font-size: 2.6em; margin-bottom: 12px; text-shadow: 0 2px 8px rgba(0,0,0,0.3); }
.hero-section p  { font-size: 1.15em; opacity: 0.92; max-width: 700px; margin: 0 auto; }

/* ---- Story / Info Cards ---- */
.story-card {
  background: linear-gradient(135deg, #ffffff, #f7f9fc);
  border-radius: 14px;
  padding: 28px 30px;
  margin: 18px 0;
  box-shadow: 0 3px 12px rgba(0,0,0,0.08);
  border-left: 5px solid #2980b9;
  transition: transform 0.2s, box-shadow 0.2s;
}
.story-card:hover { transform: translateY(-2px); box-shadow: 0 6px 18px rgba(0,0,0,0.12); }
.story-card h3 { color: #1a5276; margin-top: 0; }

.story-card-target {
  border-left-color: #e74c3c;
  background: linear-gradient(135deg, #ffffff, #fdf2f2);
}
.story-card-ecommerce {
  border-left-color: #f39c12;
  background: linear-gradient(135deg, #ffffff, #fef9ee);
}
.story-card-green {
  border-left-color: #27ae60;
  background: linear-gradient(135deg, #ffffff, #eefaf3);
}
.story-card-purple {
  border-left-color: #8e44ad;
  background: linear-gradient(135deg, #ffffff, #f5eef8);
}

/* ---- Step Cards (Method Tab) ---- */
.step-card {
  background: white;
  border-radius: 14px;
  padding: 24px 28px;
  margin: 14px 0;
  box-shadow: 0 2px 10px rgba(0,0,0,0.07);
  border-left: 5px solid #2980b9;
  transition: transform 0.2s;
}
.step-card:hover { transform: translateY(-2px); }

.step-number {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 42px;
  height: 42px;
  background: linear-gradient(135deg, #2980b9, #1a5276);
  color: white;
  border-radius: 50%;
  font-size: 1.15em;
  font-weight: bold;
  margin-right: 12px;
  flex-shrink: 0;
  box-shadow: 0 2px 6px rgba(41,128,185,0.4);
}

.step-header {
  display: flex;
  align-items: center;
  margin-bottom: 12px;
}

/* ---- Formula Box ---- */
.formula-box {
  background: linear-gradient(135deg, #eaf2f8, #d4e6f1);
  border: 2px solid #2980b9;
  border-radius: 14px;
  padding: 30px;
  text-align: center;
  margin: 25px 0;
  font-size: 1.3em;
  box-shadow: 0 3px 12px rgba(41,128,185,0.15);
}

/* ---- Emoji Steps (visual pipeline) ---- */
.emoji-pipeline {
  text-align: center;
  font-size: 1.6em;
  padding: 8px 0;
  letter-spacing: 4px;
}

/* ---- Result Boxes ---- */
.result-good {
  background: linear-gradient(135deg, #27ae60, #2ecc71);
  color: white;
  border-radius: 12px;
  padding: 22px;
  text-align: center;
  margin: 12px 0;
  font-size: 1.15em;
  box-shadow: 0 3px 12px rgba(39,174,96,0.3);
}
.result-warn {
  background: linear-gradient(135deg, #e67e22, #f39c12);
  color: white;
  border-radius: 12px;
  padding: 22px;
  text-align: center;
  margin: 12px 0;
  font-size: 1.15em;
  box-shadow: 0 3px 12px rgba(230,126,34,0.3);
}
.result-bad {
  background: linear-gradient(135deg, #c0392b, #e74c3c);
  color: white;
  border-radius: 12px;
  padding: 22px;
  text-align: center;
  margin: 12px 0;
  font-size: 1.15em;
  box-shadow: 0 3px 12px rgba(192,57,43,0.3);
}

/* ---- Calculation Display ---- */
.calc-display {
  background: white;
  border-radius: 14px;
  padding: 25px 30px;
  margin: 18px 0;
  box-shadow: 0 3px 12px rgba(0,0,0,0.08);
  text-align: center;
  font-size: 1.2em;
  line-height: 2;
}

/* ---- Highlight ---- */
.hl { color: #e74c3c; font-weight: bold; }
.hl-blue { color: #2980b9; font-weight: bold; }
.hl-green { color: #27ae60; font-weight: bold; }

/* ---- Nav hints ---- */
.nav-hint {
  text-align: center;
  padding: 18px;
  color: #7f8c8d;
  font-size: 1.05em;
}

/* ---- Button Enhancements ---- */
.btn-pescar {
  background: linear-gradient(135deg, #2980b9, #1a5276) !important;
  border: none !important;
  color: white !important;
  font-size: 1.25em !important;
  padding: 14px 20px !important;
  border-radius: 12px !important;
  width: 100%;
  transition: transform 0.15s, box-shadow 0.15s !important;
  box-shadow: 0 4px 15px rgba(41,128,185,0.4) !important;
}
.btn-pescar:hover {
  transform: translateY(-2px) !important;
  box-shadow: 0 6px 20px rgba(41,128,185,0.5) !important;
}

.btn-experimento {
  background: linear-gradient(135deg, #27ae60, #1e8449) !important;
  border: none !important;
  color: white !important;
  font-size: 1.25em !important;
  padding: 14px 20px !important;
  border-radius: 12px !important;
  width: 100%;
  box-shadow: 0 4px 15px rgba(39,174,96,0.4) !important;
}

/* ---- Assumption Cards ---- */
.assumption-card {
  background: #fef9e7;
  border-left: 4px solid #f1c40f;
  border-radius: 8px;
  padding: 15px 18px;
  margin: 8px 0;
}

/* ---- Career Cards ---- */
.career-card {
  display: flex;
  align-items: flex-start;
  gap: 15px;
  background: white;
  border-radius: 12px;
  padding: 22px;
  margin: 12px 0;
  box-shadow: 0 2px 8px rgba(0,0,0,0.06);
}
.career-icon {
  font-size: 2.2em;
  flex-shrink: 0;
}
"

# ============================================================
# TAB 1 — INÍCIO (Bem-vindo)
# ============================================================
tab_inicio <- nav_panel(
  title = "🏠 Início",
  div(
    class = "container-content",

    # ---- Hero ----
    div(
      class = "hero-section",
      h1("🐟 Como Contar Peixes Sem Ver?"),
      p("Uma aventura pela Estatística — o superpoder de quem sabe usar dados!"),
      tags$br(),
      tags$small(style = "opacity:0.65;",
                 "Método de Captura-Recaptura de Lincoln-Petersen")
    ),

    # ---- Intro Card ----
    div(
      class = "story-card",
      h3("🤔 O Grande Desafio"),
      p("Imagine que você é um(a) biólogo(a) e precisa descobrir quantos peixes
         vivem em um lago. O problema é:",
        span(class = "hl", "você não pode esvaziar o lago!"),
        "Parece impossível, certo?"),
      p("A resposta está na ",
        strong("Estatística"),
        " — uma ciência que nos permite descobrir informações sobre o mundo
         usando dados e matemática. E o método que vamos aprender hoje é tão
         genial quanto simples!"),
      p("Em ", strong("1896"), ", o biólogo dinamarquês C.G.J. Petersen teve uma
         ideia brilhante que revolucionou a ecologia. Mais tarde, em ",
        strong("1930"),
        ", Frederick Charles Lincoln aprimorou o método para estudar populações
         de patos selvagens nos Estados Unidos."),
      p("Hoje, esse método é usado no mundo inteiro — não só para contar animais,
         mas também em pesquisas de saúde, censos populacionais e até no mundo
         digital! Vamos explorar tudo isso juntos? 🚀")
    ),

    # ---- Quick Overview ----
    div(
      class = "story-card-green story-card",
      h3("🗺️ O que você vai encontrar aqui"),
      tags$ul(
        style = "font-size:1.05em; line-height:1.8;",
        tags$li(strong("📖 Como Funciona"), " — Entenda o método passo a passo"),
        tags$li(strong("🎣 Simulação"), " — Pesque peixes virtuais e veja a
                 Estatística em ação!"),
        tags$li(strong("📊 Experimento"), " — Repita o processo centenas de vezes
                 e descubra padrões"),
        tags$li(strong("🌍 Mundo Real"), " — Veja onde a Estatística está presente
                 no seu dia a dia")
      )
    ),

    # ---- Nav hint ----
    div(
      class = "nav-hint",
      p("👆 Use as abas acima para navegar!"),
      p("Comece por ", strong("📖 Como Funciona"), " para entender o método,
         depois vá para ", strong("🎣 Simulação"), " para experimentar!")
    )
  )
)

# ============================================================
# TAB 2 — COMO FUNCIONA
# ============================================================
tab_metodo <- nav_panel(
  title = "📖 Como Funciona",
  div(
    class = "container-content",

    h2(style = "text-align:center; color:#1a5276; margin-bottom:5px;",
       "📖 O Método de Captura-Recaptura"),
    p(style = "text-align:center; color:#7f8c8d; margin-bottom:25px;",
      "Entenda a lógica por trás da estimativa de Lincoln-Petersen"),

    # ---- PASSO 1 ----
    div(
      class = "step-card",
      div(class = "step-header",
          span(class = "step-number", "1"),
          strong(style = "font-size:1.2em;", "Primeira Captura 🥅")),
      p("Capturamos uma amostra de peixes do lago. Vamos chamar esse número de ",
        tags$b("n₁"), ". Cada peixe capturado recebe uma ",
        span(class = "hl", "marca"),
        " — pode ser uma pequena etiqueta, um corte na barbatana ou tinta
         especial que não sai na água."),
      div(class = "emoji-pipeline", "🐟🐟🐟 ➡️ 🎨 ➡️ 🔴🔴🔴")
    ),

    # ---- PASSO 2 ----
    div(
      class = "step-card",
      div(class = "step-header",
          span(class = "step-number", "2"),
          strong(style = "font-size:1.2em;", "Liberação 🌊")),
      p("Soltamos todos os peixes marcados de volta no lago. Eles voltam a nadar
         livremente com os outros peixes."),
      div(class = "emoji-pipeline", "🔴🔴🔴 ➡️ 🌊 ➡️ 🐟🔴🐟🐟🔴🐟")
    ),

    # ---- PASSO 3 ----
    div(
      class = "step-card",
      div(class = "step-header",
          span(class = "step-number", "3"),
          strong(style = "font-size:1.2em;", "Esperar ⏳")),
      p("Esperamos alguns dias para que os peixes marcados se misturem
         completamente com os outros. Assim, na próxima captura, cada peixe
         terá a mesma chance de ser pescado."),
      div(class = "emoji-pipeline", "☀️ → 🌙 → ☀️ → 🌙 → ☀️")
    ),

    # ---- PASSO 4 ----
    div(
      class = "step-card",
      div(class = "step-header",
          span(class = "step-number", "4"),
          strong(style = "font-size:1.2em;", "Segunda Captura 🥅")),
      p("Voltamos ao lago e capturamos uma nova amostra de ",
        tags$b("n₂"), " peixes. Agora, contamos quantos deles estão marcados.
         Chamamos esse número de ", tags$b("m₂"), "."),
      div(class = "emoji-pipeline", "🥅 ➡️ 🐟🔴🐟🐟🐟🔴 (2 marcados!)")
    ),

    # ---- PASSO 5 ----
    div(
      class = "step-card",
      div(class = "step-header",
          span(class = "step-number", "5"),
          strong(style = "font-size:1.2em;", "A Mágica da Proporção ✨")),
      p("Aqui está a sacada genial! Se os peixes se misturaram bem, a ",
        span(class = "hl-blue", "proporção de marcados na segunda amostra"),
        " deve ser parecida com a ",
        span(class = "hl-blue", "proporção de marcados no lago inteiro"), ":"),

      div(
        class = "formula-box",
        HTML(
          "<div style='display:flex; justify-content:center; align-items:center;
                gap:30px; flex-wrap:wrap;'>
            <div style='text-align:center;'>
              <div style='border-bottom:2px solid #2c3e50; padding-bottom:5px;
                    margin-bottom:5px;'>
                <b>marcados na 2ª amostra (m₂)</b>
              </div>
              <div>total da 2ª amostra (n₂)</div>
            </div>
            <div style='font-size:1.5em; font-weight:bold;'> ≈ </div>
            <div style='text-align:center;'>
              <div style='border-bottom:2px solid #2c3e50; padding-bottom:5px;
                    margin-bottom:5px;'>
                <b>marcados no lago (n₁)</b>
              </div>
              <div>total no lago (<span style=\"color:#e74c3c;\">N</span>)</div>
            </div>
          </div>"
        )
      ),

      p("Reorganizando, encontramos a estimativa do total de peixes:"),

      div(
        class = "formula-box",
        style = "background: linear-gradient(135deg, #d5f5e3, #abebc6);
                 border-color: #27ae60;",
        HTML(
          "<div style='font-size:1.4em;'>
            <span style='color:#e74c3c; font-weight:bold; font-size:1.3em;'>
              N̂
            </span>
            <span style='font-size:1.2em;'> = </span>
            <span style='font-size:1.1em;'>
              <sup style='border-bottom:2px solid #2c3e50;'>n₁ × n₂</sup>
              &frasl;
              <sub>m₂</sub>
            </span>
          </div>
          <div style='margin-top:10px; font-size:0.85em; color:#555;'>
            O \"chapéu\" em N̂ indica que é uma <em>estimativa</em> do valor real
          </div>"
        )
      )
    ),

    # ---- Analogia ----
    div(
      class = "story-card-green story-card",
      h3("💡 Uma Analogia para Entender Melhor"),
      p("Pense assim: imagine uma sacola com bolinhas de gude. Você não sabe
         quantas bolinhas tem lá dentro, mas pode fazer o seguinte:"),
      tags$ol(
        tags$li("Tire 20 bolinhas e pinte-as de vermelho"),
        tags$li("Coloque de volta e misture bem"),
        tags$li("Tire 30 bolinhas"),
        tags$li("Se 6 delas são vermelhas, você sabe que 6/30 = 20% da sacola
                 é vermelha"),
        tags$li("Como você pintou 20 bolinhas, e elas representam 20%…
                 20 / 0,20 = ", strong("100 bolinhas no total!"))
      ),
      p("É exatamente a mesma lógica aplicada aos peixes no lago! 🐟")
    ),

    # ---- Premissas ----
    div(
      style = "margin-top:20px;",
      h3(style = "color:#1a5276;", "⚠️ Premissas do Método"),
      p("Para que a estimativa funcione bem, precisamos assumir que:"),
      div(class = "assumption-card",
          strong("1. População fechada"), " — Nenhum peixe nasce, morre,
           entra ou sai do lago entre as duas capturas."),
      div(class = "assumption-card",
          strong("2. Mistura uniforme"), " — Os peixes marcados se misturam
           completamente com os não marcados."),
      div(class = "assumption-card",
          strong("3. Marcas permanentes"), " — As marcas não caem e não
           afetam o comportamento dos peixes."),
      div(class = "assumption-card",
          strong("4. Captura aleatória"), " — Cada peixe tem a mesma chance
           de ser capturado, marcado ou não.")
    ),

    # ---- Nav ----
    div(
      class = "nav-hint",
      p("Entendeu a ideia? Agora vá para ", strong("🎣 Simulação"),
        " e teste você mesmo(a)!")
    )
  )
)

# ============================================================
# TAB 3 — SIMULAÇÃO
# ============================================================
tab_simulacao <- nav_panel(
  title = "🎣 Simulação",
  layout_sidebar(
    sidebar = sidebar(
      title = "🎮 Parâmetros da Pescaria",
      width = 330,

      sliderInput("N_real",
                  "🐟 Peixes no lago (N verdadeiro):",
                  min = 100, max = 10000, value = 1000, step = 50),
      checkboxInput("hide_N",
                    "🙈 Esconder N (modo desafio!)", FALSE),
      hr(),
      sliderInput("n1",
                  "🥅 Primeira captura (n₁ — marcados):",
                  min = 10, max = 500, value = 100, step = 10),
      sliderInput("n2",
                  "🥅 Segunda captura (n₂):",
                  min = 10, max = 500, value = 100, step = 10),
      hr(),
      actionButton("run_sim", "🎣  Pescar!",
                   class = "btn-pescar"),
      hr(),
      div(
        style = "font-size:0.88em; color:#7f8c8d; line-height:1.6;",
        p("💡 ", strong("Dica:"), " Experimente mudar os parâmetros
           e clicar várias vezes em 'Pescar!' para ver como a
           estimativa varia."),
        p("Ative o ", strong("modo desafio"), " para tentar adivinhar
           o número real antes de ver o resultado!")
      )
    ),

    # ---- Painel principal ----
    div(
      # Mensagem antes de simular
      conditionalPanel(
        condition = "input.run_sim === 0",
        div(
          style = "text-align:center; padding:60px 20px; color:#7f8c8d;",
          div(style = "font-size:4em;", "🎣"),
          h3("Configure os parâmetros e clique em 'Pescar!'"),
          p("Ajuste o número de peixes no lago e o tamanho das capturas
             na barra lateral.")
        )
      ),

      # Resultados (aparecem após simular)
      conditionalPanel(
        condition = "input.run_sim > 0",

        # Linha de value boxes
        uiOutput("sim_value_boxes"),

        # Gráficos das capturas
        layout_columns(
          col_widths = c(6, 6),
          fill = FALSE,
          card(
            card_header(
              class = "bg-primary text-white",
              "🥅 Primeira Captura — Marcação"
            ),
            card_body(
              plotOutput("plot_first_catch", height = "320px")
            )
          ),
          card(
            card_header(
              class = "bg-primary text-white",
              "🥅 Segunda Captura — Recaptura"
            ),
            card_body(
              plotOutput("plot_second_catch", height = "320px")
            )
          )
        ),

        # Cálculo e resultado
        uiOutput("sim_calculation"),

        # Texto educativo
        uiOutput("sim_explanation")
      )
    )
  )
)

# ============================================================
# TAB 4 — EXPERIMENTO (Muitas Simulações)
# ============================================================
tab_experimento <- nav_panel(
  title = "📊 Experimento",
  layout_sidebar(
    sidebar = sidebar(
      title = "⚙️ Configurações do Experimento",
      width = 330,

      sliderInput("exp_N",
                  "🐟 Peixes no lago (N):",
                  min = 100, max = 10000, value = 1000, step = 50),
      sliderInput("exp_n1",
                  "🥅 Primeira captura (n₁):",
                  min = 10, max = 500, value = 100, step = 10),
      sliderInput("exp_n2",
                  "🥅 Segunda captura (n₂):",
                  min = 10, max = 500, value = 100, step = 10),
      hr(),
      sliderInput("n_sims",
                  "🔄 Número de simulações:",
                  min = 50, max = 5000, value = 500, step = 50),
      hr(),
      actionButton("run_exp", "🚀  Rodar Experimento!",
                   class = "btn-experimento"),
      hr(),
      div(
        style = "font-size:0.88em; color:#7f8c8d; line-height:1.6;",
        p("💡 ", strong("O que acontece aqui?"),
          " Repetimos o processo de pesca centenas de vezes para ver
           como as estimativas se distribuem."),
        p("Isso é o coração da Estatística: entender o comportamento
           de um método quando repetido muitas vezes!")
      )
    ),

    div(
      # Antes de rodar
      conditionalPanel(
        condition = "input.run_exp === 0",
        div(
          style = "text-align:center; padding:60px 20px; color:#7f8c8d;",
          div(style = "font-size:4em;", "📊"),
          h3("Configure e clique em 'Rodar Experimento!'"),
          p("Veja o que acontece quando repetimos o processo de pesca
             muitas vezes.")
        )
      ),

      # Depois de rodar
      conditionalPanel(
        condition = "input.run_exp > 0",

        # Estatísticas resumo
        uiOutput("exp_summary_boxes"),

        # Histograma
        card(
          card_header(
            class = "bg-success text-white",
            "📊 Distribuição das Estimativas"
          ),
          card_body(
            plotOutput("plot_histogram", height = "420px")
          )
        ),

        # Lição
        uiOutput("exp_lesson")
      )
    )
  )
)

# ============================================================
# TAB 5 — MUNDO REAL
# ============================================================
tab_mundo_real <- nav_panel(
  title = "🌍 Mundo Real",
  div(
    class = "container-content",

    h2(style = "text-align:center; color:#1a5276; margin-bottom:5px;",
       "🌍 A Estatística no Mundo Real"),
    p(style = "text-align:center; color:#7f8c8d; margin-bottom:25px;",
      "Descubra como o raciocínio estatístico está em todo lugar"),

    # ---- ECOLOGIA ----
    div(
      class = "story-card",
      h3("🦁 Ecologia e Conservação"),
      p("O método de captura-recaptura que você acabou de aprender é usado no
         mundo inteiro por biólogos e ecólogos para estimar populações de
         animais selvagens: peixes, pássaros, mamíferos, répteis…"),
      p("Imagine tentar contar todas as onças-pintadas do Pantanal! É
         impossível encontrar cada uma. Mas com armadilhas fotográficas
         (que funcionam como a 'marcação'), os pesquisadores identificam
         indivíduos pelos padrões de suas manchas e usam a mesma lógica
         de proporções para estimar o total."),
      p("Esse tipo de estimativa é fundamental para criar políticas de
         conservação e proteger espécies ameaçadas. 🌿")
    ),

    # ---- SUPERMERCADOS ----
    div(
      class = "story-card story-card-ecommerce",
      h3("🛒 Supermercados e o Poder dos Dados"),
      p("Você já parou para pensar por que certos produtos ficam lado a lado nas
         prateleiras? Ou por que você recebe cupons de desconto em itens que está
         pensando em comprar? Isso não é coincidência — é Estatística!"),
      p("Redes de supermercados analisam os dados de milhões de compras para:"),
      tags$ul(
        tags$li("Descobrir quais produtos são comprados juntos (cerveja e
                 fraldas, por exemplo — sim, isso é real!)"),
        tags$li("Prever quanto estoque cada loja precisa de cada produto"),
        tags$li("Personalizar ofertas para cada cliente com base no seu
                 histórico"),
        tags$li("Otimizar o layout da loja para aumentar as vendas")
      ),
      p("Os estatísticos que trabalham nessas empresas usam técnicas como
        ", strong("análise de cesta de compras"), ", ",
        strong("modelos preditivos"), " e ",
        strong("testes A/B"), " para tomar decisões que movimentam
         milhões de reais.")
    ),

    # ---- HISTÓRIA DA TARGET ----
    div(
      class = "story-card story-card-target",
      h3("🎯 A Incrível História da Target"),
      p("Em 2012, o jornalista Charles Duhigg publicou no ",
        em("The New York Times"), " uma história que chocou o mundo."),
      p(strong("Andrew Pole"), ", um estatístico que trabalhava na rede de
         lojas Target nos Estados Unidos, desenvolveu um modelo que conseguia
         prever se uma cliente estava ", span(class = "hl", "grávida"),
        " — ", em("antes mesmo de ela contar para a própria família!"), " 🤯"),
      p("Como? Analisando os ", strong("padrões de consumo"), ". Mulheres
         grávidas começavam a mudar seus hábitos de compra de formas sutis
         mas detectáveis:"),
      tags$ul(
        tags$li("Passavam a comprar ", strong("loções sem perfume"),
                " no início da gravidez"),
        tags$li("Compravam suplementos de ", strong("cálcio, magnésio e zinco"),
                " em semanas específicas"),
        tags$li("Compravam ", strong("algodão e lenços"), " em maior quantidade"),
        tags$li("Compravam ", strong("sabonetes especiais sem fragrância"))
      ),
      p("Com base em cerca de 25 produtos-chave, o modelo conseguia atribuir
         uma ", strong('"pontuação de gravidez"'), " e até estimar a data provável
         do parto!"),
      div(
        style = "background:#fce4e4; border-radius:10px; padding:18px; margin:15px 0;",
        p(style = "margin:0;",
          "📖 ", em("Um dia, um pai furioso entrou em uma loja Target reclamando
           que sua filha adolescente estava recebendo cupons de produtos para
           bebês pelo correio. O gerente da loja pediu desculpas. Dias depois,
           o pai ligou de volta — desta vez para se desculpar. Sua filha
           realmente estava grávida. A loja sabia antes da família!"))
      ),
      p("Essa história ilustra o poder (e a responsabilidade!) que os dados
         e a Estatística têm no mundo moderno.")
    ),

    # ---- E-COMMERCE ----
    div(
      class = "story-card story-card-ecommerce",
      h3("💻 E-Commerce e Recomendações"),
      p("Quando a Netflix sugere um filme, quando o Spotify cria uma playlist
         personalizada, ou quando a Amazon mostra ",
        em('"quem comprou isso também comprou…"'),
        " — tudo isso é Estatística em ação!"),
      p("Os chamados ", strong("sistemas de recomendação"), " usam técnicas
         estatísticas e de aprendizado de máquina para analisar o comportamento
         de milhões de usuários e encontrar padrões:"),
      tags$ul(
        tags$li("Se pessoas com gostos parecidos aos seus gostaram de um
                 produto, provavelmente você também vai gostar"),
        tags$li("Se você pesquisou certo tipo de produto, é provável que
                 esteja interessado(a) em itens relacionados"),
        tags$li("Padrões de horário, sazonalidade e contexto ajudam a
                 personalizar ainda mais")
      ),
      p("Empresas como Amazon, Mercado Livre, iFood e Magazine Luiza empregam
         equipes inteiras de estatísticos e cientistas de dados para otimizar
         essas experiências. 📱")
    ),

    # ---- ONDE TRABALHA UM ESTATÍSTICO ----
    div(
      class = "story-card story-card-purple",
      h3("💼 Onde Trabalha um Profissional de Estatística?"),
      p("Se você gosta de desvendar padrões, resolver enigmas e trabalhar com
         números, a Estatística pode ser uma carreira incrível! Estatísticos
         trabalham em praticamente todas as áreas:"),

      div(class = "career-card",
          span(class = "career-icon", "🏥"),
          div(strong("Saúde e Farmacêutica"), " — Planejam pesquisas clínicas,
               analisam a eficácia de medicamentos e vacinas, estudam a
               propagação de doenças (epidemiologia)")),
      div(class = "career-card",
          span(class = "career-icon", "🏦"),
          div(strong("Bancos e Finanças"), " — Modelam riscos de crédito,
               detectam fraudes em tempo real, precificam seguros")),
      div(class = "career-card",
          span(class = "career-icon", "⚽"),
          div(strong("Esportes"), " — Avaliam desempenho de atletas, planejam
               estratégias de jogo (como no filme 'Moneyball'!)")),
      div(class = "career-card",
          span(class = "career-icon", "🌾"),
          div(strong("Agronegócio"), " — Planejam experimentos agrícolas,
               preveem safras, otimizam uso de insumos")),
      div(class = "career-card",
          span(class = "career-icon", "🗳️"),
          div(strong("Pesquisas Eleitorais e de Opinião"), " — Estimam
               intenções de voto, conduzem pesquisas de satisfação")),
      div(class = "career-card",
          span(class = "career-icon", "🤖"),
          div(strong("Tecnologia e IA"), " — Desenvolvem algoritmos de
               inteligência artificial, analisam dados de redes sociais,
               criam modelos de linguagem")),
      div(class = "career-card",
          span(class = "career-icon", "🏢"),
          div(strong("Indústria e Qualidade"), " — Controlam qualidade de
               produção, otimizam processos, reduzem desperdícios")),

      p(style = "margin-top:15px; font-size:1.05em;",
        "A demanda por profissionais de Estatística e Ciência de Dados só
         cresce! É uma das carreiras mais promissoras do século XXI. 🚀")
    ),

    # ---- Captura-Recaptura no dia a dia ----
    div(
      class = "story-card-green story-card",
      h3("🔄 Captura-Recaptura Além dos Peixes"),
      p("A mesma lógica do método de Lincoln-Petersen é usada em contextos
         surpreendentes:"),
      tags$ul(
        tags$li(strong("Censos populacionais"), " — Em muitos países, o método
                 de captura-recaptura é usado para estimar quantas pessoas foram
                 'esquecidas' pelo censo."),
        tags$li(strong("Epidemiologia"), " — Estimar o número real de casos de
                 uma doença comparando registros hospitalares com notificações."),
        tags$li(strong("Bugs em software"), " — Duas equipes testam um programa
                 independentemente; a sobreposição de bugs encontrados por ambas
                 ajuda a estimar quantos bugs restam."),
        tags$li(strong("Tráfico de pessoas"), " — Organizações humanitárias
                 usam o método para estimar populações ocultas de vítimas.")
      ),
      p("Sempre que precisamos estimar o tamanho de algo que ",
        strong("não podemos contar diretamente"),
        ", a captura-recaptura pode ajudar!")
    ),

    div(
      class = "nav-hint",
      p(style = "font-size:1.15em;",
        "✨ A Estatística é uma lente poderosa para enxergar o mundo."),
      p("Agora que você conhece um de seus métodos mais elegantes, que tal
         voltar à ", strong("🎣 Simulação"), " e explorar mais?")
    )
  )
)

# ============================================================
# MONTAGEM DO UI
# ============================================================
ui <- page_navbar(
  title = div(
    style = "display:flex; align-items:center; gap:8px; font-weight:600;",
    span(style = "font-size:1.3em;", "🐟"),
    span("Lincoln-Petersen")
  ),
  theme = bs_theme(
    version  = 5,
    bootswatch = "flatly",
    primary  = "#1a5276",
    success  = "#27ae60",
    info     = "#2980b9",
    warning  = "#f39c12",
    danger   = "#e74c3c",
    "navbar-bg" = "#0d3b66"
  ),
  header = tags$head(tags$style(HTML(custom_css))),
  navbar_options = navbar_options(bg = "#0d3b66"),

  tab_inicio,
  tab_metodo,
  tab_simulacao,
  tab_experimento,
  tab_mundo_real
)

# ============================================================
# FUNÇÕES AUXILIARES DE DESENHO
# ============================================================
draw_fish_grid <- function(n_total, n_marked, title, subtitle = "",
                           max_display = 80) {
  n_show <- min(n_total, max_display)
  n_mark_show <- if (n_total > 0) {
    min(n_show, max(0, round(n_show * n_marked / n_total)))
  } else {
    0
  }
  # Garante pelo menos os marcados reais se couberem

  if (n_marked > 0 && n_mark_show == 0 && n_show > 0) n_mark_show <- 1

  cols <- ceiling(sqrt(n_show * 1.4))
  rows <- ceiling(n_show / cols)
  if (cols == 0) cols <- 1
  if (rows == 0) rows <- 1

  par(mar = c(1.8, 0.5, 3, 0.5), bg = "#eaf2f8", family = "sans")
  plot(NULL, xlim = c(0.3, cols + 0.7), ylim = c(0.3, rows + 0.7),
       axes = FALSE, xlab = "", ylab = "", asp = 1)

  title(main = title, cex.main = 1.4, col.main = "#1a5276", font.main = 2,
        line = 1.5)
  mtext(subtitle, side = 3, line = 0.2, cex = 1, col = "#555555")

  # Posições embaralhadas para que marcados não fiquem sempre no mesmo canto
  order_idx <- sample(n_show)
  marked_set <- order_idx[seq_len(n_mark_show)]

  idx <- 1
  for (r in rows:1) {
    for (c in 1:cols) {
      if (idx > n_show) break
      is_m <- idx %in% marked_set
      pt_col <- if (is_m) "#e74c3c" else "#3498dbCC"
      points(c, r, pch = 16, cex = 2.8, col = pt_col)
      if (is_m) {
        points(c, r, pch = 4, cex = 1.6, col = "#f1c40f", lwd = 2.5)
      }
      idx <- idx + 1
    }
  }

  # Legenda inferior
  if (n_total > max_display) {
    mtext(paste0("Representando ", n_show, " de ", n_total, " peixes"),
          side = 1, line = 0.3, cex = 0.85, col = "#95a5a6")
  }

  # Legenda de cores
  legend("bottomright", pch = 16, col = c("#e74c3c", "#3498dbCC"),
         legend = c("Marcado", "Não marcado"), pt.cex = 1.8, cex = 1,
         bg = "#ffffffCC", box.col = "#cccccc")
}

# ============================================================
# SERVER
# ============================================================
server <- function(input, output, session) {

  # ---- Validação dinâmica dos sliders ----
  observeEvent(input$N_real, {
    max_val <- min(500, input$N_real)
    updateSliderInput(session, "n1", max = max_val,
                      value = min(input$n1, max_val))
    updateSliderInput(session, "n2", max = max_val,
                      value = min(input$n2, max_val))
  })
  observeEvent(input$exp_N, {
    max_val <- min(500, input$exp_N)
    updateSliderInput(session, "exp_n1", max = max_val,
                      value = min(input$exp_n1, max_val))
    updateSliderInput(session, "exp_n2", max = max_val,
                      value = min(input$exp_n2, max_val))
  })

  # ==========================================================
  # SIMULAÇÃO ÚNICA
  # ==========================================================
  sim <- reactiveValues(N = NULL, n1 = NULL, n2 = NULL,
                        m2 = NULL, N_hat = NULL)

  observeEvent(input$run_sim, {
    N  <- input$N_real
    n1 <- min(input$n1, N)
    n2 <- min(input$n2, N)
    m2 <- rhyper(1, n1, N - n1, n2)
    N_hat <- if (m2 > 0) round((n1 * n2) / m2) else NA

    sim$N     <- N
    sim$n1    <- n1
    sim$n2    <- n2
    sim$m2    <- m2
    sim$N_hat <- N_hat
  })

  # ---- Value boxes ----
  output$sim_value_boxes <- renderUI({
    req(sim$N)
    n_display <- if (input$hide_N) "❓" else format(sim$N, big.mark = ".")
    est_display <- if (is.na(sim$N_hat)) "∞ (indefinido)" else
                   format(sim$N_hat, big.mark = ".")

    layout_columns(
      col_widths = c(3, 3, 3, 3),
      fill = FALSE,
      value_box(
        title = "N verdadeiro",
        value = n_display,
        theme = "primary",
        showcase = tags$span(style = "font-size:1.8em;", "🐟")
      ),
      value_box(
        title = "Marcados (n₁)",
        value = sim$n1,
        theme = "info",
        showcase = tags$span(style = "font-size:1.8em;", "🎨")
      ),
      value_box(
        title = "Recapturados (n₂)",
        value = sim$n2,
        theme = "info",
        showcase = tags$span(style = "font-size:1.8em;", "🥅")
      ),
      value_box(
        title = "Marcados em n₂ (m₂)",
        value = sim$m2,
        theme = if (sim$m2 == 0) "danger" else "warning",
        showcase = tags$span(style = "font-size:1.8em;", "🔴")
      )
    )
  })

  # ---- Plots ----
  output$plot_first_catch <- renderPlot({
    req(sim$n1)
    set.seed(input$run_sim + 1)
    draw_fish_grid(sim$n1, sim$n1,
                   title = paste0("Capturamos ", sim$n1, " peixes"),
                   subtitle = "Todos foram marcados! 🔴")
  })

  output$plot_second_catch <- renderPlot({
    req(sim$n2)
    set.seed(input$run_sim + 2)
    draw_fish_grid(sim$n2, sim$m2,
                   title = paste0("Capturamos ", sim$n2, " peixes"),
                   subtitle = paste0(sim$m2, " estavam marcados!"))
  })

  # ---- Cálculo ----
  output$sim_calculation <- renderUI({
    req(sim$N)

    if (sim$m2 == 0) {
      return(div(
        class = "result-bad",
        h3("😮 Nenhum peixe marcado foi recapturado!"),
        p("Quando m₂ = 0, não é possível calcular a estimativa (divisão
           por zero). Na prática, isso indica que precisamos aumentar o
           tamanho das amostras ou que a população é muito grande."),
        p("Clique em 'Pescar!' novamente ou aumente n₁ e n₂.")
      ))
    }

    erro_pct <- round(abs(sim$N_hat - sim$N) / sim$N * 100, 1)
    result_class <- if (erro_pct <= 15) "result-good" else
                    if (erro_pct <= 40) "result-warn" else "result-bad"

    div(
      # Caixa de cálculo
      div(
        class = "calc-display",
        HTML(paste0(
          "<div style='margin-bottom:8px; font-size:0.9em; color:#7f8c8d;'>
             Aplicando a fórmula:
           </div>",
          "<div style='font-size:1.5em;'>",
          "N̂ = ",
          "<sup style='border-bottom:2px solid #2c3e50;'>",
          "n₁ × n₂", "</sup>",
          " ⁄ ",
          "<sub>m₂</sub>",
          " = ",
          "<sup style='border-bottom:2px solid #2c3e50;'>",
          sim$n1, " × ", sim$n2, "</sup>",
          " ⁄ ",
          "<sub>", sim$m2, "</sub>",
          " = ",
          "<span style='color:#e74c3c; font-weight:bold;'>",
          format(sim$N_hat, big.mark = "."), "</span>",
          "</div>"
        ))
      ),

      # Resultado
      div(
        class = result_class,
        if (!input$hide_N) {
          tagList(
            h3(style = "margin-top:0;",
               if (erro_pct <= 15) "🎉 Ótima estimativa!" else
               if (erro_pct <= 40) "🤔 Estimativa razoável" else
               "😅 Estimativa longe do real"),
            p(paste0(
              "Estimativa: ", format(sim$N_hat, big.mark = "."),
              " | Valor real: ", format(sim$N, big.mark = "."),
              " | Erro: ", erro_pct, "%"
            ))
          )
        } else {
          tagList(
            h3(style = "margin-top:0;", "🎯 Sua estimativa:"),
            p(style = "font-size:1.4em;",
              format(sim$N_hat, big.mark = "."), " peixes"),
            p(style = "font-size:0.9em; opacity:0.8;",
              "Desmarque '🙈 Esconder N' para ver o valor real!")
          )
        }
      )
    )
  })

  # ---- Explicação ----
  output$sim_explanation <- renderUI({
    req(sim$m2)
    if (sim$m2 == 0) return(NULL)

    prop_pct <- round(sim$m2 / sim$n2 * 100, 1)

    div(
      class = "story-card-green story-card",
      style = "margin-top:15px;",
      h3("🧠 Entendendo o Resultado"),
      p(paste0(
        "Na segunda captura, ", sim$m2, " de ", sim$n2,
        " peixes estavam marcados. Isso é ",
        strong(paste0(prop_pct, "%")), " da amostra."
      )),
      p(paste0(
        "Se essa proporção reflete o lago inteiro, então os ", sim$n1,
        " peixes marcados também representam ~", prop_pct,
        "% do total. Logo:"
      )),
      p(style = "text-align:center; font-size:1.15em;",
        paste0(sim$n1, " / N ≈ ", sim$m2, " / ", sim$n2,
               "  →  N ≈ ", format(sim$N_hat, big.mark = "."))),
      p("💡 ", strong("Tente várias vezes!"), " Cada simulação é diferente
         porque a pesca é aleatória. Às vezes a estimativa é muito boa,
         às vezes nem tanto — é assim que a aleatoriedade funciona!")
    )
  })

  # ==========================================================
  # EXPERIMENTO (MUITAS SIMULAÇÕES)
  # ==========================================================
  exp_data <- reactiveValues(estimates = NULL, N = NULL,
                             n1 = NULL, n2 = NULL, n_sims = NULL)

  observeEvent(input$run_exp, {
    N      <- input$exp_N
    n1     <- min(input$exp_n1, N)
    n2     <- min(input$exp_n2, N)
    n_sims <- input$n_sims

    m2_vals <- rhyper(n_sims, n1, N - n1, n2)
    estimates <- ifelse(m2_vals > 0, (n1 * n2) / m2_vals, NA)

    exp_data$estimates <- estimates
    exp_data$N         <- N
    exp_data$n1        <- n1
    exp_data$n2        <- n2
    exp_data$n_sims    <- n_sims
  })

  # ---- Summary boxes ----
  output$exp_summary_boxes <- renderUI({
    req(exp_data$estimates)
    est <- exp_data$estimates
    valid <- est[!is.na(est)]
    n_na  <- sum(is.na(est))

    media   <- round(mean(valid))
    mediana <- round(median(valid))
    dp      <- round(sd(valid))
    erro_medio <- round(mean(abs(valid - exp_data$N) / exp_data$N * 100), 1)

    layout_columns(
      col_widths = c(3, 3, 3, 3),
      fill = FALSE,
      value_box(
        title = "Média das estimativas",
        value = format(media, big.mark = "."),
        theme = "success",
        showcase = tags$span(style = "font-size:1.8em;", "📏")
      ),
      value_box(
        title = "Mediana",
        value = format(mediana, big.mark = "."),
        theme = "success",
        showcase = tags$span(style = "font-size:1.8em;", "📐")
      ),
      value_box(
        title = "Desvio padrão",
        value = format(dp, big.mark = "."),
        theme = "info",
        showcase = tags$span(style = "font-size:1.8em;", "📊")
      ),
      value_box(
        title = "Erro médio (%)",
        value = paste0(erro_medio, "%"),
        theme = if (erro_medio <= 20) "success" else
                if (erro_medio <= 40) "warning" else "danger",
        showcase = tags$span(style = "font-size:1.8em;", "🎯")
      )
    )
  })

  # ---- Histograma ----
  output$plot_histogram <- renderPlot({
    req(exp_data$estimates)
    est   <- exp_data$estimates
    valid <- est[!is.na(est)]
    N     <- exp_data$N

    # Limitar valores extremos para melhor visualização
    q99 <- quantile(valid, 0.99)
    plot_vals <- valid[valid <= q99]

    par(mar = c(5, 5, 4, 2), bg = "#fafafa", family = "sans")

    hist(plot_vals, breaks = 50,
         col = "#3498db88", border = "#2980b9",
         main = paste0("Distribuição de ", length(valid),
                       " Estimativas de N̂"),
         xlab = expression(hat(N) ~ " (Estimativa)"),
         ylab = "Frequência",
         cex.main = 1.6, cex.lab = 1.3, cex.axis = 1.1,
         las = 1)

    # Valor real
    abline(v = N, col = "#e74c3c", lwd = 3.5, lty = 2)

    # Média
    abline(v = mean(valid), col = "#27ae60", lwd = 2.5)

    # Mediana
    abline(v = median(valid), col = "#8e44ad", lwd = 2, lty = 3)

    legend("topright",
           legend = c(
             paste0("N verdadeiro = ", format(N, big.mark = ".")),
             paste0("Média = ", format(round(mean(valid)), big.mark = ".")),
             paste0("Mediana = ", format(round(median(valid)), big.mark = "."))
           ),
           col = c("#e74c3c", "#27ae60", "#8e44ad"),
           lwd = c(3.5, 2.5, 2), lty = c(2, 1, 3),
           cex = 1.15, bg = "white", box.lwd = 0.5)

    # Grid sutil
    grid(col = "#cccccc44", lty = 1)
  })

  # ---- Lição ----
  output$exp_lesson <- renderUI({
    req(exp_data$estimates)
    est   <- exp_data$estimates
    valid <- est[!is.na(est)]
    N     <- exp_data$N
    n_na  <- sum(is.na(est))

    media <- round(mean(valid))
    vies  <- round(media - N)
    vies_pct <- round(abs(vies) / N * 100, 1)

    tagList(
      div(
        class = "story-card",
        h3("🎓 O que Aprendemos?"),

        h4("1. O Estimador é (aproximadamente) Não-Viesado"),
        p(paste0(
          "A média de todas as estimativas foi ",
          format(media, big.mark = "."),
          ", enquanto o valor real é ",
          format(N, big.mark = "."),
          ". A diferença é de apenas ", vies_pct, "%!"
        )),
        p("Isso significa que, ", strong("em média"),
          ", o método de Lincoln-Petersen acerta! Mesmo que cada estimativa
           individual possa errar bastante, o método não tem um viés
           sistemático (não superestima nem subestima de forma consistente)."),

        h4("2. Variabilidade"),
        p("Observe como as estimativas se espalham em torno do valor real.
           Essa dispersão é chamada de ", strong("variabilidade amostral"),
          ". É por isso que estatísticos preferem trabalhar com ",
          strong("intervalos de confiança"), " em vez de um único número."),

        h4("3. Tamanho das Amostras Importa"),
        p("Experimente aumentar n₁ e n₂ e rodar novamente. Você vai notar
           que as estimativas ficam ", strong("mais concentradas"),
          " em torno do valor real. Amostras maiores = mais precisão!"),

        if (n_na > 0)
          p(style = "color:#e74c3c;", paste0(
            "⚠️ Em ", n_na, " simulações (", round(n_na / length(est) * 100, 1),
            "%), nenhum peixe marcado foi recapturado (m₂ = 0), tornando a
             estimativa impossível. Amostras maiores reduzem essa chance."
          ))
      ),

      div(
        class = "story-card story-card-purple",
        h3("🔬 Para os Curiosos: Lei dos Grandes Números"),
        p("O que você acabou de observar é um dos resultados mais importantes
           da Estatística: a ", strong("Lei dos Grandes Números"), "."),
        p("Ela diz que, quanto mais vezes repetimos um experimento aleatório,
           mais a média dos resultados se aproxima do valor esperado (o valor
           'verdadeiro')."),
        p("É por isso que pesquisas eleitorais precisam entrevistar milhares
           de pessoas, e por isso que casinos sempre lucram no longo prazo —
           a matemática está do lado de quem entende probabilidade! 🎲")
      )
    )
  })
}

# ============================================================
# RUN
# ============================================================
shinyApp(ui = ui, server = server)
