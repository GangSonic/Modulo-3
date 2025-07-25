##Paquetes 
library(readr)
library(here)
library(dplyr)

###Cargar datos de la web 
url <- "https://docs.google.com/spreadsheets/d/1EjzHeSa3tcNtuhvrKPPRAF7-ohE6aluPLR6JMA1NYHM/export?format=csv&gid=207045684"
datos <- read_csv(url)

write_csv(datos, here("data", "raw", "embarazadas_conalep.csv"))

guess_encoding(here("data", "raw", "embarazadas_conalep.csv"))

datos_inter <- read_csv(
  here("data", "raw", "embarazadas_conalep.csv"),
  locale = locale(encoding = "UTF-8")
)


###Datos procesados filtrados 
datos_proce <- datos_inter %>%
  filter(!is.na(entidad))

##Datos procesados 
write_csv(datos_proce, here("data", "processed", "datos_embarazadas_procesados.csv"))

###Visualizacion de datos 
head(datos_proce)
View(datos_proce)

###DOCUMENTACION 
# Origen: Instituto Nacional de Estadistica y Logica (INEGI)
# URL: https://docs.google.com/spreadsheets/d/1EjzHeSa3tcNtuhvrKPPRAF7-ohE6aluPLR6JMA1NYHM/edit?gid=207045684#gid=207045684
# Fecha de desacarga: 19/07/ 2025
# Metodo lectura: read:csv, delimitador ",", codificacion UTF-8
#




#https://docs.google.com/spreadsheets/d/1EjzHeSa3tcNtuhvrKPPRAF7-ohE6aluPLR6JMA1NYHM/edit?usp=sharing
# convertido a csv: https://docs.google.com/spreadsheets/d/1EjzHeSa3tcNtuhvrKPPRAF7-ohE6aluPLR6JMA1NYHM/export?format=csv&gid=207045684
