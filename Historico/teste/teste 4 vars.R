#Acertando as variaveis
BASE$asma <- factor(BASE$asma)
BASE$obeso <- factor(BASE$obeso)
BASE$cardio <- factor(BASE$cardio)
BASE$has <- factor(BASE$has)

# Chamando a biblioteca da sobrevivência
library (survival) 
# Ajustando o modelo
mod4 <- coxph(Surv(TempodeinternaçãoTOTAL, desf) ~ age + asma + obeso + cardio + has, data = BASE)
mod4


# Calculando os resíduos de Schoenfeld
zph <- cox.zph(mod4)
# Teste da correlação linear Global do modelo e de cada variável
zph



#item c
# Gráfico dos Resíduos Schoenfeld de cada variável do modelo
par(mfrow = c(2, 3))
plot(zph[1], main = "age")
abline(h = mod4$coef[1], lty = 3)
plot(zph[2], main = "asma")
abline(h = mod4$coef[2], lty = 3)
plot(zph[3], main = "obeso")
abline(h = mod4$coef[3], lty = 3)
plot(zph[4], , main = "cardio")
abline(h = mod4$coef[4], lty = 3)
plot(zph[5], main = "has")
abline(h = mod4$coef[5], lty = 3)