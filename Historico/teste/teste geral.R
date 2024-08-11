BASE$cencomorb <- factor(BASE$cencomorb)
BASE$intuti <- factor(BASE$intuti)
BASE$comorb <- factor(BASE$comorb)
BASE$therenal <- factor(BASE$therenal)
BASE$venti <- factor(BASE$venti)
BASE$ECMO <- factor(BASE$ECMO)
BASE$asma <- factor(BASE$asma)
BASE$obeso <- factor(BASE$obeso)
BASE$mes <- factor(BASE$mes)
BASE$dpoc1 <- factor(BASE$dpoc1)
BASE$reg <- factor(BASE$reg)
BASE$cardio <- factor(BASE$cardio)
BASE$has <- factor(BASE$has)
BASE$dm <- factor(BASE$dm)
BASE$irc <- factor(BASE$irc)
BASE$avc <- factor(BASE$avc)
BASE$imuno <- factor(BASE$imuno)
BASE$reg2 <- factor(BASE$reg2)
BASE$comorb2 <- factor(BASE$comorb2)

# Chamando a biblioteca da sobrevivência
library (survival) 
# Ajustando o modelo
mod4 <- coxph(Surv(TempodeinternaçãoTOTAL, desf) ~ age + cencomorb + intuti + comorb + therenal + venti + ECMO + asma + obeso + mes + dpoc1 + reg + cardio + has + dm + irc + avc + imuno + reg2 + comorb2, data = BASE)
mod4


# Calculando os resíduos de Schoenfeld
zph <- cox.zph(mod4)
# Teste da correlação linear Global do modelo e de cada variável
zph




#item c
# Gráfico dos Resíduos Schoenfeld de cada variável do modelo
par(mfrow = c(2, 10))
plot(zph[1], main = "cencomorb")
abline(h = mod4$coef[1], lty = 10)
plot(zph[2], main = "desf")
abline(h = mod4$coef[2], lty = 10)
plot(zph[3], main = "intuti")
abline(h = mod4$coef[3], lty = 10)
plot(zph[4], main = "comorb")
abline(h = mod4$coef[4], lty = 10)
plot(zph[5], main = "therenal")
abline(h = mod4$coef[5], lty = 10)
plot(zph[6], main = "venti")
abline(h = mod4$coef[6], lty = 10)
plot(zph[7], main = "ECMO")
abline(h = mod4$coef[7], lty = 10)
plot(zph[8], main = "asma")
abline(h = mod4$coef[8], lty = 10)
plot(zph[9], main = "obeso")
abline(h = mod4$coef[9], lty = 10)
plot(zph[10], main = "mes")
abline(h = mod4$coef[10], lty = 10)
plot(zph[11], main = "dpoc1")
abline(h = mod4$coef[11], lty = 10)
plot(zph[12], main = "reg")
abline(h = mod4$coef[12], lty = 10)
plot(zph[13], main = "cardio")
abline(h = mod4$coef[13], lty = 10)
plot(zph[14], main = "has")
abline(h = mod4$coef[14], lty = 10)
plot(zph[15], main = "dm")
abline(h = mod4$coef[15], lty = 10)
plot(zph[16], main = "irc")
abline(h = mod4$coef[16], lty = 10)
plot(zph[17], main = "avc")
abline(h = mod4$coef[17], lty = 10)
plot(zph[18], main = "imuno")
abline(h = mod4$coef[18], lty = 10)
plot(zph[19], main = "reg2")
abline(h = mod4$coef[19], lty = 10)
plot(zph[20], main = "comorb2")
abline(h = mod4$coef[20], lty = 10)