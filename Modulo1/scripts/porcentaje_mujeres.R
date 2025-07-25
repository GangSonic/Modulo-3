###CARGAR PAQUETES 

library(readr)
library(here)
library(dplyr)

###LEER EL ARCHIVO 
guess_encoding(here("data", "raw", "ayuda_violencia.csv"))

datos_csv <- read_csv(here("data", "raw","ayuda_violencia.csv"), locale=locale(encoding="UTF-8"))
glimpse(datos_csv)
summary(datos_csv)

###Datos procesados filtrados 
datos_procesados <- datos_csv %>%
  filter(!is.na(entidad))

##Datos procesados 
write_csv(datos_procesados, here("data", "processed", "datos_mujeres_procesados.csv"))

###Visualizacion de datos 
head(datos_procesados)
View(datos_procesados)

###DOCUMENTACION 
# Origen: Instituto Nacional de Estadistica y Logica (INEGI)
# URL: https://www.datos.gob.mx/dataset/violencia_contra_mujeres/resource/b6cccc49-2e67-4e23-b720-68dcdc99e301
# Fecha de desacarga: 19/07/ 2025
# Metodo lectura: read:csv, delimitador ",", codificacion UTF-8
#
