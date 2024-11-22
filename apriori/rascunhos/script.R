# Instalar pacotes se necessário
install.packages("igraph")
install.packages("ggraph")
install.packages("dplyr")
install.packages("ggplot2")

# Carregar pacotes
library(igraph)
library(ggraph)
library(dplyr)
library(ggplot2)

# Passo 1: Carregar o arquivo CSV com os dados
# Substitua "caminho/para/seu/arquivo.csv" pelo caminho real do seu arquivo CSV
data <- read.csv("apriori-association-rules.csv", stringsAsFactors = FALSE)

# Verificar a estrutura dos dados
head(data)

# Passo 2: Solicitar ao usuário o país que deseja plotar
# Você pode substituir o valor manualmente, caso queira.
country_input <- "Albania"  # Exemplo: Altere para o país desejado

# Passo 3: Verificar se o país existe no conjunto de dados
if (!(country_input %in% unique(data$country))) {
  stop(paste("O país", country_input, "não está presente na base de dados."))
}

# Passo 4: Filtra os dados para o país selecionado
country_data <- data %>% filter(country == country_input)

# Passo 5: Criar o grafo para o país
g <- graph_from_data_frame(country_data, directed = FALSE)

# Passo 6: Gerar o gráfico com ggraph para visualização aprimorada
p <- ggraph(g, layout = 'fr') +
  geom_edge_link(aes(edge_alpha = support, edge_width = lift), color = "blue") +
  geom_node_point(aes(size = degree(g), color = country_input), show.legend = TRUE) +
  geom_node_text(aes(label = name), repel = TRUE, size = 3) +
  theme_void() +
  labs(title = paste("Grafo de Associação para", country_input))

# Passo 7: Plotar o gráfico diretamente no RStudio
print(p)
