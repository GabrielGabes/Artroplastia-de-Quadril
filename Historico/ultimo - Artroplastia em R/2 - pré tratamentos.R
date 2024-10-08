base$Ano = NULL

#PR� TRATAMENTOS DE DADOS ======================================================
  #tratando os atributos categoricos:===========
    #trocando por numeros:
base$sexo = factor(base$sexo, levels=c('F', 'M'), labels=c(0, 1))
base$AVC_previo = factor(base$AVC_previo, levels=c('n�o', 'sim'), labels=c(0, 1))
base$tabagismo = factor(base$tabagismo, levels=c('n�o', 'sim'), labels=c(0, 1))
base$Doenca_cardiaca = factor(base$Doenca_cardiaca, levels=c('n�o', 'sim'), labels=c(0, 1))
base$dm = factor(base$dm, levels=c('n�o', 'sim'), labels=c(0, 1))
base$has = factor(base$has, levels=c('n�o', 'sim'), labels=c(0, 1))
base$DRC = factor(base$DRC, levels=c('n�o', 'sim'), labels=c(0, 1))
base$tecnica = factor(base$tecnica, levels=c('raqui', 'geralraqui', 'geral'), labels=c(0, 1, 2))
base$geral = factor(base$geral, levels=c('n�o', 'inalatoria', 'venosa'), labels=c(0, 1, 2))
base$tipo = factor(base$tipo, levels=c('bupi hiper', 'hipobarica'), labels=c(0, 1))
base$DVA = factor(base$DVA, levels=c('n�o', 'sim'), labels=c(0, 1))
base$sangramento = factor(base$sangramento, levels=c('n�o', 'sim'), labels=c(0, 1))
base$Transamin = factor(base$Transamin, levels=c('n�o', 'sim'), labels=c(0, 1))
base$transfus�o = factor(base$transfus�o, levels=c('n�o', 'sim'), labels=c(0, 1))
base$hipotermia = factor(base$hipotermia, levels=c('sim', 'n�o', 'temperatura n�o aferida'), labels=c(0, 1, 2))
base$protocolo_de_hipotermia = factor(base$protocolo_de_hipotermia, levels=c('n�o aplicado', 'aplicado'), labels=c(0, 1))
base$hipo = factor(base$hipo, levels=c('n�o', 'sim'), labels=c(0, 1))

#TRATAMENTO DE ATRIBUTOS NUMERICOS NULOS ======================================================
sapply(base, function(x) sum(is.na(x))) #mostrar valores nulos de todas as colunas
sum(is.na(base$idade)) #mostrar valores nulos
sum(is.na(base$peso))
sum(is.na(base$liq))
#base$idade = ifelse(is.na(base$idade), mean(base$idade, na.rm= TRUE), base$age)

#FAZENDO ESCALONAMENTO DOS ATRIBUTOS NUMERICOS
base$idade = scale(base$idade)
base$peso = scale(base$peso)
base$liq = scale(base$liq)

#DIVIDINDO OS DADOS EM TREINO E TESTE
library(caTools)
set.seed(1) #por��o de divis�o
divisao = sample.split(base$hipo, SplitRatio=0.75)
base_treinamento = subset(base, divisao == TRUE) #pegando os valores TRUE
base_teste = subset(base, divisao == FALSE)



