# Instalar e carregar pacotes necessários
install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)

# Carregar a base de dados em CSV
dados <- read.csv("base_unificada_com_casos.csv", stringsAsFactors = TRUE)

# Remover as colunas "Local" e "Ano" para focar nas variáveis relevantes
dados_selecionados <- dados[, !(names(dados) %in% c("Local", "Ano"))]

# Transformar o "Número de Casos" em categorias
dados_selecionados$Numero_de_Casos_Categorizado <- cut(
  dados_selecionados$Numero.de.Casos,
  breaks = quantile(dados_selecionados$Numero.de.Casos, probs = seq(0, 1, by = 0.33), na.rm = TRUE),
  labels = c("Baixo", "Médio", "Alto"),
  include.lowest = TRUE
)

# Remover a coluna original numérica de "Número de Casos"
dados_selecionados <- dados_selecionados[, !(names(dados_selecionados) %in% c("Numero.de.Casos"))]

# Converter o conjunto de dados para um objeto de transações
dados_transacoes <- as(dados_selecionados, "transactions")

# Aplicar o algoritmo Apriori com foco no "Número de Casos Categorizado"
regras <- apriori(
  dados_transacoes,
  parameter = list(supp = 0.02, conf = 0.9),
  appearance = list(rhs = c("Numero_de_Casos_Categorizado=Alto",
                            "Numero_de_Casos_Categorizado=Médio",
                            "Numero_de_Casos_Categorizado=Baixo"),
                    default = "lhs")
)

# Ordenar as regras por confiança
regras_ordenadas <- sort(regras, by = "confidence", decreasing = TRUE)

# Selecionar as N regras mais relevantes
n <- 10  # Número desejado de regras
regras_filtradas <- regras_ordenadas[1:n]

# Inspecionar as regras selecionadas
inspect(regras_filtradas)


plot(regras_filtradas, method = "graph", control = list(type = "items"))



# Visualizar as regras usando diferentes métodos de gráficos

# Gráfico de Dispersão
plot(regras_filtradas, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")

# Gráfico de Rede
plot(regras_filtradas, method = "graph", engine = "igraph", control = list(type = "items"))

# Gráfico de Matriz
plot(regras_filtradas, method = "matrix", measure = "lift", shading = "confidence")

# Gráfico de Matriz Agrupada
plot(regras_filtradas, method = "grouped")

# Gráfico de Paralelismo
plot(regras_filtradas, method = "paracoord", control = list(reorder = TRUE))
