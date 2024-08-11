#REGRESSÃO LOGISTICA COM Y=TIM: =========================
#ID; IDADE:=====
chisq.test(df$id, df$tim, correct=FALSE) #Qui quadrado(Pearson chi2(2)) e P-value(Pr):
mod = glm(tim~id, family=binomial(link='logit'), data=df) #modelo:
summary(mod)
exp(cbind(OR = coef(mod), confint(mod))) #odds e Intervalo de confiança:

#FOREST PLOT=================================================================
#1
mod = glm(tim~id+asa+avc_previo+doenca_cardiaca+dm+tecnica+hipo+dva+transamin+transfusao+necessidade_de_dva+transfusao_na_uti+tempo, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
plotforest = forest_model(mod)
plotforest

mod1 = step(mod, direction = "backward", test = "F")
forest_model(mod1)

#2
mod = glm(tim~id+asa+avc_previo+doenca_cardiaca+priorday+dm+tecnica+hipo+dva+transamin+transfusao+necessidade_de_dva+transfusao_na_uti, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
plotforest = forest_model(mod)
plotforest

mod1 = step(mod, direction = "backward", test = "F")
forest_model(mod1)
