df_backup = df
df = subset(df, df$tecnica == "raqui")

#REGRESSÃO LOGISTICA COM Y=TIPO: =========================
#ID; IDADE:=====
chisq.test(df$id, df$tipo, correct=FALSE) #Qui quadrado(Pearson chi2(2)) e P-value(Pr):
mod = glm(tipo~id, family=binomial(link='logit'), data=df) #modelo:
summary(mod)

#FOREST PLOT

mod = glm(tipo~id+sexo+asa+avc_previo+doenca_cardiaca+drc+tecnica+dva+transamin+transfusao+tempo, family=binomial(link='logit'), data=dff)
summary(mod)
exp(cbind(OR = coef(mod), confint(mod)))
forest_model(mod)
mod1 = step(mod, direction = "backward", test = "F") #aplicando seletor de variaveis
forest_model(mod1) #forest-plot final

#GRAFICO
plt1 = ggplot(df, aes(y=dor_24h, fill=tipo))+
  geom_bar()+
  scale_fill_brewer(palette="Accent")+
  labs(title="Dor nas 24h vs Tipo de cirurgia")+
  theme_light()+
  geom_text()+
  theme(axis.line.x=element_line(size=.5, colour="black"),legend.position="bottom",
        legend.direction = "horizontal",legend.box="horizontal", legend.text=element_text(size=10),
        text=element_text(family="Roboto Condensed"))
plt1

plt2 = ggplot(df, aes(y=tipo, fill=dor_24h))+
  geom_bar()+
  scale_fill_brewer(palette="Accent")+
  labs(title="Boxplot de Dias antes da cirurgia")+
  theme_light()+
  theme(axis.line.x=element_line(size=.5, colour="black"),legend.position="bottom",
        legend.direction = "horizontal",legend.box="horizontal", legend.text=element_text(size=10),
        text=element_text(family="Roboto Condensed"))
plt2

grid.arrange(plt1, plt2, ncol=2)

#
ggplot(dff, aes(y=tipo))+
  geom_bar()+
  geom_text(aes(label=scales::percent()))
  scale_fill_brewer(palette="Accent")+
  labs(title="Boxplot de Dias antes da cirurgia")+
  theme_light()+
  theme(axis.line.x=element_line(size=.5, colour="black"),legend.position="bottom",
        legend.direction = "horizontal",legend.box="horizontal", legend.text=element_text(size=10),
        text=element_text(family="Roboto Condensed"))+facet_grid(dor_24h~.)
