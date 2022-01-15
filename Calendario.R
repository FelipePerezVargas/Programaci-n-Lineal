####################################################
#### Como hacer un calendario personalizado en R ###
####################################################
rm(list=ls())
# Primero cargamos la librery ggplot 2 y calendR
install.packages("calendR")

library(calendR)
library(ggplot2)
# Generamos un calendario super básico con el tiempo local
calendR()

#Podemos especificar el año del calendario deseado 

calendR(year=2021)

# La configuración del calendario en el programa son los días lunes
# pero podemos iniciarlo el día que sea necesario
# Lo haremos que inicie en lunes 

calendR(year = 2021,start = "M")


# POdemos remarcar los fines de semana 

calendR(year = 2025, start = "M", special.days = "weekend")


#Podemos marcar días especiales 

calendR(year = 2021,
        start = "M",
        special.days = c(1, 32, 74, 91, 92,   # Días para colorear
                         93, 94, 300, 342),
        special.col = "lightblue",             # Color de los días especificados
        low.col = "gray")    

# Podemos realizar uno a la medida

# Vector de NA de la misma longitud que número de días del año
eventos <- rep(NA, 365)

# Establecemos los eventos en los días correspondientes
eventos[252] <- "Cumpleaños"
eventos[c(1:5, 359:365)] <- "Vacaciones Navidad" 
eventos[213:228] <- "Vacaciones verano"

# Creamos el calendario con una leyenda
calendR(year = 2025,
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "Mis Fechas", low.col = "gray")     # Título de la leyenda

# Podemos realizar el cambio de orientaciión para que lo podamos imprimir
calendR(orientation = "portrait",
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "Mis Fechas", low.col = "gray")

# Podemos hacer un calendari mensual 

calendR(year = 2021, month = 2,start = "M")


#Agregamos eventos a nuestro calendario mensual 

calendR(year = 2021, month = 3,
        special.days = c(1, 9, 12, 23, 28), # Días con color
        special.col = "#bfe2f2", # Color de los eventos
        low.col = "white", ,start = "M")       # Color del resto de días





