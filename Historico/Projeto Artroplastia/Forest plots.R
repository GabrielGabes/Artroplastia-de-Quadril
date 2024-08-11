#FOREST PLOT=================================================================
#HIPO
mod = glm(hipo~tecnica+sexo+id+asa+dm+has+sangramento+doenca_cardiaca+eletiva_urgencia+hipotermia+priorday, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
plotforest = forest_model(mod)
plotforest

#FI
mod = glm(fii~id+asa+avc_previo+doenca_cardiaca+priorday+drc, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
plotforest = forest_model(mod)
plotforest

#TIM
mod = glm(tim~id+asa+avc_previo+doenca_cardiaca+priorday+tempo_cirurgico_min+dm+tipo+hipo+dva+transamin+transfusao+necessidade_de_dva+transfusao_na_uti, family=binomial(link='logit'), data=df)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
plotforest = forest_model(mod)
plotforest

#TESTE========================================================
