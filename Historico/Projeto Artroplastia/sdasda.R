#FI
model1 = glm(hipo~id+asa+avc_previo+doenca_cardiaca+priorday+drc+tecnica+dva+transamin+transfusao+liq, family=binomial(link='logit'), data=df)
modd1 = step(model1, direction = "backward", test = "F")
modd1 = step(model1, direction = "backward", test = "F")
forest_model(modd1)

summary(modd1)

sum(is.na(df$id))
sum(is.na(df$asa))
sum(is.na(df$avc_previo))
sum(is.na(df$doenca_cardiaca))
sum(is.na(df$priorday))
sum(is.na(df$drc))
sum(is.na(df$tecnica))
sum(is.na(df$dva))
sum(is.na(df$transamin))
sum(is.na(df$transfusao))

table(df$fii, df$tim)


mod = glm(hipo~tipo+dm+has+doenca_cardiaca+avc_previo, family=binomial(link='logit'), data=df)
AIC(mod)
exp(cbind(OR = coef(mod), confint(mod)))



