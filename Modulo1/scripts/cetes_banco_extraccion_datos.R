#- descarga de json  
library(httr)
library(jsonlite)
library(here)

library(readr)
library(here)
library(dplyr)

#url <- "https://www.banxico.org.mx/SieAPIRest/service/v1/series/CF107/datos/oportuno"


token <- "2fa24dfc6887beb7e0ca8dc2e92a3f15369615295f66c5b3408f4376248189cf"

# Código de la serie para Cetes 28 días: SF43936
url <- "https://www.banxico.org.mx/SieAPIRest/service/v1/series/SF43936/datos"

res <- GET(
  url,
  add_headers("Bmx-Token" = token)
)

data <- content(res, as = "text", encoding = "UTF-8")
json <- fromJSON(data)
str(json, max.level = 3)
print(json)

df <- json$bmx$series$datos[[1]]

# Guarda a CSV
write.csv(df, here("data", "raw", "CF107_Cetes_28dias.csv"), row.names = FALSE)

#here("data", "processed", "datos_mujeres_procesados.csv")
head(df)



#-----------------------------------------------------------------------------
#LEER LOS DATOS 
#---------------------------------------------------------------------------
###LEER EL ARCHIVO 
guess_encoding(here("data", "raw", "CF107_Cetes_28dias.csv"))

datos_banco <- read_csv(here("data", "raw","CF107_Cetes_28dias.csv"), locale=locale(encoding="UTF-8"))




