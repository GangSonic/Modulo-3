# Modulo-3

# Módulo 3: Análisis de Continuidad Escolar en Adolescentes Embarazadas

## 📁 Estructura de Archivos

<img width="285" height="303" alt="image" src="https://github.com/user-attachments/assets/44c91c80-7b3b-4f02-a385-df81dc82fc04" />


## 📝 Descripción del Proyecto

Este proyecto reúne las versiones anteriores de mis trabajos para el Módulo 3.  
El objetivo es analizar cuántas adolescentes embarazadas continuaron sus estudios en CONALEP durante el periodo **febrero a julio de 2024**, y comparar esos datos con la población adolescente total por entidad.

## Flujo de Transformación

En el script `transform.R`, se realizó el siguiente procesamiento de datos:

1. **Limpieza inicial del dataset**:
   - Se eliminaron espacios innecesarios y se estandarizaron nombres de columnas.
   - Se configuró el manejo de caracteres especiales.

2. **Separación de periodos**:
   - La columna `periodo` fue separada en dos nuevas columnas: `mes_inicio` y `mes_fin`.

3. **Unión con datos adicionales**:
   - Se utilizó un `left_join` con el archivo `info_entidades.csv` para agregar:
     - Población total por entidad.
     - Población adolescente estimada.
     - Región geográfica.

4. **Creación del dataset final**:
   - El resultado fue guardado como `/data/processed/final_dataset.csv`.

##  Objetivo

El propósito de este flujo es comparar el número de adolescentes embarazadas que continuaron sus estudios con la población adolescente que descidio desertar en cada entidad, facilitando un análisis por región geográfica.



   

