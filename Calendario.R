####################################################
#### Como hacer un calendario personalizado en R ###
####################################################
rm(list=ls())
# Primero cargamos la librery ggplot 2 y calendR
install.packages("calendR")

library(calendR)
library(ggplot2)
# Generamos un calendario super b�sico con el tiempo local
calendR()

#Podemos especificar el a�o del calendario deseado 

calendR(year=2021)

# La configuraci�n del calendario en el programa son los d�as lunes
# pero podemos iniciarlo el d�a que sea necesario
# Lo haremos que inicie en lunes 

calendR(year = 2021,start = "M")


# POdemos remarcar los fines de semana 

calendR(year = 2025, start = "M", special.days = "weekend")


#Podemos marcar d�as especiales 

calendR(year = 2021,
        start = "M",
        special.days = c(1, 32, 74, 91, 92,   # D�as para colorear
                         93, 94, 300, 342),
        special.col = "lightblue",             # Color de los d�as especificados
        low.col = "gray")    

# Podemos realizar uno a la medida

# Vector de NA de la misma longitud que n�mero de d�as del a�o
eventos <- rep(NA, 365)

# Establecemos los eventos en los d�as correspondientes
eventos[252] <- "Cumplea�os"
eventos[c(1:5, 359:365)] <- "Vacaciones Navidad" 
eventos[213:228] <- "Vacaciones verano"

# Creamos el calendario con una leyenda
calendR(year = 2025,
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "Mis Fechas", low.col = "gray")     # T�tulo de la leyenda

# Podemos realizar el cambio de orientacii�n para que lo podamos imprimir
calendR(orientation = "portrait",
        special.days = eventos,
        special.col = c("pink", "lightblue", "lightgreen"), # Colores
        legend.pos = "right",  # Leyenda a la derecha
        legend.title = "Mis Fechas", low.col = "gray")

# Podemos hacer un calendari mensual 

calendR(year = 2021, month = 2,start = "M")


#Agregamos eventos a nuestro calendario mensual 

calendR(year = 2021, month = 3,
        special.days = c(1, 9, 12, 23, 28), # D�as con color
        special.col = "#bfe2f2", # Color de los eventos
        low.col = "white", ,start = "M")       # Color del resto de d�as





