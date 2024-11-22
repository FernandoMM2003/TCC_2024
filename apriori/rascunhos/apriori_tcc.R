# Instalar e carregar pacotes necessários
install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)

# Carregar a base de dados em CSV
dados <- read.csv("base_unificada_com_casos.csv", stringsAsFactors = TRUE)

# Remover as colunas "Local" e "Ano" para focar apenas nas variáveis relevantes
dados_selecionados <- dados[, !(names(dados) %in% c("Local", "Ano"))]

# Converter para um objeto de transações
dados_transacoes <- as(dados_selecionados, "transactions")

# Aplicar o algoritmo Apriori
# Ajuste os parâmetros conforme necessário
regras <- apriori(dados_transacoes, parameter = list(supp = 0.02, conf = 0.9))

regras_ordenadas <- sort(regras, by = "confidence", decreasing = TRUE)

# Selecionar as N regras mais relevantes
n <- 5  # Número desejado de regras
regras_filtradas <- regras_ordenadas[1:n]
# Visualizar as regras no console (opcional)
inspect(regras_filtradas)

# Visualizar as regras com gráficos

## Gráfico de Dispersão
plot(regras_filtradas, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")

## Gráfico de Rede
plot(regras_filtradas, method = "graph", engine = "igraph", control = list(type = "items"))

## Gráfico de Matriz
plot(regras_filtradas, method = "matrix", measure = "lift", shading = "confidence")

## Gráfico de Matriz Agrupada
plot(regras_filtradas, method = "grouped")

## Gráfico de Paralelismo
plot(regras_filtradas, method = "paracoord", control = list(reorder = TRUE))

# Visualizar as regras filtradas em um gráfico de rede
plot(regras_filtradas, method = "graph", control = list(type = "items"))


