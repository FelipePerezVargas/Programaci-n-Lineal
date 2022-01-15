########################################################
####                                                ####
####            EJERCICIOS DE MINIMIZACIÓN          ####
####                                                ####
########################################################

# Ejercicio 1

# En una granja se  maneja una dieta para engordar,
# con una composición mínima de 15 unidades de una sustancia A 
# y otras 15 de una sustancia B.
# 
# En el mercado sólo se encuentra dos clases de compuestos: 
# el tipo X con una composición de una unidad de A y 5 de B, 
# y el otro tipo, Y, con una composición de cinco unidades de A
# y una de B. El precio del tipo X es de 10 pesos y del tipo 
# Y es de 30 pesos.
#  
# ¿Qué cantidades se deben de comprar de cada tipo para cubrir 
# las necesidades para que el costo sea mínimo?

# Una solución factible es aquella para la que todas las restricciones
#se satisfacen.
# Una solución no factible es una solución para la que al menos
#una restricción se viola.

# Ecuación 1
# x1+5x2>=15   
#                  | x1 | x2 |
#Primera coordenada| 0  | 3  |Intercepto  Primera solución
#segunda coordenada| 15 | 0  |Raiz        Segunda solución
  

# Ecuación 2
# 5x1+x2>=15 
#                  | x1 | x2 |
#Primera coordenada| 0  | 15 |Intercepto  Tercera Solución
#segunda coordenada| 3  | 0  |Raiz        Cuarta Solución


# Z=10x1+30x2 Función objetivo  Minimizar
# Resulta de resolver el sistema de ecuaciones 
#  x1+5x2=15
# 5x1+ x2=15

# Quinta Solución del sistema 
# x1=5/2 y x2=5/2        



# Se procede a evaluar realizar una tabla con los resultados 
# de la sustitución de cada una de las soluciones 
# para encontrar la solución que nos minimiza el sistema, esto 
# se logra sustiuyendo x1 y x2 en la función objetivo


# La función objetivo es Z=10x1+30x2  

# Solución 1
#                  | x1 | x2 |
#Primera coordenada| 0  | 3  |Intercepto
# Evaluar en la función objetivo 
# Z1<-10x1+30x2
# Z1<-10*0+30*3=90
# Solución 2
#                  | x1 | x2 |
#segunda coordenada| 15 | 0  |Raiz
# Z2<-10x1+30x2
# Z2<-10*15+30*0=150

# Solución 3
# Ecuación 2
#                  | x1 | x2 |
#Primera coordenada| 0  | 15 |Intercepto
# Z3<-10x1+30x2= 450
# Z3<-10*0+30*15=450
# Solución 4
# Ecuación 2
#                  | x1 | x2 |
#segunda coordenada| 3  | 0  |Raiz
# Z4<-10x1+30x2=30
# Z4<-10*3+30*0=30
# Solución 5
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
# x1+5x2>=15 Restricción 1
# 5x1+x2>=15 Restricción 2
# 
# Primera coordenada| 0  | 3  |Intercepto
# segunda coordenada| 15 | 0  |Raiz
# Primera coordenada| 0  | 15 |Intercepto
# segunda coordenada| 3  | 0  |Raiz
# x1<-2.5 
# x2<-2.5
#              |  x1   | x2 | Z   | cumple |
# -----------------------------------------
# Solución 1   |  0    |  3 | 90  |  no    |
# ------------------------------------------
# Solución 2   | 15    |  0 | 150 |  si    |
# ------------------------------------------
# Solución 3   |   0   | 15 | 450 |  si    | ?????? Maximiza ??????
# ------------------------------------------
# Solución 4   |  3    | 0  |  30 |  no    |
# ------------------------------------------
# Solución 5   |2.5    |2.5 | 100 |  si    | ?????? Minimiza ?????? 
# ------------------------------------------
# Comprobar si la solución propuesta respeta las restricciones
# Solución 1
# x1+5x2>=15   0+5*3>=15        15>=15   Restricción 1
# 5x1+x2>=15   5*0+3*1>= 15      3>=15   Restricción 2
# Solución 2
# x1+5x2>=15 15+5*0>=15  15 >= 15     Restricción 1
# 5x1+x2>=15 5*15+0>=15  75 >= 15     Restricción 2
# Solución 3
# x1+5x2>=15    75>=15 Restricción 1
# 5x1+x2>=15    15>=15 Restricción 2
# Solución 4
# x1+5x2>=15    3>=15   Restricción 1
# 5x1+x2>=15    15>=15  Restricción 2
# Solución 5 
# x1+5x2>=15    15>=15 Restricción 1
# 5x1+x2>=15    15>=15 Restricción 2


# Una solución factible es aquella para la que todas las restricciones
#se satisfacen.
# Una solución no factible es una solución para la que al menos
#una restricción se viola.

  #                  |  x1   | x2   |  Z   |  Cumple |
  #                  ---------------------------------
  # Primera Solucion |   0   |  3   |  90  |    no   |
  #                  ---------------------------------
  # Segunda Solución |  15   |  0   | 150  |    si   |
  #                  ---------------------------------
  # Tercera Solución |  0    |  15  | 450  |    si   |
  #                  ---------------------------------
  # Cuarta Solución  |  3    | 0    |  30  |    no   | 
  #                  ---------------------------------
  # Qinta Solución   | 2.5   | 2.5  | 100  |    si   | ?????? Minimiza ??????
                   # ---------------------------------
# Una vez que encontramos las cinco soluciones de Z 
# sustituimos cada una de la soluciones en las restricciones 
# del modelo para saber si dicha solución respecta las rectricciones
# Validar las restricciones de la solución 1  
#   #  x1+5x2>=15
#       0+5*3>=15 
#   # 5x1+ x2>=15
#     5*0+3>=15    
# # Validar las restricciones de la solución  2 
#     #  x1+5x2>=15
#     15+5*0>=15 
#     # 5x1+ x2>=15
#     5*15+0>=15        
# # Validar las restricciones de la solución  3 
#     #  x1+5x2>=15
#     0+5*15>=15 
#     # 5x1+ x2>=15
#     5*0+15>=15 
# # Validar las restricciones de la solución  4 
#     #  x1+5x2>=15
#     3+5*0>=15 
#     # 5x1+ x2>=15
#     5*3+0>=15     
# # Validar las restricciones de la solución  5 
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
# Segunda Solución |  15   |  0   | 150  |    si   |Raíz
#                  ---------------------------------
#Ecuación 1
#  x1+5x2>=15
x11<-seq(0,15, by=0.1);x11
x21<-(15-x11)/5;x21
plot(x11, x21, col='violetred', type='l',
     xlab = 'Alimento Tipo X (Ua)', ylab = 'Alimento Tipo Y (Ua)',
     main = 'Optimización del Alimento X y Y',
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











# Ecuación 2
# 5x1+ x2>=15
x12<-seq(0,3,by=0.1)
x22<-15-5*x12
# el comando ylim=c(0,15) sirve para graficar los límites en el eje y
# el comando lwd me sirve para modificar el grueso de la línea 
# El comando main me sirve para poner el nombre del gráfico main='nombre de la gráfica'
plot(x11,x21, col='red', type='l',ylim=c(0,15), lwd=3,
     main='Gráfico de Optimización de los Alimentos X y Y',
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
points(15,0, col='black', pch=16) # Raíz de la ec 1
points(3,0, col='black', pch=16)  # Raíz de la ec 2
points(2.5,2.5, col='blue', pch=16)  # Solución de las restricciones


# Un expendio prepara carne para hamburguesa con una
# combinación de carne molida de res y carne  molida de cerdo.
# La carne de res contiene 80% de carne y 20% de grasa,
# y le cuesta al expendio $80 por libra; la carne de cerdo contiene
# 68% de carne y 32% de grasa, y cuesta $60 por libra. ¿Qué cantidad
# de cada tipo de carne debe emplearse en cada libra
# de carne para hamburguesa, si se desea minimizar el costo y
# mantener el contenido de grasa no mayor de 25%?
# Función objetivo 
Z<-80x1+60x2  
# Ecuación para la grasa
0.20x1+0.32x2<=0.25
# Ecuación para que la carne de hamburguesa
x1+x2=1
# Ecuación 1 Grasa
# 0.20x1+0.32x2<=0.25
#                  |  x1     |   x2   |
#Primera coordenada| 0       | 0.78   | Intercepto Solución 1
#segunda coordenada| 1.25    | 0      | Raiz       Solución 2
# Ecuación 2
#                  | x1   | x2 |
#Primera coordenada| 0    | 1  | Intercepto        Solución 3
#segunda coordenada| 1    | 0  | Raiz              Solución 4
# Solución del sistema 12                          Solución 5
# 0.20x1+0.32x2<=0.25 Ecuación 1
# x1+x2=1           Ecuación 3
# x1<-0.58 #libras 
# x2<-0.42 #libras
# La solución del sistema tiene tres restricciones
Z<-80x1+60x2
Solución 1
# 0.20x1+0.32x2<=0.25 Restricción 1
  0.20*0+0.32*0.78<=0.25
#   x1+x2=1   Restricción 2
   0+0.78=1
Solución 2   
# 0.20x1+0.32x2<=0.25 Restricción 1
   0.2*1.25+0.32*0<=0.25
   0.25<=
#   x1+x2=1   Restricción 2
   1.25+0=1 
Solución 3  
   # 0.20x1+0.32x2<=0.25 Restricción 1
   0.2*0+0.32*1<=0.25
   0.32<=0.25
     #   x1+x2=1   Restricción 2
     0+1=1   
Solución 4 
 # 0.20x1+0.32x2<=0.25 Restricción 1
 0.2*1+0.32*0<=0.25
 0.2<=0.25
 #   x1+x2=1   Restricción 2
 1+0=1    
Solución 5 
 # 0.20x1+0.32x2<=0.25 Restricción 1
 0.2*0.58+0.32*0.42<=0.25
 0.25<=0.25
 #   x1+x2=1   Restricción 2
 0.58+0.42=1     
 #                 |  x1   | x2    |  Z   |  Cumple |
#                  ---------------------------------
# Primera Solución |   0   |0.78   | 46.8 |   no    |
#                  ---------------------------------
# Segunda Solución |  1.25 |  0    |  100 |   no    |
#                  ----------------------------------
# Tercera Solución |  0    |  1    |  60  |   no    |
#                  ----------------------------------
# Cuarta Solución  |  1    |  0    |  80  |   si    | 
#                  ----------------------------------
# Qinta Solución   | 0.58  | 0.42  | 71.7 |   si    | ?????? Minimiza ??????
#                  ----------------------------------

Tarea 3 Construir la tabla para cada uno de los casos resueltos en clase 
 
# Solución 1
# Ecuación 1
#                  |  x1     |   x2   |
#Primera coordenada| 0       | 0.78   | Intercepto
Z1<-80x1+60x2 
# Solución 2
# Ecuación 1
#                  |  x1     |   x2   |
#segunda coordenada| 1.25    | 0      | Raiz
Z2<-80x1+60x2 
#Solución 3
# Ecuación 3
#                  | x1   | x2 |
#Primera coordenada| 0    | 1  | Intercepto
Z3<-80x1+60x2 
#Solución 4
# Ecuación 3
#                  | x1   | x2 |
#segunda coordenada| 1    | 0  | Raiz
Z4<-80x1+60x2 
# Solución 5, lo solución del sistema de ecuaciones
library(matlib)
#  0.2x1+0.32x2<=0.25 Ecuación 1
#     x1+    x2 =1    Ecuación 2
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
# como mínimo una superficie de 480 metros cuadrados. Puede comprar
# la pintura a dos proveedores, A y B. El proveedor A le ofrece una
# pintura con un rendimiento de seis metros cuadrados por kg y a un 
# precio de un dolar por kg. La pintuira del proveedor B tiene un precio 
# de 1.2 dolares y un rendimiento de 8 metros cuadrados.
# Ningún proveedor le puede proporcionar mas de 75 kg y el presupuesto
# máximo del  departamento es de 120. Calcula la cantidad de pintura que 
# el departamento tiene  que comprar a cada proveedor para obtener el 
# mínimo costo. Calcule el  costo mínimo.



#Ahora que sabemos desarrollar modelos y solucionarlos 
#vamos a analizar las posibles soluciones que pueden 
#resultar del análisis de las posibles soluciones

# Ahora analizaremos detalle a detalle cada una de las 
#soluciones posibles y definir cuales son factibles con respecto
#a la máximización o minimización de la función objetivo.


library(plotly)
m <- highlight_key(mpg)
p <- ggplot(m, aes(displ, hwy)) + geom_point()
gg <- highlight(ggplotly(p), "plotly_selected")
crosstalk::bscols(gg, DT::datatable(m))

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")
