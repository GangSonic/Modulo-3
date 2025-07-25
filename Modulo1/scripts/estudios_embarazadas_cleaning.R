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

##Leer datos 
datos_clean <- read_csv(here("data", "raw","embarazadas_conalep.csv"), locale=locale(encoding="UTF-8"))

#-----------------------------------------------
# 1. Detectar y tratar valores faltantes
#-----------------------------------------------
colSums(is.na(datos_clean)) #no hay

datos_clean[!complete.cases(datos_clean), ] #no hay 

#-----------------------------------------------
# 2. duplicados y variables mal tipificadas.
#----------------------------------------------
datos_clean[duplicated(datos_clean),] #no hay 

anyDuplicated(datos_clean)

summary(datos_clean)
class(datos_clean$clave_entidad) #numeric
class(datos_clean$anio) #numeric
class(datos_clean$numero_adolescentes_embarazadas_continuan_estudios) #numeric 

#------------------------------------------------
# 3. Estandarizar nombres de columnas y contenido de variables categóricas.
#------------------------------------------------
clean_names(datos_clean)

#Limpiar espacios 
datos_clean$entidad <- str_trim(datos_clean$entidad)
datos_clean$periodo <- str_trim (datos_clean$periodo)

#Guardar dataset final 
write_csv(datos_clean, here("data", "processed", "datos_embarazada_limpios.csv"))

