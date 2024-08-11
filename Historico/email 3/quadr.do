use "C:\Users\Rodolfo\Dropbox\RESIDÊNCIA\Projetos científicos\CEP artroplastia\QUADRIL.dta", clear
cd "\Users\Rodolfo\Dropbox\RESIDÊNCIA"




replace Doençacardíaca = "sim" in 34
 
gen assa=.
replace assa=1 if asa==1
replace assa=2 if asa==2
replace assa=3 if asa==3
replace assa=3 if asa==4

drop if tecnica=="geralperi"
 
gen gerall=.

replace gerall=1 if geral=="venosa"

replace gerall=2 if geral=="inalatoria"

gen liq= (líquidostotal/ peso)/ (tempocirúrgicomin/60)

generate id=.
replace id=0 if idade<50
replace id=1 if idade>=50&idade<60
replace id=2 if idade>=60&idade<70
replace id=3 if idade>=70&idade<80
replace id=4 if idade>=80

gen obeso=.
 replace obeso=1 if peso>100
 replace obeso=2 if peso>=100

gen priorday=.

 replace priorday=1 if TEMPODIASANTESDACIRURGIA>=1
 replace priorday=2 if TEMPODIASANTESDACIRURGIA>1
 
 gen hipo=.
 replace hipo=0 if hipotensãonoIOde20=="não"
 replace hipo=1 if hipotensãonoIOde20=="sim"
 
 *ANÁLISE DESCRITIVA GERAL 
 * tabela 1

tab id
  tab Ano
 tab id
 tab sexo
 tab assa 
 tab AVCprévio 
 tab tabagismo
 tab Doençacardíaca 
 tab has
 tab dm 
 tab tecnica 
 tab gerall 
 tab tipo 
 tab sangramento 
 tab DVA 
 tab transfusão
 tab Transamin
 tab hipotermia 
 tab DRC
 tab protocolodehipotermia 
 tab hipotensãonoIOde20
 tab destino
 tab NecessidadedeDVA
 tab Dor24h 
 tab pcr 
 tab reintubação 
 tab transfusãonauti
 tab ELETIVAURGENCIA
 tab priorday
 tab obeso
 
 

 sum idade TEMPODIASANTESDACIRURGIA peso tempocirúrgicomin líquidostotal tempodeuti tempodeinternação liq
 
  
  *Vamos analisar os seguintes desfechos principais: hipotensão no IO; uso de DVA no PO/ Transfusão no PO; pcr
  *As varíaveis que podem influenciar neste desfecho são: ano, sexo, AVC, tabagismo, DC, HAS, dm, técnica tipo, DRC, geral, transfusão no IO, transamin, hipotermia, seguimento do protocolo de hipotermia, hipotensão, destino, eletiva/urgencia, tempo de dias antes da cirurgia, tempo cirurgico. 
  *O que influenciou no tempo de internação 
  
  
  
  *Tabela 2* características dos pacientes de acordo com a técnica 
  
tab Ano tecnica, chi col  
tab id tecnica, chi col
tab sexo tecnica, chi col
tab assa tecnica, chi col
 tab ELETIVAURGENCIA tecnica, chi col
 tab AVCprévio tecnica, chi col
 tab tabagismo tecnica, chi col
 tab Doençacardíaca tecnica, chi col
 tab has tecnica, chi col
 tab dm tecnica, chi col
 tab obeso tecnica, chi col
 tab DRC tecnica, chi col
 tab tipo tecnica , chi col
 tab sangramento tecnica , chi col
 tab DVA tecnica , chi col
 tab transfusão tecnica , chi col
 tab Transamin tecnica, chi col
 tab hipotermia tecnica, chi col
 tab hipo tecnica, chi col
 tab protocolodehipotermia tecnica, chi col
 tab destino tecnica, chi col
 tab pcr tecnica, chi col
 tab priorday tecnica, chi col
 tab NecessidadedeDVA tecnica, chi col
 tab transfusãonauti tecnica, chi col
 by tecnica, sort: sum liq
kwallis liq,  by(tecnica)
  
  
  * TABELA 3 - FATORES DE RISCO PARA HIPOTENSÃO (VARÍÁVEL DE INTERESSE: TÉCNICA)
  *HIPOTENSÃO 
  
 tab Ano hipotensãonoIOde20, chi col
 tab id hipotensãonoIOde20, chi col
 tab sexo hipotensãonoIOde20, chi col
 tab assa hipotensãonoIOde20, chi col
 tab ELETIVAURGENCIA hipotensãonoIOde20, chi col
 tab AVCprévio hipotensãonoIOde20, chi col
 tab tabagismo hipotensãonoIOde20, chi col
 tab Doençacardíaca  hipotensãonoIOde20, chi col
 tab has hipotensãonoIOde20, chi col
 tab dm  hipotensãonoIOde20, chi col
 tab DRC hipotensãonoIOde20, chi col
 tab tecnica  hipotensãonoIOde20, chi col
 tab gerall  hipotensãonoIOde20, chi col
 tab tipo  hipotensãonoIOde20, chi col
 tab sangramento  hipotensãonoIOde20, chi col
 tab DVA  hipotensãonoIOde20, chi col
 tab transfusão hipotensãonoIOde20, chi col
 tab Transamin hipotensãonoIOde20, chi col
 tab hipotermia  hipotensãonoIOde20, chi col
 tab protocolodehipotermia  hipotensãonoIOde20, chi col
 tab destino hipotensãonoIOde20, chi col
 tab NecessidadedeDVA hipotensãonoIOde20, chi col
 tab pcr hipotensãonoIOde20, chi col
 tab reintubação hipotensãonoIOde20, chi col
 tab transfusãonauti hipotensãonoIOde20, chi col
 tab priorday hipotensãonoIOde20, chi col
 tab obeso hipotensãonoIOde20, chi col
 by hipotensãonoIOde20, sort: sum liq
ranksum liq,  by(hipotensãonoIOde20)
 
 
 
 *HIPOTENSAO
 
   
 xi: logistic hipo i.Ano
 xi: logistic hipo i.id
 xi: logistic hipo i.sexo
 xi: logistic hipo i.assa
 xi: logistic hipo i.ELETIVAURGENCIA
 xi: logistic hipo i.AVCprévio
 xi: logistic hipo i.tabagismo
 xi: logistic hipo i.Doençacardíaca
 xi: logistic hipo i.obeso
 xi: logistic hipo i.priorday
 xi: logistic hipo i.dm
 xi: logistic hipo i.has
 xi: logistic hipo i.DRC
 xi: logistic hipo i.tecnica
 xi: logistic hipo i.gerall
 xi: logistic hipo i.tipo
 xi: logistic hipo i.DVA
 xi: logistic hipo i.sangramento
 xi: logistic hipo i.Transamin
 xi: logistic hipo i.transfusão
 xi: logistic hipo i.hipotermia
 xi: logistic hipo i.protocolodehipotermia
 xi: logistic hipo liq
 
 
xi: sw logistic hipo i.tecnica i.sexo i.id i.assa i.dm i.has i.sangramento i.Doençacardíaca i.ELETIVAURGENCIA i.hipotermia i.priorday, pr(0.1)






*TABELA 4 FATORES DE RISCO PARA desfecho na uti (VARIÁVEL DE INTERESSE - TÉCNICA)

tab NecessidadedeDVA transfusãonauti, chi col
tab NecessidadedeDVA pcr, chi col
tab pcr transfusãonauti, chi col

gen fi=.
replace fi=1 if NecessidadedeDVA=="sim" & transfusãonauti=="sim"
replace fi=1 if NecessidadedeDVA=="não" & transfusãonauti=="sim"
replace fi=1 if NecessidadedeDVA=="sim" & transfusãonauti=="não"
replace fi=0 if NecessidadedeDVA=="não" & transfusãonauti=="não"

tab fi


 tab Ano fi, chi col 
 tab id fi, chi col
 tab sexo fi, chi col
 tab assa fi, chi col
 tab ELETIVAURGENCIA fi, chi col
 tab AVCprévio fi, chi col
 tab tabagismo fi, chi col
 tab Doençacardíaca fi, chi col
 tab has fi, chi col
 tab dm  fi, chi col
 tab DRC fi, chi col
 tab tecnica fi, chi col
 tab tipo  fi, chi col
 tab sangramento  fi, chi col
 tab DVA  fi, chi col
 tab transfusão fi, chi col
 tab Transamin fi, chi col
 tab hipotermia  fi, chi col
 tab hipo fi, chi col
 tab protocolodehipotermia  fi, chi col
 tab destino fi, chi col
 tab pcr fi, chi col
 tab priorday fi, chi col
 tab obeso fi, chi col
 by fi, sort: sum liq
ranksum liq,  by(fi)
 
   
 xi: logistic fi i.id
 xi: logistic fi i.sexo
 xi: logistic fi i.assa
 xi: logistic fi i.ELETIVAURGENCIA
 xi: logistic fi i.AVCprévio
 xi: logistic fi i.tabagismo
 xi: logistic fi i.Doençacardíaca
 *xi: logistic fi i.obeso
 xi: logistic fi i.priorday
 xi: logistic fi i.dm
 xi: logistic fi i.has
 xi: logistic fi i.DRC
 xi: logistic fi i.tecnica
 xi: logistic fi i.gerall
 xi: logistic fi i.tipo
 xi: logistic fi tempocirúrgicomin
 xi: logistic fi i.DVA
 xi: logistic fi i.hipo
 xi: logistic fi i.sangramento
 xi: logistic fi i.Transamin
 xi: logistic fi i.transfusão
 xi: logistic fi i.hipotermia
 xi: logistic fi i.destino
 xi: logistic fi i.protocolodehipotermia
 xi: logistic fi liq
 

xi: sw logistic fi i.id i.assa i.AVCprévio i.Doençacardíaca i.priorday i.DRC i.tecnica i.DVA i.Transamin  i.transfusão liq , pr(0.1)


** tabela 5: Tempo de internação total (variável de interesse  - técnica)

gen tim=.
replace tim=1 if tempodeinternação >=5&tempodeinternação<120
replace tim=0 if tempodeinternação<=4&tempodeinternação>0


tab id tim, chi col
tab sexo tim, chi col
tab assa tim, chi col
 tab ELETIVAURGENCIA tim, chi col
 tab AVCprévio tim, chi col
 tab tabagismo tim, chi col
 tab Doençacardíaca tim, chi col
 tab has tim, chi col
 tab dm  tim, chi col
 tab DRC tim, chi col
 tab tecnica tim, chi col
 tab gerall  tim, chi col
 tab tipo  tim, chi col
 tab sangramento  tim, chi col
 tab DVA  tim, chi col
 tab transfusão tim, chi col
 tab Transamin tim, chi col
 tab hipotermia  tim, chi col
 tab hipo tim, chi col
 tab protocolodehipotermia tim, chi col
 tab destino tim, chi col
 tab pcr tim, chi col
  tab priorday tim, chi col
  tab NecessidadedeDVA  tim, chi col
  tab transfusãonauti tim, chi col
 tab obeso tim, chi col
 by tim, sort: sum liq
ranksum liq,  by(tim)
 
   
 xi: logistic tim i.id
 xi: logistic tim i.sexo
 xi: logistic tim i.assa
 xi: logistic tim i.ELETIVAURGENCIA
 xi: logistic tim i.AVCprévio
 xi: logistic tim i.tabagismo
 xi: logistic tim i.Doençacardíaca
 *xi: logistic tim i.obeso
 xi: logistic tim i.priorday
 xi: logistic tim i.dm
 xi: logistic tim i.has
 xi: logistic tim i.DRC
 xi: logistic tim i.tecnica
 xi: logistic tim i.gerall
 xi: logistic tim i.tipo
 xi: logistic tim i.DVA
 xi: logistic tim i.hipo
 xi: logistic tim i.sangramento
 xi: logistic tim i.Transamin
 xi: logistic tim i.transfusão
 xi: logistic tim i.hipotermia
 xi: logistic tim tempocirúrgicomin
 xi: logistic tim i.destino
 xi: logistic tim i.protocolodehipotermia
 xi: logistic tim i.NecessidadedeDVA
 xi: logistic tim i.transfusãonauti
 xi: logistic tim liq
 


xi: sw logistic tim i.id i.assa i.AVCprévio i.Doençacardíaca i.priorday tempocirúrgicomin i.dm i.tecnica i.hipo i.DVA i.Transamin i.transfusão i.NecessidadedeDVA i.transfusãonauti , pr(0.1)


*analisando somente os casos de raquianestesia 

keep if tecnica=="raqui"


*Tabela 6 características dos pacientes de acordo com o tipo de raqui.
 
 tab id tipo, chi col
tab sexo tipo, chi col
tab assa tipo, chi col
tab ELETIVAURGENCIA tipo, chi col
 tab AVCprévio tipo, chi col
 tab tabagismo tipo , chi col
 tab Doençacardíaca tipo, chi col
 tab has tipo, chi col
 tab dm  tipo, chi col
 tab DRC tipo, chi col
  tab sangramento tipo , chi col
 tab DVA tipo , chi col
 tab transfusão tipo, chi col
 tab Transamin tipo, chi col
 tab hipotermia tipo, chi col
 tab hipo tipo, chi col
 tab protocolodehipotermia tipo, chi col
 tab destino tipo, chi col
 tab pcr tipo, chi col
 tab priorday tipo, chi col
 tab NecessidadedeDVA tipo, chi col
 tab transfusãonauti tipo, chi col
 tab obeso tipo, chi col
by tipo, sort: sum liq
ranksum liq,  by(tipo)


xi: sw logistic hipo i.tecnica i.sexo i.id i.assa i.dm i.has i.sangramento i.Doençacardíaca i.ELETIVAURGENCIA i.hipotermia i.priorday, pr(0.1)

xi: sw logistic fi i.id i.assa i.AVCprévio i.Doençacardíaca i.priorday i.DRC i.tipo i.DVA i.Transamin  i.transfusão liq , pr(0.1)

xi: sw logistic tim i.id i.assa i.AVCprévio i.Doençacardíaca i.priorday tempocirúrgicomin i.dm i.tipo i.hipo i.DVA i.Transamin i.transfusão i.NecessidadedeDVA i.transfusãonauti , pr(0.1)

xi: logistic hipo i.tipo
xi: logistic hipo i.tipo i.id
xi: logistic hipo i.tipo i.id i.assa
xi: logistic hipo i.tipo i.id i.assa i.dm i.has i.Doençacardíaca i.AVCprévio
 xi: logistic hipo i.tipo i.id i.tempocirúrgicomin 
 
 
 
 xi: logistic fi i.tipo
 xi: logistic fi i.tipo i.id
 xi: logistic fi i.tipo i.id i.assa
 xi: logistic fi i.tipo i.id i.assa i.dm i.has i.Doençacardíaca i.AVCprévio 
 xi: logistic fi i.tipo i.id i.tempocirúrgicomin
 
 

 
  
 
  

 
 
 
