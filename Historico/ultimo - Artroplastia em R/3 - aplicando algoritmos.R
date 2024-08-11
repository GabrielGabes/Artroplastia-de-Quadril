install.packages("e1071", dep = TRUE)
library(e1071)

classificador = naiveBayes(x=base_treinamento[-23], y=base_treinamento$hipo)
print(classificador)
previsoes = predict(classificador, newdata = base_teste[-23])
previsoes

install.packages('caret', dependencies=TRUE)
library(caret)
install.packages("Rcpp", dependencies=TRUE)
matriz_confusao = table(base_teste[, 23], previsoes)
print(matriz_confusao)


confusionMatrix(matriz_confusao)
