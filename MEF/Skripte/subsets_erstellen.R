subsets_erstellen <- function(){
  
  #Subsets nach Uhrzeit 
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  library(tidyverse)
  
  data_ishiharaclean$'Uhrzeit' <- format(as.POSIXct(data_ishiharaclean$'Uhrzeit'), "%H:%M:%S")
  data_ic_mo <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= "06:00:00" & data_ishiharaclean$'Uhrzeit'<= "11:59:59")
  
  data_ic_a <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= "12:00:00" & data_ishiharaclean$'Uhrzeit'<= "17:59:59" )
  
  data_ic_e <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= '18:00:00' & data_ishiharaclean$'Uhrzeit'<= '23:59:59')
  
  data_ic_n <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= '00:00:00' & data_ishiharaclean$'Uhrzeit'<= '05:59:59')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  library(tidyverse)
  
  data_ishiharafalse$'Uhrzeit' <- format(as.POSIXct(data_ishiharafalse$'Uhrzeit'), "%H:%M:%S")
  
  data_if_mo <-subset(data_ishiharafalse, data_ishiharafalse$'Uhrzeit' >= "06:00:00" & data_ishiharafalse$'Uhrzeit'<= "11:59:59")
  
  data_if_a <-subset(data_ishiharafalse, data_ishiharafalse$'Uhrzeit' >= "12:00:00" & data_ishiharafalse$'Uhrzeit'<= "17:59:59" )
  
  data_if_e <-subset(data_ishiharafalse, data_ishiharafalse$'Uhrzeit' >= '18:00:00' & data_ishiharaclean$'Uhrzeit'<= '23:59:59')
  
  data_if_n <-subset(data_ishiharafalse, data_ishiharafalse$'Uhrzeit' >= '00:00:00' & data_ishiharafalse$'Uhrzeit'<= '05:59:59')
  
  ## Unbereinigt
  data$'Uhrzeit' <- format(as.POSIXct(data$'Uhrzeit'), "%H:%M:%S")
  data_mo <-subset(data, data$'Uhrzeit' >= "06:00:00" & data$'Uhrzeit'<= "11:59:59")
  
  data_a <-subset(data, data$'Uhrzeit' >= "12:00:00" & data$'Uhrzeit'<= "17:59:59" )
  
  data_e <-subset(data, data$'Uhrzeit' >= '18:00:00' & data$'Uhrzeit'<= '23:59:59')
  
  data_n <-subset(data, data$'Uhrzeit' >= '00:00:00' & data$'Uhrzeit'<= '05:59:59')
  
  # Subset Probanden mit 100 richtigen Antworten
  data_100 <-subset(data_ishiharaclean, data_ishiharaclean$'Richtig' == '100')
  
  # Subset nach Geschlecht
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  data_ic_m <-subset(data_ishiharaclean, data_ishiharaclean$'Geschlecht' == 'm')
  data_ic_f <-subset(data_ishiharaclean, data_ishiharaclean$'Geschlecht' == 'f')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  data_if_m <-subset(data_ishiharafalse, data_ishiharafalse$'Geschlecht' == 'm')
  data_if_f <-subset(data_ishiharafalse, data_ishiharafalse$'Geschlecht' == 'f')
  
  ## Unbereinigt
  data_m <-subset(data, data$'Geschlecht' == 'm')
  data_f <-subset(data, data$'Geschlecht' == 'f')
  
  
  
  # Subsets nach Alter
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  data_ic_11 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == 'unter 11')
  data_ic_1120 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '11-20')
  data_ic_2130 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '21-30')
  data_ic_3140 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '31-40')
  data_ic_4150 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '41-50')
  data_ic_5160 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '51-60')
  data_ic_60 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == 'über 60')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  data_if_11 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == 'unter 11')
  data_if_1120 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == '11-20')
  data_if_2130 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == '21-30')
  data_if_3140 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == '31-40')
  data_if_4150 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == '41-50')
  data_if_5160 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == '51-60')
  data_if_60 <-subset(data_ishiharafalse, data_ishiharafalse$'Alter' == 'über 60')
  
  ## Unbereinigt
  data_11 <-subset(data, data$'Alter' == 'unter 11')
  data_1120 <-subset(data, data$'Alter' == '11-20')
  data_2130 <-subset(data, data$'Alter' == '21-30')
  data_3140 <-subset(data, data$'Alter' == '31-40')
  data_4150 <-subset(data, data$'Alter' == '41-50')
  data_5160 <-subset(data, data$'Alter' == '51-60')
  data_60 <-subset(data, data$'Alter' == 'über 60')
  
  
  
  # Subsets nach OS
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  data_ic_iOS <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'iOS')
  data_ic_Android <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'Android')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  data_if_iOS <-subset(data_ishiharafalse, data_ishiharafalse$'OS' == 'iOS')
  data_if_Android <-subset(data_ishiharafalse, data_ishiharafalse$'OS' == 'Android')
  
  ## Unbereinigt
  data_iOS <-subset(data, data$'OS' == 'iOS')
  data_Android <-subset(data, data$'OS' == 'Android')
  
  
  
  # Subsets nach Smartphone Nutzung
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  data_ic_mt <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'mehrmals täglich')
  data_ic_t <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'täglich')
  data_ic_mw <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'mehrmals die Woche')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  data_if_mt <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzung' == 'mehrmals täglich')
  data_if_t <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzung' == 'täglich')
  data_if_mw <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzung' == 'mehrmals die Woche')
  
  ## Unbereinigt
  data_mt <-subset(data, data$'Smartphone Nutzung' == 'mehrmals täglich')
  data_t <-subset(data, data$'Smartphone Nutzung' == 'täglich')
  data_mw <-subset(data, data$'Smartphone Nutzung' == 'mehrmals die Woche')
  
  
  
  # Subsets nach Smartphone Erfahrung
  ## Bereinigt nur Probanden ohne Farbfehlsichtigkeit
  data_ic_ss <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sehr sicher')
  data_ic_s <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sicher')
  data_ic_mm <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'mittelmäßig')
  data_ic_u <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'unsicher')
  data_ic_su <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sehr unsicher')
  
  ## Bereinigt nur Probanden mit Farbfehlsichtigkeit
  data_if_ss <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzungserfahrung' == 'sehr sicher')
  data_if_s <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzungserfahrung' == 'sicher')
  data_if_mm <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzungserfahrung' == 'mittelmäßig')
  data_if_u <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzungserfahrung' == 'unsicher')
  data_if_su <-subset(data_ishiharafalse, data_ishiharafalse$'Smartphone Nutzungserfahrung' == 'sehr unsicher')
  
  ## Unbereinigt
  data_ss <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sehr sicher')
  data_s <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sicher')
  data_mm <-subset(data, data$'Smartphone Nutzungserfahrung' == 'mittelmäßig')
  data_u <-subset(data, data$'Smartphone Nutzungserfahrung' == 'unsicher')
  data_su <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sehr unsicher')
  
}