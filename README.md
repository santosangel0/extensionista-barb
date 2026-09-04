# 🐟 Estimador de Lincoln-Petersen — Simulação Interativa

Aplicação Shiny interativa para ensino de Estatística no Ensino Médio, usando o método de **Captura-Recaptura de Lincoln-Petersen** para estimar o número de peixes em um lago.

## 📋 Conteúdo da Aplicação

| Aba | Descrição |
|-----|-----------|
| 🏠 **Início** | Storytelling e introdução ao problema |
| 📖 **Como Funciona** | Explicação passo a passo do método |
| 🎣 **Simulação** | Simule uma pescaria interativa |
| 📊 **Experimento** | Repita centenas de simulações e veja a distribuição |
| 🌍 **Mundo Real** | Onde a Estatística está no dia a dia (supermercados, e-commerce, a história da Target) |

## 🚀 Como Rodar Localmente

### Pré-requisitos

- [R](https://cran.r-project.org/) (versão 4.2+)
- Pacotes: `shiny`, `bslib`

```r
install.packages(c("shiny", "bslib"))
```

### Executar

```r
shiny::runApp("app")
```

## 🌐 Deploy no GitHub Pages (Shinylive)

O [shinylive](https://posit-dev.github.io/r-shinylive/) permite rodar aplicações Shiny **diretamente no navegador** sem servidor, usando WebAssembly (webR).

### Passo 1 — Instalar o pacote `shinylive`

```r
install.packages("shinylive")
```

### Passo 2 — Exportar a aplicação

No console do R, **na raiz do projeto**, execute:

```r
shinylive::export("app", "docs")
```

Isso criará a pasta `docs/` com todos os arquivos necessários para rodar no navegador.

### Passo 3 — Subir para o GitHub

```bash
git init
git add .
git commit -m "Adiciona app Lincoln-Petersen com shinylive"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
git push -u origin main
```

### Passo 4 — Ativar GitHub Pages

1. Vá em **Settings** → **Pages** no seu repositório
2. Em **Source**, selecione **Deploy from a branch**
3. Em **Branch**, selecione `main` e pasta `/docs`
4. Clique em **Save**
5. Aguarde alguns minutos e acesse a URL fornecida!

> **Nota:** O primeiro carregamento pode demorar ~30 segundos enquanto o webR é inicializado no navegador do visitante.

## 📐 Sobre o Método

O estimador de Lincoln-Petersen estima o tamanho de uma população (N) usando:

```
N̂ = (n₁ × n₂) / m₂
```

Onde:
- **n₁** = número de indivíduos capturados e marcados na primeira amostra
- **n₂** = número de indivíduos capturados na segunda amostra
- **m₂** = número de indivíduos marcados encontrados na segunda amostra

## 📚 Referências

- Petersen, C.G.J. (1896). The yearly immigration of young plaice into the Limfjord from the German Sea.
- Lincoln, F.C. (1930). Calculating waterfowl abundance on the basis of banding returns.
- Duhigg, C. (2012). "How Companies Learn Your Secrets." *The New York Times Magazine*.

## 📄 Licença

Este projeto é de uso educacional livre. Sinta-se à vontade para adaptar e compartilhar!
