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