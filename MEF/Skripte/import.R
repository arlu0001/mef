# Datensatz importieren

library(readr)
import_data <-function(){
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
}
