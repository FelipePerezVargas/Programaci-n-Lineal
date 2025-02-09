########################################################
####                                                ####
####            EJERCICIOS DE MINIMIZACI�N          ####
####                                                ####
########################################################

# Ejercicio 1

# En una granja se  maneja una dieta para engordar,
# con una composici�n m�nima de 15 unidades de una sustancia A 
# y otras 15 de una sustancia B.
# 
# En el mercado s�lo se encuentra dos clases de compuestos: 
# el tipo X con una composici�n de una unidad de A y 5 de B, 
# y el otro tipo, Y, con una composici�n de cinco unidades de A
# y una de B. El precio del tipo X es de 10 pesos y del tipo 
# Y es de 30 pesos.
#  
# �Qu� cantidades se deben de comprar de cada tipo para cubrir 
# las necesidades para que el costo sea m�nimo?

# Una soluci�n factible es aquella para la que todas las restricciones
#se satisfacen.
# Una soluci�n no factible es una soluci�n para la que al menos
#una restricci�n se viola.

# Ecuaci�n 1
# x1+5x2>=15   
#                  | x1 | x2 |
#Primera coordenada| 0  | 3  |Intercepto  Primera soluci�n
#segunda coordenada| 15 | 0  |Raiz        Segunda soluci�n
  

# Ecuaci�n 2
# 5x1+x2>=15 
#                  | x1 | x2 |
#Primera coordenada| 0  | 15 |Intercepto  Tercera Soluci�n
#segunda coordenada| 3  | 0  |Raiz        Cuarta Soluci�n


# Z=10x1+30x2 Funci�n objetivo  Minimizar
# Resulta de resolver el sistema de ecuaciones 
#  x1+5x2=15
# 5x1+ x2=15

# Quinta Soluci�n del sistema 
# x1=5/2 y x2=5/2        



# Se procede a evaluar realizar una tabla con los resultados 
# de la sustituci�n de cada una de las soluciones 
# para encontrar la soluci�n que nos minimiza el sistema, esto 
# se logra sustiuyendo x1 y x2 en la funci�n objetivo


# La funci�n objetivo es Z=10x1+30x2  

# Soluci�n 1
#                  | x1 | x2 |
#Primera coordenada| 0  | 3  |Intercepto
# Evaluar en la funci�n objetivo 
# Z1<-10x1+30x2
# Z1<-10*0+30*3=90
# Soluci�n 2
#                  | x1 | x2 |
#segunda coordenada| 15 | 0  |Raiz
# Z2<-10x1+30x2
# Z2<-10*15+30*0=150

# Soluci�n 3
# Ecuaci�n 2
#                  | x1 | x2 |
#Primera coordenada| 0  | 15 |Intercepto
# Z3<-10x1+30x2= 450
# Z3<-10*0+30*15=450
# Soluci�n 4
# Ecuaci�n 2
#                  | x1 | x2 |
#segunda coordenada| 3  | 0  |Raiz
# Z4<-10x1+30x2=30
# Z4<-10*3+30*0=30
# Soluci�n 5
# 
# x1<-2.5 
# x2<-2.5
# Z5<-10x1+30x2=100
# Z5<-10*2.5+30*2.5=100

# Paso 6  Encontrar las posibles soluciones 
# Paso 7 Evaluar las posibles soluciones considerando las restricciones 
# del modelo
#  Para lograr el paso 7 debemos de evaluar cada una de las posibles 
# soluciones y comporbar que respeta las restricciones
# x1+5x2>=15 Restricci�n 1
# 5x1+x2>=15 Restricci�n 2
# 
# Primera coordenada| 0  | 3  |Intercepto
# segunda coordenada| 15 | 0  |Raiz
# Primera coordenada| 0  | 15 |Intercepto
# segunda coordenada| 3  | 0  |Raiz
# x1<-2.5 
# x2<-2.5
#              |  x1   | x2 | Z   | cumple |
# -----------------------------------------
# Soluci�n 1   |  0    |  3 | 90  |  no    |
# ------------------------------------------
# Soluci�n 2   | 15    |  0 | 150 |  si    |
# ------------------------------------------
# Soluci�n 3   |   0   | 15 | 450 |  si    | ?????? Maximiza ??????
# ------------------------------------------
# Soluci�n 4   |  3    | 0  |  30 |  no    |
# ------------------------------------------
# Soluci�n 5   |2.5    |2.5 | 100 |  si    | ?????? Minimiza ?????? 
# ------------------------------------------
# Comprobar si la soluci�n propuesta respeta las restricciones
# Soluci�n 1
# x1+5x2>=15   0+5*3>=15        15>=15   Restricci�n 1
# 5x1+x2>=15   5*0+3*1>= 15      3>=15   Restricci�n 2
# Soluci�n 2
# x1+5x2>=15 15+5*0>=15  15 >= 15     Restricci�n 1
# 5x1+x2>=15 5*15+0>=15  75 >= 15     Restricci�n 2
# Soluci�n 3
# x1+5x2>=15    75>=15 Restricci�n 1
# 5x1+x2>=15    15>=15 Restricci�n 2
# Soluci�n 4
# x1+5x2>=15    3>=15   Restricci�n 1
# 5x1+x2>=15    15>=15  Restricci�n 2
# Soluci�n 5 
# x1+5x2>=15    15>=15 Restricci�n 1
# 5x1+x2>=15    15>=15 Restricci�n 2


# Una soluci�n factible es aquella para la que todas las restricciones
#se satisfacen.
# Una soluci�n no factible es una soluci�n para la que al menos
#una restricci�n se viola.

  #                  |  x1   | x2   |  Z   |  Cumple |
  #                  ---------------------------------
  # Primera Solucion |   0   |  3   |  90  |    no   |
  #                  ---------------------------------
  # Segunda Soluci�n |  15   |  0   | 150  |    si   |
  #                  ---------------------------------
  # Tercera Soluci�n |  0    |  15  | 450  |    si   |
  #                  ---------------------------------
  # Cuarta Soluci�n  |  3    | 0    |  30  |    no   | 
  #                  ---------------------------------
  # Qinta Soluci�n   | 2.5   | 2.5  | 100  |    si   | ?????? Minimiza ??????
                   # ---------------------------------
# Una vez que encontramos las cinco soluciones de Z 
# sustituimos cada una de la soluciones en las restricciones 
# del modelo para saber si dicha soluci�n respecta las rectricciones
# Validar las restricciones de la soluci�n 1  
#   #  x1+5x2>=15
#       0+5*3>=15 
#   # 5x1+ x2>=15
#     5*0+3>=15    
# # Validar las restricciones de la soluci�n  2 
#     #  x1+5x2>=15
#     15+5*0>=15 
#     # 5x1+ x2>=15
#     5*15+0>=15        
# # Validar las restricciones de la soluci�n  3 
#     #  x1+5x2>=15
#     0+5*15>=15 
#     # 5x1+ x2>=15
#     5*0+15>=15 
# # Validar las restricciones de la soluci�n  4 
#     #  x1+5x2>=15
#     3+5*0>=15 
#     # 5x1+ x2>=15
#     5*3+0>=15     
# # Validar las restricciones de la soluci�n  5 
#     #  x1+5x2>=15
#     2.5+5*2.5>=15 
#     # 5x1+ x2>=15
#     5*2.5+2.5>=15     
    
library(matlib)    
A<-matrix(c(1,5,
            5,1), ncol=2,nrow = 2, byrow = TRUE)  
b<-c(15,15)
plotEqn(A,b)
solve(A,b)

#                  |  x1   | x2   |  Z   |  Cumple |
#                  ---------------------------------
# Primera Solucion |   0   |  3   |  90  |    no   |Intercepto
#                  --------------------------------- 
# Segunda Soluci�n |  15   |  0   | 150  |    si   |Ra�z
#                  ---------------------------------
#Ecuaci�n 1
#  x1+5x2>=15
x11<-seq(0,15, by=0.1);x11
x21<-(15-x11)/5;x21
plot(x11, x21, col='violetred', type='l',
     xlab = 'Alimento Tipo X (Ua)', ylab = 'Alimento Tipo Y (Ua)',
     main = 'Optimizaci�n del Alimento X y Y',
     lwd=2.5)
abline(h=0, v=0, col='wheat3', lty=3)
points(0,3, col='seagreen', pch=16)
points(15,0, col='seagreen', pch=16)
points(0,0, col='seagreen', pch=16)
points(5,1, col='royalblue4', pch=16)
points(10,2.5, col='red4', pch=16)
points(1,2.8, col='purple4', pch=16)
polygon(x = c(0,0,1, 1),                    
        y = c(0,1,1, 0),                      
        col = "#1b98e0",border = "violetred", lwd = 5) 











# Ecuaci�n 2
# 5x1+ x2>=15
x12<-seq(0,3,by=0.1)
x22<-15-5*x12
# el comando ylim=c(0,15) sirve para graficar los l�mites en el eje y
# el comando lwd me sirve para modificar el grueso de la l�nea 
# El comando main me sirve para poner el nombre del gr�fico main='nombre de la gr�fica'
plot(x11,x21, col='red', type='l',ylim=c(0,15), lwd=3,
     main='Gr�fico de Optimizaci�n de los Alimentos X y Y',
     xlab='Alimento X (Kg)', ylab = 'Alimento Y (Kg)')
lines(x12, x22, col='green', type='l',  lwd=3)
polygon(x = c(0, 0,2.5,3),                    
        y = c(0, 3,2.5,0),                      
        col = "#1b98e0") #,border = "red", lwd = 5
polygon(x = c(0, 0,2.5),                    
        y = c(3, 15,2.5),                      
        col =  "#d94800") #,border = "red", lwd = 5
polygon(x = c( 3,2.5,15),                    
        y = c( 0,2.5,0),                      
        col = "violet") #,border = "red", lwd = 5
polygon(x = c(2.5, 0,15,15),                    
        y = c(2.5, 15,15,0),                      
        col = "yellow") #,border = "red", lwd = 5
abline(v=0, h=0, lty=3, col='gray', lwd=3)
points(0,15, col='chocolate4', pch=0) #Intercepto ec 1
points(0,3, col='coral4', pch='???')  #Intercepto de la ec2
points(15,0, col='black', pch=16) # Ra�z de la ec 1
points(3,0, col='black', pch=16)  # Ra�z de la ec 2
points(2.5,2.5, col='blue', pch=16)  # Soluci�n de las restricciones


# Un expendio prepara carne para hamburguesa con una
# combinaci�n de carne molida de res y carne  molida de cerdo.
# La carne de res contiene 80% de carne y 20% de grasa,
# y le cuesta al expendio $80 por libra; la carne de cerdo contiene
# 68% de carne y 32% de grasa, y cuesta $60 por libra. �Qu� cantidad
# de cada tipo de carne debe emplearse en cada libra
# de carne para hamburguesa, si se desea minimizar el costo y
# mantener el contenido de grasa no mayor de 25%?
# Funci�n objetivo 
Z<-80x1+60x2  
# Ecuaci�n para la grasa
0.20x1+0.32x2<=0.25
# Ecuaci�n para que la carne de hamburguesa
x1+x2=1
# Ecuaci�n 1 Grasa
# 0.20x1+0.32x2<=0.25
#                  |  x1     |   x2   |
#Primera coordenada| 0       | 0.78   | Intercepto Soluci�n 1
#segunda coordenada| 1.25    | 0      | Raiz       Soluci�n 2
# Ecuaci�n 2
#                  | x1   | x2 |
#Primera coordenada| 0    | 1  | Intercepto        Soluci�n 3
#segunda coordenada| 1    | 0  | Raiz              Soluci�n 4
# Soluci�n del sistema 12                          Soluci�n 5
# 0.20x1+0.32x2<=0.25 Ecuaci�n 1
# x1+x2=1           Ecuaci�n 3
# x1<-0.58 #libras 
# x2<-0.42 #libras
# La soluci�n del sistema tiene tres restricciones
Z<-80x1+60x2
Soluci�n 1
# 0.20x1+0.32x2<=0.25 Restricci�n 1
  0.20*0+0.32*0.78<=0.25
#   x1+x2=1   Restricci�n 2
   0+0.78=1
Soluci�n 2   
# 0.20x1+0.32x2<=0.25 Restricci�n 1
   0.2*1.25+0.32*0<=0.25
   0.25<=
#   x1+x2=1   Restricci�n 2
   1.25+0=1 
Soluci�n 3  
   # 0.20x1+0.32x2<=0.25 Restricci�n 1
   0.2*0+0.32*1<=0.25
   0.32<=0.25
     #   x1+x2=1   Restricci�n 2
     0+1=1   
Soluci�n 4 
 # 0.20x1+0.32x2<=0.25 Restricci�n 1
 0.2*1+0.32*0<=0.25
 0.2<=0.25
 #   x1+x2=1   Restricci�n 2
 1+0=1    
Soluci�n 5 
 # 0.20x1+0.32x2<=0.25 Restricci�n 1
 0.2*0.58+0.32*0.42<=0.25
 0.25<=0.25
 #   x1+x2=1   Restricci�n 2
 0.58+0.42=1     
 #                 |  x1   | x2    |  Z   |  Cumple |
#                  ---------------------------------
# Primera Soluci�n |   0   |0.78   | 46.8 |   no    |
#                  ---------------------------------
# Segunda Soluci�n |  1.25 |  0    |  100 |   no    |
#                  ----------------------------------
# Tercera Soluci�n |  0    |  1    |  60  |   no    |
#                  ----------------------------------
# Cuarta Soluci�n  |  1    |  0    |  80  |   si    | 
#                  ----------------------------------
# Qinta Soluci�n   | 0.58  | 0.42  | 71.7 |   si    | ?????? Minimiza ??????
#                  ----------------------------------

Tarea 3 Construir la tabla para cada uno de los casos resueltos en clase 
 
# Soluci�n 1
# Ecuaci�n 1
#                  |  x1     |   x2   |
#Primera coordenada| 0       | 0.78   | Intercepto
Z1<-80x1+60x2 
# Soluci�n 2
# Ecuaci�n 1
#                  |  x1     |   x2   |
#segunda coordenada| 1.25    | 0      | Raiz
Z2<-80x1+60x2 
#Soluci�n 3
# Ecuaci�n 3
#                  | x1   | x2 |
#Primera coordenada| 0    | 1  | Intercepto
Z3<-80x1+60x2 
#Soluci�n 4
# Ecuaci�n 3
#                  | x1   | x2 |
#segunda coordenada| 1    | 0  | Raiz
Z4<-80x1+60x2 
# Soluci�n 5, lo soluci�n del sistema de ecuaciones
library(matlib)
#  0.2x1+0.32x2<=0.25 Ecuaci�n 1
#     x1+    x2 =1    Ecuaci�n 2
A<- matrix(c(0.2,0.32,
             1,1), ncol = 2, nrow = 2, byrow = TRUE)
b<-c(0.25, 1)
showEqn(A,b)
plotEqn(A,b)
solve(A,b)
# x1<-0.5833333 #libras 
# x2<-0.4166667 #libras
Z5<-80x1+60x2 





########################################################
####                                                ####
####            SOLUCIONES FACTIBLES                ####
####                                                ####
########################################################

# El departamento de acabo automotriz necesita pintura para pintar 
# como m�nimo una superficie de 480 metros cuadrados. Puede comprar
# la pintura a dos proveedores, A y B. El proveedor A le ofrece una
# pintura con un rendimiento de seis metros cuadrados por kg y a un 
# precio de un dolar por kg. La pintuira del proveedor B tiene un precio 
# de 1.2 dolares y un rendimiento de 8 metros cuadrados.
# Ning�n proveedor le puede proporcionar mas de 75 kg y el presupuesto
# m�ximo del  departamento es de 120. Calcula la cantidad de pintura que 
# el departamento tiene  que comprar a cada proveedor para obtener el 
# m�nimo costo. Calcule el  costo m�nimo.



#Ahora que sabemos desarrollar modelos y solucionarlos 
#vamos a analizar las posibles soluciones que pueden 
#resultar del an�lisis de las posibles soluciones

# Ahora analizaremos detalle a detalle cada una de las 
#soluciones posibles y definir cuales son factibles con respecto
#a la m�ximizaci�n o minimizaci�n de la funci�n objetivo.


library(plotly)
m <- highlight_key(mpg)
p <- ggplot(m, aes(displ, hwy)) + geom_point()
gg <- highlight(ggplotly(p), "plotly_selected")
crosstalk::bscols(gg, DT::datatable(m))

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")
