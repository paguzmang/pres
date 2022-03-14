
# Mar 2021
# Simulacion de tabla con edades para poner ejercicio de asignacion
# bajo un DBCA.

# Paquetes
library(tidyverse)
library(randomNames)
library(openxlsx)

# Simulacion de datos
set.seed(2956)
sujetos <- tibble(
  sexo   = sample(c(0,1), size = 15, replace = T),
  nombre = randomNames(n = 15, gender = sexo, ethnicity = 4, name.sep = "_"),
  genero = ifelse(sexo == 0, "hombre", "mujer"),
  edad   = sample(
    rep(c(17,25,35,45,55), each = 3) + round(runif(n = 15, min = -2.4, max = 2.5))
  )
) %>% select(-sexo)

arrange(sujetos, edad)
xtabs(~ cut(edad, br = c(10,20,30,40,50,60)), data = sujetos)

# Se exportan los datos
write.xlsx(x = sujetos, file = "datos/sujetos_edad.xlsx")
