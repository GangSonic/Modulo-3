#ACTIVIDAD TRANSVERSAL 3 

###CARGAR PAQUETES 
install.packages("janitor")

###CARGAR PAQUETES 

library(readr)
library(here)
library(dplyr)
library(janitor)
library(stringr)
library(tidyr)


# Leer datos
datos_raw <- read_csv(here("data", "raw", "embarazadas_conalep.csv"), locale = locale(encoding = "UTF-8"))

# Transformación completa
datos_final <- datos_raw %>%
  clean_names() %>%  # estandariza nombres de columnas
  mutate(
    entidad = str_trim(entidad),
    periodo = str_trim(periodo)
  ) %>%
  
  filter(!is.na(numero_adolescentes_embarazadas_continuan_estudios)) %>%  # elimina registros sin datos
  separate(periodo, into = c("mes_inicio", "mes_fin"), sep = "-") %>%
  mutate(
    mes_inicio = str_to_title(mes_inicio),
    mes_fin = str_to_title(mes_fin),
    semestre = case_when(
      mes_inicio %in% c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio") ~ "1er semestre",
      TRUE ~ "2do semestre"
    ),
    region = case_when(
      entidad %in% c("Aguascalientes", "Zacatecas", "San Luis Potosí") ~ "Centro-Norte",
      entidad %in% c("CDMX", "Edomex", "Morelos", "Puebla") ~ "Centro",
      TRUE ~ "Otra región"
    )
  ) %>%
  
  # 
  left_join(
    read_csv(here("data", "raw", "info_entidades.csv")),
    by = "clave_entidad"
  )

# Guardar dataset final
write_csv(datos_final, here("data", "processed", "final_dataset.csv"))






###DOCUMENTACION 
# Origen: Instituto Nacional de Estadistica y Logica (INEGI)
# URL: https://www.datos.gob.mx/dataset/violencia_contra_mujeres/resource/b6cccc49-2e67-4e23-b720-68dcdc99e301
# Fecha de desacarga: 19/07/ 2025
# Metodo lectura: read:csv, delimitador ",", codificacion UTF-8