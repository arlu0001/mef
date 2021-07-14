# Datensatz importieren

library(readr)
#Filenamen anpassen
Daten_orig <- read_csv("Daten/Daten_n118.csv", 
                       col_types = cols(Datum = col_date(format = "%d.%m.%Y"), 
                                        Uhrzeit = col_time(format = "%H:%M"), 
                                        Geschlecht = col_factor(levels = c("f", 
                                                                           "m")), Alter = col_factor(levels = c("unter 11", 
                                                                                                                "11-20", "21-30", "31-40", "41-50", 
                                                                                                                "51-60", "über 60")), OS = col_factor(levels = c("iOS", 
                                                                                                                                                                 "Android")), `Smartphone Nutzung` = col_factor(levels = c("mehrmals täglich", 
                                                                                                                                                                                                                           "täglich", "mehrmals die Woche")), 
                                        `Smartphone Nutzungserfahrung` = col_factor(levels = c("sehr sicher", 
                                                                                               "sicher", "mittelmäßig", "unsicher", 
                                                                                               "sehr unsicher")), `Zeit gesamt` = col_time(format = "%H:%M:%OS")))





# Original Datensatz kopieren
data_raw <- Daten_orig
#View(data)


# Original Datensatz kopieren minus ungültige Zeilen 
drops <- c(107)
data <- data_raw[-drops,]
View(data)


# Bereinigen des Datensatz ohne Farbfehlsichtigkeit
data_ishiharaclean <-subset(data, data$`Ishihara 3` == 3 & data$`Ishihara 42` == 42 & data$`Ishihara Linien`== 'keine')


# Bereinigen des Datensatz mit Farbfehlsichtigkeit
data_ishiharafalse <-subset(data, data$`Ishihara 3` != 3 | data$`Ishihara 42` != 42 | data$`Ishihara Linien`!= 'keine')
View(data_ishiharafalse)


#Subsets nach Uhrzeit 
## Bereinigt
library(tidyverse)

data_ishiharaclean$'Uhrzeit' <- format(as.POSIXct(data_ishiharaclean$'Uhrzeit'), "%H:%M:%S")
data_ic_mo <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= "06:00:00" & data_ishiharaclean$'Uhrzeit'<= "11:59:59")

data_ic_a <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= "12:00:00" & data_ishiharaclean$'Uhrzeit'<= "17:59:59" )

data_ic_e <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= '18:00:00' & data_ishiharaclean$'Uhrzeit'<= '23:59:59')

data_ic_n <-subset(data_ishiharaclean, data_ishiharaclean$'Uhrzeit' >= '00:00:00' & data_ishiharaclean$'Uhrzeit'<= '05:59:59')


## Unbereinigt
data$'Uhrzeit' <- format(as.POSIXct(data$'Uhrzeit'), "%H:%M:%S")
data_mo <-subset(data, data$'Uhrzeit' >= "06:00:00" & data$'Uhrzeit'<= "11:59:59")

data_a <-subset(data, data$'Uhrzeit' >= "12:00:00" & data$'Uhrzeit'<= "17:59:59" )

data_e <-subset(data, data$'Uhrzeit' >= '18:00:00' & data$'Uhrzeit'<= '23:59:59')

data_n <-subset(data, data$'Uhrzeit' >= '00:00:00' & data$'Uhrzeit'<= '05:59:59')



# Subset nach Geschlecht
## Bereinigt
data_ic_m <-subset(data_ishiharaclean, data_ishiharaclean$'Geschlecht' == 'm')
data_ic_f <-subset(data_ishiharaclean, data_ishiharaclean$'Geschlecht' == 'f')

## Unbereinigt
data_m <-subset(data, data$'Geschlecht' == 'm')
data_f <-subset(data, data$'Geschlecht' == 'f')


# Subsets nach Alter
## Bereinigt
data_ic_11 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == 'unter 11')
data_ic_1120 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '11-20')
data_ic_2130 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '21-30')
data_ic_3140 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '31-40')
data_ic_4150 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '41-50')
data_ic_5160 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == '51-60')
data_ic_60 <-subset(data_ishiharaclean, data_ishiharaclean$'Alter' == 'über 60')

## Unbereinigt
data_11 <-subset(data, data$'Alter' == 'unter 11')
data_1120 <-subset(data, data$'Alter' == '11-20')
data_2130 <-subset(data, data$'Alter' == '21-30')
data_3140 <-subset(data, data$'Alter' == '31-40')
data_4150 <-subset(data, data$'Alter' == '41-50')
data_5160 <-subset(data, data$'Alter' == '51-60')
data_60 <-subset(data, data$'Alter' == 'über 60')


# Subsets nach OS
## Bereinigt
data_ic_iOS <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'iOS')
data_ic_Android <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'Android')

## Unbereinigt
data_iOS <-subset(data, data$'OS' == 'iOS')
data_Android <-subset(data, data$'OS' == 'Android')


# Subsets nach OS
## Bereinigt
data_ic_iOS <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'iOS')
data_ic_Android <-subset(data_ishiharaclean, data_ishiharaclean$'OS' == 'Android')

## Unbereinigt
data_iOS <-subset(data, data$'OS' == 'iOS')
data_Android <-subset(data, data$'OS' == 'Android')


# Subsets nach Smartphone Nutzung
## Bereinigt
data_ic_mt <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'mehrmals täglich')
data_ic_t <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'täglich')
data_ic_mw <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzung' == 'mehrmals die Woche')

## Unbereinigt
data_mt <-subset(data, data$'Smartphone Nutzung' == 'mehrmals täglich')
data_t <-subset(data, data$'Smartphone Nutzung' == 'täglich')
data_mw <-subset(data, data$'Smartphone Nutzung' == 'mehrmals die Woche')


# Subsets nach Smartphone Erfahrung
## Bereinigt
data_ic_ss <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sehr sicher')
data_ic_s <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sicher')
data_ic_mm <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'mittelmäßig')
data_ic_u <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'unsicher')
data_ic_su <-subset(data_ishiharaclean, data_ishiharaclean$'Smartphone Nutzungserfahrung' == 'sehr unsicher')

## Unbereinigt
data_ss <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sehr sicher')
data_s <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sicher')
data_mm <-subset(data, data$'Smartphone Nutzungserfahrung' == 'mittelmäßig')
data_u <-subset(data, data$'Smartphone Nutzungserfahrung' == 'unsicher')
data_su <-subset(data, data$'Smartphone Nutzungserfahrung' == 'sehr unsicher')


# Durschnittliche Zeit pro Aufgabe

### Methode zur Berechnung der Durchschnitszeit

#Durchschnittliche Zeit pro Aufgabe in Millisekunden
get_tptfv <- function(dataset){
  library(dplyr)
  name_tpt_dataset <- dataset %>% select(starts_with('Z'))
  #Zeit gesamt entfernen
  name_tpt_dataset[, 'Zeit gesamt'] <- list(NULL)
  #Variable mit der durchschnittlichen Zeit der einzelnen Aufgaben erstellen
  mean_tpt_value <-c(colMeans(name_tpt_dataset))
  return(mean_tpt_value)
}

#Durchschnittliche Zeit pro Aufgabe in Sekunden
get_tptfvr <- function(dataset){
  library(dplyr)
  name_tpt_dataset <- dataset %>% select(starts_with('Z'))
  #Zeit gesamt entfernen
  name_tpt_dataset[, 'Zeit gesamt'] <- list(NULL)
  #Variable mit der durchschnittlichen Zeit der einzelnen Aufgaben erstellen
  mean_tpt_value <-c(colMeans(name_tpt_dataset)/1000)
  return(mean_tpt_value)
}

## Bereinigt
#Millisekunden
mean_tpt <- get_tptfv(data_ishiharaclean)
#Sekunden
mean_tptr <- get_tptfvr(data_ishiharaclean)


## Bereinigt nach Geschlecht
#Millisekunden
mean_tpt_f<- get_tptfv(data_ic_f)
mean_tpt_m<- get_tptfv(data_ic_m)

#Sekunden
mean_tptr_f<- get_tptfvr(data_ic_f)
mean_tptr_m<- get_tptfvr(data_ic_m)


## Bereinigt nach Alter
#Millisekunden
mean_tpt_11<- get_tptfv(data_ic_11)
mean_tpt_1120<- get_tptfv(data_ic_1120)
mean_tpt_2130<- get_tptfv(data_ic_2130)
mean_tpt_3140<- get_tptfv(data_ic_3140)
mean_tpt_4150<- get_tptfv(data_ic_4150)
mean_tpt_5160<- get_tptfv(data_ic_5160)
mean_tpt_60<- get_tptfv(data_ic_60)
#Sekunden
mean_tptr_11<- get_tptfvr(data_ic_11)
mean_tptr_1120<- get_tptfvr(data_ic_1120)
mean_tptr_2130<- get_tptfvr(data_ic_2130)
mean_tptr_3140<- get_tptfvr(data_ic_3140)
mean_tptr_4150<- get_tptfvr(data_ic_4150)
mean_tptr_5160<- get_tptfvr(data_ic_5160)
mean_tptr_60<- get_tptfvr(data_ic_60)


## Bereinigt nach Betriebssystem
#Millisekunden
mean_tpt_iOS<- get_tptfv(data_ic_iOS)
mean_tpt_Android<- get_tptfv(data_ic_Android)

#Sekunden
mean_tptr_iOS<- get_tptfvr(data_ic_iOS)
mean_tptr_Android<- get_tptfvr(data_ic_Android)


## Bereinigt nach Smartphone Nutzung
#Millisekunden
mean_tpt_mt<- get_tptfv(data_ic_mt)
mean_tpt_t<- get_tptfv(data_ic_t)
mean_tpt_wt<- get_tptfv(data_ic_wt)

#Sekunden
mean_tptr_mt<- get_tptfvr(data_ic_mt)
mean_tptr_t<- get_tptfvr(data_ic_t)
mean_tptr_wt<- get_tptfvr(data_ic_wt)


## Bereinigt nach Smartphone Erfahrung
#Millisekunden
mean_tpt_ss<- get_tptfv(data_ic_ss)
mean_tpt_s<- get_tptfv(data_ic_s)
mean_tpt_mm<- get_tptfv(data_ic_mm)
mean_tpt_u<- get_tptfv(data_ic_u)
mean_tpt_su<- get_tptfv(data_ic_su)

#Sekunden
mean_tptr_ss<- get_tptfvr(data_ic_ss)
mean_tptr_s<- get_tptfvr(data_ic_s)
mean_tptr_mm<- get_tptfvr(data_ic_mm)
mean_tptr_u<- get_tptfvr(data_ic_u)
mean_tptr_su<- get_tptfvr(data_ic_su)

