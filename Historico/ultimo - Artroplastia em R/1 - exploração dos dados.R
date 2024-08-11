library(readxl)
base <- read_excel("projetos/Trabalho - Artroplastia de Quadril/BASE_TESTE_1.xlsx")
View(base)

unique(base$geral) #unique
table(base$geral) #cont dos dados

library(dplyr)

teste = filter(base, tecnica = 'geralperi')

