#--------------------------------------------------
#ACTIVIDAD 2 - MODULO 2 
#-------------------------------------------------
install.packages("janitor")

###CARGAR PAQUETES 

library(readr)
library(here)
library(dplyr)
library(janitor)
library(stringr)



###LEER EL ARCHIVO 
datos_limpios <- read_csv(here("data", "raw","ayuda_violencia.csv"), locale=locale(encoding="UTF-8"))

#-----------------------------------------------
# 1. Detectar y tratar valores faltantes
#-----------------------------------------------
colSums(is.na(datos_limpios)) #no hay

datos_limpios[!complete.cases(datos_limpios), ] #no hay 

#-----------------------------------------------
# 2. duplicados y variables mal tipificadas.
#----------------------------------------------
datos_limpios[duplicated(datos_limpios),] #no hay 

anyDuplicated(datos_limpios)

summary(datos_limpios)
class(datos_limpios$anio) #numeric
class(datos_limpios$porcentaje_mujeres) #numeric
class(datos_limpios$fecha) #date 

#------------------------------------------------
# 3. Estandarizar nombres de columnas y contenido de variables categóricas.
#------------------------------------------------
clean_names(datos_limpios)

#Limpiar espacios 
datos_limpios$entidad <- str_trim(datos_limpios$entidad)
datos_limpios$entidad_etiqueta <- str_trim (datos_limpios$entidad_etiqueta)

#Guardar dataset final 
write_csv(datos_limpios, here("data", "processed", "datos_mujeres_limpios.csv"))
