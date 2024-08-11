#HIPO
mod = glm(hipo~tecnica+sexo+id+asa+dm+has+sangramento+doenca_cardiaca+eletiva_urgencia+hipotermia+priorday, family=binomial(link='logit'), data=df)
#FI
mod = glm(fii~id+asa+avc_previo+doenca_cardiaca+priorday+drc+tecnica+dva+transamin+transfusao, family=binomial(link='logit'), data=df)
#TIM
mod = glm(tim~id+asa+avc_previo+doenca_cardiaca+priorday+dm+tecnica+hipo+dva+transamin+transfusao+necessidade_de_dva+transfusao_na_uti, family=binomial(link='logit'), data=df)

mod1 = step(mod, direction = "backward", test = "F")
mod2 = step(mod, direction = "both", test = "F")
mod3 = step(mod, direction = "forward", test = "F")

forest_model(mod1)
forest_model(mod2)
forest_model(mod3)

exp(cbind(OR = coef(mod1), confint(mod1)))

summary(mod1)

#TESTES ===================

model1 <- lrm(hipo~tecnica+sexo+id+asa+dm+has+sangramento+doenca_cardiaca+eletiva_urgencia+hipotermia+priorday, data=df)
model2 <- fastbw(fit=model1, rule="p", sls=0.1)
model2
exp(cbind(OR = coef(model2), confint(model2)))

#GRAFICOS
summary(df$idade)

ggplot(df, aes(x=idade, fill=hipo))+
  geom_density(position='identity', alpha =0.6)+
  scale_x_continuous(name="idade", breaks=seq(0,120,5),limits=c(0,120))+
  scale_fill_brewer(palette="Accent")+
  theme_light()+scale_fill_brewer()+
  labs(title="Frequencia: Idade vs Hipotensão")

summary(df$liq)

ggplot(df, aes(y=liq, fill=tecnica))+
  geom_boxplot()+
  scale_y_continuous(name="liq", breaks=seq(0,44,2),limits=c(0,25))+
  scale_fill_brewer(palette="Accent")+
  labs(title="Boxplot",subtitle="Frequencia Tecnicas Anestesicas",y="liquido")+
  theme_light()+scale_fill_brewer()+
  theme(axis.line.x=element_line(size=.5, colour="black"),legend.position="bottom",
        legend.direction = "horizontal",legend.box="horizontal", legend.text=element_text(size=10),
        text=element_text(family="Roboto Condensed"))

#hipo~tipo+dm+has+doenca_cardiaca+avc_previo+drc

mod = glm(fii~tipo+tempo_cirurgico_min, family=binomial(link='logit'), data=df)
exp(cbind(OR = coef(mod), confint(mod)))
AIC(mod)

