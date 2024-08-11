#REGRESSÃO LOGISTICA UNIVARIADA

chisq.test(df$id, df$fii, correct=FALSE) #Qui quadrado(Pearson chi2(2)) e P-value(Pr)
mod = glm(fii~id, family=binomial(link='logit'), data=df) #modelo
summary(mod)
exp(cbind(OR = coef(mod), confint(mod))) #odds e Intervalo de confiança


#FOREST PLOT

mod = glm(fii~id+asa+avc_previo+doenca_cardiaca+drc+tecnica+dva+transamin+transfusao+tempo, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
forest_model(mod)
mod1 = step(mod, direction = "backward", test = "F") #aplicando seletor de variaveis
forest_model(mod1) #forest-plot final

#Avaliando==================================

vif(mod)
vif(mod1)

Anova(mod1, type="II", test="Wald")

PseudoR2(mod1, which = "Nagelkerke")
RsqGLM(model=mod1)

AIC(mod, mod1)
BIC(mod, mod1)

library(caret) # matrix confusão
confusionMatrix(matrix(data=ClassLog(mod1, df$fii)$rawtab, 2, 2))







drop1(update(mod1, ~ . +id), test = "F") #adicionando uma variavel ao modelo

teste =drop1(update(mod1, ~ . +id), test = "F")

model1 <- lrm(fii~id+sexo+asa+avc_previo+doenca_cardiaca+drc+tecnica+dva+transamin+transfusao+tempo, data=df)
fastbw(fit=model1, rule="p", sls=0.5)

mod2 = stepAIC(mod, direction = "backward", trace = FALSE)
mod2
forest_model(mod2)

#Ausência de outliers/ pontos de alavancagem

plot(mod1, which=5)
summary(stdres(mod1))

#VIF

vif(mod1)
