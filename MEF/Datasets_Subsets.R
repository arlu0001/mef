# Datensatz importieren

library(readr)

#Filenamen anpassen
Daten_orig <- read_csv("Daten/Daten_n121.csv", 
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


# Original Datensatz kopieren minus ungültige Zeilen 
drops <- c(107)
data <- data_raw[-drops,]


# Bereinigen des Datensatz ohne Farbfehlsichtigkeit
data$'Ishihara Dauer' <- format(as.POSIXct(data$'Ishihara Dauer'), "%H:%M:%OS")
data_ishiharaclean <-subset(data, data$`Ishihara 3` == 3 & data$`Ishihara 42` == 42 & data$`Ishihara Linien`== 'keine'  & data$'Ishihara Dauer' < "00:02:00")

# Bereinigen des Datensatz mit Farbfehlsichtigkeit
#data$'Ishihara Dauer' <- format(as.POSIXct(data$'Ishihara Dauer'), "%H:%M:%OS")
data_ishiharafalse <-subset(data, data$`Ishihara 3` != 3 | data$`Ishihara 42` != 42 | data$`Ishihara Linien`!= 'keine' | data$'Ishihara Dauer' >= "00:02:00")

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

## Bereinigt ohne Farbfehlsichtigkeit
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
#mean_tpt_wt<- get_tptfv(data_ic_wt)

#Sekunden
mean_tptr_mt<- get_tptfvr(data_ic_mt)
mean_tptr_t<- get_tptfvr(data_ic_t)
#mean_tptr_wt<- get_tptfvr(data_ic_wt)


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

## Bereinigt nach Uhrzeit

#Millisekunden
mean_tpt_mo <- get_tptfv(data_ic_mo)
mean_tpt_a <- get_tptfv(data_ic_a)
mean_tpt_e <- get_tptfv(data_ic_e)
mean_tpt_n <- get_tptfv(data_ic_n)

#Sekunden
mean_tptr_mo <- get_tptfvr(data_ic_mo)
mean_tptr_a <- get_tptfvr(data_ic_a)
mean_tptr_e <- get_tptfvr(data_ic_e)
mean_tptr_n <- get_tptfvr(data_ic_n)


## Bereinigt mit Farbfehlsichtigkeit
#Millisekunden
mean_tpt_if <- get_tptfv(data_ishiharafalse)
#Sekunden
mean_tptr_if <- get_tptfvr(data_ishiharafalse)


## Bereinigt nach Geschlecht
#Millisekunden
mean_tpt_if_f<- get_tptfv(data_if_f)
mean_tpt_if_m<- get_tptfv(data_if_m)

#Sekunden
mean_tptr_if_f<- get_tptfvr(data_if_f)
mean_tptr_if_m<- get_tptfvr(data_if_m)


## Bereinigt nach Alter
#Millisekunden
mean_tpt_if_11<- get_tptfv(data_if_11)
mean_tpt_if_1120<- get_tptfv(data_if_1120)
mean_tpt_if_2130<- get_tptfv(data_if_2130)
mean_tpt_if_3140<- get_tptfv(data_if_3140)
mean_tpt_if_4150<- get_tptfv(data_if_4150)
mean_tpt_if_5160<- get_tptfv(data_if_5160)
mean_tpt_if_60<- get_tptfv(data_if_60)
#Sekunden
mean_tptr_if_11<- get_tptfvr(data_if_11)
mean_tptr_if_1120<- get_tptfvr(data_if_1120)
mean_tptr_if_2130<- get_tptfvr(data_if_2130)
mean_tptr_if_3140<- get_tptfvr(data_if_3140)
mean_tptr_if_4150<- get_tptfvr(data_if_4150)
mean_tptr_if_5160<- get_tptfvr(data_if_5160)
mean_tptr_if_60<- get_tptfvr(data_if_60)


## Bereinigt nach Betriebssystem
#Millisekunden
mean_tpt_if_iOS<- get_tptfv(data_if_iOS)
mean_tpt_if_Android<- get_tptfv(data_if_Android)

#Sekunden
mean_tptr_if_iOS<- get_tptfvr(data_if_iOS)
mean_tptr_if_Android<- get_tptfvr(data_if_Android)


## Bereinigt nach Smartphone Nutzung
#Millisekunden
mean_tpt_if_mt<- get_tptfv(data_if_mt)
mean_tpt_if_t<- get_tptfv(data_if_t)
#mean_tpt_if_wt<- get_tptfv(data_if_wt)

#Sekunden
mean_tptr_if_mt<- get_tptfvr(data_if_mt)
mean_tptr_if_t<- get_tptfvr(data_if_t)
#mean_tptr_if_wt<- get_tptfvr(data_if_wt)


## Bereinigt nach Smartphone Erfahrung
#Millisekunden
mean_tpt_if_ss<- get_tptfv(data_if_ss)
mean_tpt_if_s<- get_tptfv(data_if_s)
mean_tpt_if_mm<- get_tptfv(data_if_mm)
mean_tpt_if_u<- get_tptfv(data_if_u)
mean_tpt_if_su<- get_tptfv(data_if_su)

#Sekunden
mean_tptr_if_ss<- get_tptfvr(data_if_ss)
mean_tptr_if_s<- get_tptfvr(data_if_s)
mean_tptr_if_mm<- get_tptfvr(data_if_mm)
mean_tptr_if_u<- get_tptfvr(data_if_u)
mean_tptr_if_su<- get_tptfvr(data_if_su)

## Bereinigt nach Uhrzeit

#Millisekunden
mean_tpt_if_mo <- get_tptfv(data_if_mo)
mean_tpt_if_a <- get_tptfv(data_if_a)
mean_tpt_if_e <- get_tptfv(data_if_e)
mean_tpt_if_n <- get_tptfv(data_if_n)

#Sekunden
mean_tptr_if_mo <- get_tptfvr(data_if_mo)
mean_tptr_if_a <- get_tptfvr(data_if_a)
mean_tptr_if_e <- get_tptfvr(data_if_e)
mean_tptr_if_n <- get_tptfvr(data_if_n)


