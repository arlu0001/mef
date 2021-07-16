all_tpt <- function(){
  
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
}