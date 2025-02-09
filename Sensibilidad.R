library(MASS)
library(matlib)
library(lpSolve)
#   x+  y+   z =70      Ec 1
# 20x+16y+  8z =1280    Ec 2
#   y+  z-0.4x =0       Ec 3

# Para utilizar el paquete matlib tenemos que formar la matriz a resolver
# de la forma Ax=b

# Conformamos nuestra matriz A
A <- matrix(c(   1,  1, 1,  
                20, 16, 8,
              -0.4,  1, 1 ), ncol=3, nrow=3, byrow=TRUE);A

colnames(A) <- paste0('x', 1:3)  #Definimos las variables
b <- c(70, 1280, 0) # Lado derecho de la matriz o el vector columna b
showEqn(A, b)    # Te muestra el sistema de ecuaciones 
plotEqn3d(A,b, ylim=c(-20,20), zlim=c(-10,10), xlim=c(40,50)  )   # Grafica el sistema de ecuaciones incluyendo la soluci�n
solve(A, b, fractions = TRUE) # Resuelve el sistema de ecuaciones en fracciones
echelon(A, b, verbose=TRUE, fractions=TRUE)# Resuelve el sistema de ecuaciones paso a paso


# Resolver usando el c�digo el ejercicio 1  3x3
E1<-matrix(c(1,-1,3,
             5,-4,-4,
             7,-6,2), ncol=3, nrow=3, byrow = TRUE)
inv(E1)


E2<-matrix(c(1,6,4,
             2,4,-1,
             -1,2,5), ncol=3, nrow=3, byrow = TRUE)

inv(E2)

E2<-matrix(c(1,1,1,
             0,1,1,
             0,0,1), ncol=3, nrow=3, byrow = TRUE)

inv(E2)



# Resolver usando el c�digo el ejercicio 2   4x4   











#  maximizar
# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 430
# 3x1 +     + 2x3 <= 460
#  x1 + 4x2 +     <= 420       

#### Resolvemos usando el paquete lpsolve ####
library(lpSolve)
#Maximizamos
Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(430,460,420)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado inlcuyendo el dual  
# Vamos a sistematizar la conclusi�n para que me lo imprima en pantalla #### 
print(paste('El mayor beneficio se obtiene produciendo',sol$solution[1],'trenes',
            sol$solution[2], 'camiones y',  sol$solution[3], 'coches para obtener un 
            beneficio de:',sol$objval, 'unidades monetarias'))
#### Comprobaci�n ####

x1<-sol$solution[1]
x2<-sol$solution[2]
x3<-sol$solution[3]
# Z= 3x1 + 2x2 + 5x3 
Z<-3*x1+2*x2+5*x3;Z
#  x1 + 2x2 +  x3 <= 430
x1+2*x2+x3
# 3x1 +     + 2x3 <= 460
3*x1+2*x3
#  x1 + 4x2 +     <= 420    
x1+4*x2

# Comprobaci�n 
Z<-3*sol$solution[1]+2*sol$solution[2]+5*sol$solution[3];Z



####  Minimizar ####
# z=430y1+460y2+420y3
# 
# y1  + 3y2 +  y3>=3
# 2y1 +     + 4y3>=2
# y1  +  y2 +    >=5

Z <- c(430, 460, 420)
A <- matrix (c(1, 3, 1,
               2, 0, 4,
               1, 2, 0), ncol=3,  nrow=3, byrow=TRUE)
dir <- c(">=", ">=", ">=")
b <- c(3, 2, 5)
sol <-lp("min", Z, A, dir, b,  compute.sens=TRUE)
sol$objval
sol$solution
sol$duals
sol$objective



# Ejercicio 1 ####
# Suponga que TOYCO desea ampliar sus l�neas 
# de ensamble aumentando en 40% la capacidad
# diaria de cada una, hasta 602, 644 y 588 minutos, 
# respectivamente. Usa el an�lisis de sensibilidad
# para determinar los beneficios

# Soluci�n ####


#  maximizar ####

# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 602
# 3x1 +     + 2x3 <= 644
#  x1 + 4x2 +     <= 588       

Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(602, 644, 588)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado inlcuyendo el dual  

print(paste('El mayor beneficio se obtiene produciendo',sol$solution[1],'trenes',
            sol$solution[2], 'camiones y',  sol$solution[3], 'coches para obtener un 
            beneficio de:',sol$objval, 'unidades monetarias con el aumento del 40% de
            tiempo disponible'))




Z<-3*x1+2*x2+5*x3;Z

# Comprobaci�n dual ####
Z<-3*sol$solution[1]+2*sol$solution[2]+5*sol$solution[3];Z


Z <- c(602, 644, 588)
A <- matrix (c(1, 3, 1,
               2, 0, 4,
               1, 2, 0), ncol=3,  nrow=3, byrow=TRUE)
dir <- c(">=", ">=", ">=")
b <- c(3, 2, 5)
sol <-lp("min", Z, A, dir, b,  compute.sens=TRUE)
sol$objval
sol$solution
sol$duals
sol$objective



# 2.- Indique si es mejor asignar la capacidad en exceso de 20 minutos ####
# a la operaci�n 3 que a la operaci�n 2 en lugar de la operaci�n 1

# Primer caso aumentar 20 minutos a la operaci�n 1  ####

#  maximizar
# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 450  # Operaci�n 1
# 3x1 +     + 2x3 <= 460  # Operaci�n 2
#  x1 + 4x2 +     <= 420  # Operaci�n 3     

Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(450,460,420)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado inlcuyendo el dual  

print(paste('Aumentando 20 minutos en proceso 1, los ingresos son',
             sol$objval,'Y se deben
             de producir', sol$solution[1], 'trenes', sol$solution[2], 
            'camiones y ', sol$solution[3], 'coches'))
# Calculamos el sistemas de ecuaciones dual para saber la disposici�n de tiempo
# restante en el proceso de fabricaci�n 
Z <- c(430, 460, 420)
A <- matrix (c(1, 3, 1,
               2, 0, 4,
               1, 2, 0), ncol=3,  nrow=3, byrow=TRUE)
dir <- c(">=", ">=", ">=")
b <- c(3, 2, 5)
sol <-lp("min", Z, A, dir, b,  compute.sens=TRUE)
sol$objval
sol$solution
sol$duals
sol$objective

# �Cuanto ser�a el beneficio si los 20 minutos se distribuyen de manera equitativa entre los 
# procesos  y 2?


# Aumentar 20 minutos al Proceso 2


#  maximizar
# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 430  # Operaci�n 1
# 3x1 +     + 2x3 <= 480  # Operaci�n 2
#  x1 + 4x2 +     <= 420  # Operaci�n 3     

Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(430,480,420)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's

# Aumentar 20 minutos al Proceso 3


#  maximizar
# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 430  # Operaci�n 1
# 3x1 +     + 2x3 <= 460  # Operaci�n 2
#  x1 + 4x2 +     <= 440  # Operaci�n 3     

Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(430,460,440)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's

plotEqn3d(A,b)


print(paste('Aumentando 20 minutos en Proceso 2, los ingresos son',
            sol$objval,'Y se deben
             de producir', sol$solution[1], 'trenes', sol$solution[2], 
            'camiones y ', sol$solution[3], 'coches'))


# Soluci�n pregunta 
# parte a)
#  maximizar
# Z= 3x1 + 2x2 + 5x3 
#  x1 + 2x2 +  x3 <= 430  # Operaci�n 1
# 3x1 +     + 2x3 <= 460  # Operaci�n 2
#  x1 + 4x2 +     <= 420  # Operaci�n 3     

Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(460,500,400)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's

# Soluci�n b) ####
b <- c(500,400,600)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals

# Soluci�n c) ####
b <- c(300,800,200)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's

# Soluci�n d)  ####
b <- c(450,700,350)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's


Z <- c(3, 2, 5)  # Funci�n objetivo
A <- matrix (c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(450,700,350)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's














install.packages(lpSolve)

x1<-sol$solution[1]
x2<-sol$solution[2]
x3<-sol$solution[3]

Z<-3*x1+2*x2+5*x3;Z

# Comprobaci�n 
Z<-3*sol$solution[1]+2*sol$solution[2]+5*sol$solution[3];Z



# Reddy Mikks produce pinturas para interiores y exteriores, M1 y M2. 
# La tabla siguiente proporciona los datos b�sicos del problema.
#                       Ton de materia prima de
#                     ____________________________
#                     Pintura para    Pintura para     Disponibilidad diaria 
#                     exteriores      interiores           m�xima (ton)




# ----------------------------------------------------------------------------
# Materia Prima, M1 |    6         |     4          |           24           |
# ----------------------------------------------------------------------------
# Materia Prima, M1 |    1         |     2          |            6           |
# ----------------------------------------------------------------------------
# Utilidad por ton  |    5         |     4          |                        |
# (miles $)         |              |                |                        |
# ----------------------------------------------------------------------------

# Una encuesta de mercado indica que la demanda diaria de pintura para interiores
# no puede ser mayor que 1 tonelada m�s que la de pintura para exteriores. Tambi�n,
# que la demanda m�xima diaria de pintura para interiores es de 2 toneladas.

# Reddy Mikks desea determinar la mezcla �ptima (la mejor) de productos para exteriores
# y para interiores que maximice la utilidad diaria total.


# El modelo de Reddy Mikks es:

# Maximizar Z=5x1+4x2
# 
# Sujeto a:
# 
#   6x1+4x2<=24      R1
#    x1+2x2<=6       R2
#   -x1+ x2<=1       R3
#        x2<=2       R4

#### Primero tenemos que calcular las soluciones de frontera para cada una de las ecuaciones ####

# Restricci�n 1     6x1+4x2<=24  
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    4    |  0     |  Soluci�n de frontera 1
# -------------------------------- 
# Intercepto |    0    |  6     |  Soluci�n de frontera 2    
#--------------------------------
# 
# Restricci�n 2     x1+2x2<=6
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    6    |  0     |  Soluci�n de frontera 3
# -------------------------------- 
# Intercepto |    0    |  3     |  Soluci�n de frontera 4    
#---------------------------------
# 
# Restricci�n 3    -x1+ x2<=1 
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    -1   |  0     |  Soluci�n de frontera 5
# -------------------------------- 
# Intercepto |    0    |  1    |  Soluci�n de frontera 6    
#--------------------------------
# 
# Restricci�n 3      x2<=2 
#             |  x1     |  x2    |
# --------------------------------
#  Intercepto |    0    |  2    |  Soluci�n de frontera 7    
#--------------------------------
# 

#### Paso 2 Encontrar la soluci�n de los sistemas de ecuaciones ####
# Para este caso ser�n 12,13 y 23. Tambi�n van a contar como posibles 
# soluciones del sistema
# 
#   6x1+4x2<=24      R1
#    x1+2x2<=6       R2
#   -x1+ x2<=1       R3
#        x2<=2       R4


#### Soluci�n Restricci�n 12 ####
#   6x1+4x2<=24      R1
#    x1+2x2<=6       R2
# Ax=b
A12<-matrix(c(6, 4,
              1,2), ncol = 2, nrow = 2, byrow = TRUE)
b12<-c(24,6)
S1<-solve(A12,b12);S1 # Soluci�n 8

##### Soluci�n Ecuaci�n 13  ####
#   6x1+4x2<=24      R1
#   -x1+ x2<=1       R3
A13<-matrix(c(6, 4,
              -1, 1), ncol = 2, nrow = 2, byrow = TRUE)
b13<-c(24,1)
S2<-solve(A13,b13);S2 # Soluci�n 9
round(S2, 3)
##### Soluci�n Ecuaci�n 14  ####
#   6x1+4x2<=24      R1
#        x2<=2       R4
A14<-matrix(c(6,4,
              0, 1), ncol = 2, nrow = 2, byrow = TRUE)
b14<-c(24,2)
S3<-solve(A14,b14);S3 # Soluci�n 10
round(S3, 3)
       
##### Soluci�n Ecuaci�n 23 ####
#    x1+2x2<=6       R2
#   -x1+ x2<=1       R3
A23<-matrix(c(1,2,
              -1, 1), ncol = 2, nrow = 2, byrow = TRUE)
b23<-c(6,1)
S4<-solve(A23,b23);S4 # Soluci�n 11
round(S4, 3)

##### Soluci�n Ecuaci�n 24 ####
#    x1+2x2<=6       R2
#        x2<=2       R4
A24<-matrix(c(1,2,
              0, 1), ncol = 2, nrow = 2, byrow = TRUE)
b24<-c(6,2)
S5<-solve(A24,b24);S5 # Soluci�n 12
round(S5, 3)

##### Soluci�n Ecuaci�n 34####
#   -x1+ x2<=1       R3
#        x2<=2       R4
A23<-matrix(c(-1,1,
              0, 1), ncol = 2, nrow = 2, byrow = TRUE)
b23<-c(1,2)
S4<-solve(A23,b23);S4 # Soluci�n 13
round(S4, 3)

# ------------------------------------------
# | Soluci�n de los sistemas de Ecuaciones |
# ------------------------------------------
# |   Variable    |    x1    |    x2       |    
# ------------------------------------------
# |Soluci�n ec12  |   3      |   1.5       | Soluci�n 8
# ------------------------------------------
# |Soluci�n ec13  |   2      |   3         | Soluci�n 9
# ------------------------------------------
# |Soluci�n ec14  |   2.667  |   2         | Soluci�n 10
# ------------------------------------------
# |Soluci�n ec23  |   1.333  |   2.333     | Soluci�n 11
# ------------------------------------------
# |Soluci�n ec24  |   2      |   2         | Soluci�n 12
# ------------------------------------------
# |Soluci�n ec34  |   1      |   2       | Soluci�n 13
# ------------------------------------------
#   6x1+4x2<=24      R1
#    x1+2x2<=6       R2
#   -x1+ x2<=1       R3
#        x2<=2       R4

#### Paso 3 Graficar las restricciones  ####
# 
#### Ecuaci�n 1  6x1+4x2<=24      ####
x11<-seq(0,4,by=0.01)
x21<- (24-6*x11)/4
plot(x11, x21, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad 6x1+4x2<=24 ')
#### Ecuaci�n 2  x1+2x2<=6  ####
x12<-seq(0,4,by=0.01)
x22<- (6-x12)/2
plot(x12, x22, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad x1+2x2<=6 ')
#### Ecuaci�n 3  -x1+ x2<=1     ####
x13<-seq(0,4,by=0.01)
x23<-1+x13
plot(x13, x23, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad  -x1+ x2<=1  ')
#### Ecuaci�n 4  x2<=2     ####

#### Ecuaci�n 5  z=5x1+4x2=10     ####
x15<-seq(0,4,by=0.01)
x25<-(10-5*x15)/4
plot(x15, x25, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad z=5x1+4x2 ')



####Gr�ficamos todas las ecuaciones juntas####
plot(x11, x21,type='l', xlab='X1', ylab = 'x2', 
     main = 'Soluci�n �ptima del modelo Reedy Mikks ' )
lines(x12, x22, type='l', col='red')
lines(x13, x23, type='l', col='blue')
lines(x15, x25, type='l', col='green')
abline(h=2, type='l', col='brown')
abline(h=0, v=0, col='gray', lty=3)

library(ggplot2)
library(plotly)
all<-data.frame(matrix(c(x11, x21,x22,x23, x25), ncol=5, byrow=FALSE))
colnames(all)<-c('Ra','R1','R2','R3','R4')
pl<-ggplot(all, aes(x=Ra)) +
  geom_line(aes(y=R1), color = 'aquamarine', size = 0.5) + 
  geom_line(aes(y=R2), color = 'azure4', size = 0.5) +
  geom_line(aes(y=R3), color = 'cornflowerblue', size = 0.5) +
  geom_line(aes(y=R4), color = 'brown1', size = 0.5) +
  geom_hline(yintercept = 2, color = 'orange', size = 0.5)+
  labs(x='X1', y='X2') +
  ggtitle('Maximizaci�n')
ggplotly(pl)


# Ejercicio 2  ####
# La compa��a Gutchi fabrica bolsas de mano, estuches para rasuradoras y mochilas. 
# En la fabricaci�n de los tres productos se necesitan piel y materiales sint�ticos,
# y la piel es la materia prima  limitaste. En el proceso de producci�n se usan dos
# clases de mano de obra calificada: costura y acabado. La tabla siguiente muestra 
# la disponibilidad de los recursos, su uso en los tres productos y las utilidades 
# por unidad.



#                          Requerimientos del recurso por unidad
#                 _____________________________________________________
#  Recurso         Bolsa     Estuche   Mochila     Disponibilidad Diaria
# ----------------------------------------------------------------------------
# Piel(pie^{2}) |    2    |     1   |     3      |           42              |
# ----------------------------------------------------------------------------
# Costura(hrs)  |    2    |     1   |     2      |           40              |
# ----------------------------------------------------------------------------
# Acabado(hrs)  |    1    |   0.5   |     1      |           45              |
# ----------------------------------------------------------------------------
# Utilidad($)   |    24   |     22  |     25     |                           |
# ----------------------------------------------------------------------------

# Formule el problema como modelo de programaci�n lineal y determine la soluci�n �ptima.
# Z=24x1+22x2+25x3

#  2x1+   x2+3x3<=42   R1   Piel 
#  2x1+   x2+2x2<=40   R2   horas
#   x1+0.5x2+ x3<=45   R3  horas

# Soluci�n del modelo ####
Z <- c(24, 22, 25)  # Funci�n objetivo  
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,40,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  

 # continuaci�n indique si los cambios siguientes y determine la nueva soluci�n �ptima
# (los valores de las variables y de la funci�n objetivo).

# a) La piel disponible aumenta a 45 pies2.####
#  2x1+   x2+3x3<=45   R1   Piel 
#  2x1+   x2+2x2<=40   R2   horas
#   x1+0.5x2+ x3<=45   R3  horas

Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(45,40,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  






# b) La piel disponible disminuye 1 pie2.####
#  2x1+   x2+3x3<=42   R1   Piel 
#  2x1+   x2+2x2<=40   R2   horas
#   x1+0.5x2+ x3<=45   R3  horas

Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(41,40,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  



# c) Las horas disponibles de costura cambian a 38.####
#  2x1+   x2+3x3<=42   R1   Piel        Piel  
#  2x1+   x2+2x2<=38   R2   horas       Costura
#   x1+0.5x2+ x3<=45   R3  horas        Acabado 
Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,38,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  



# d) Las horas disponibles de costura cambian a 46.####
#2x1+x2+3x3=42 ec 1
#2x1+x2+2x3=46 ec2
#x1+0.5x2+x3=45 ec3
Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,46,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  


#  2x1+   x2+3x3<=42   R1   Piel 
#  2x1+   x2+2x2<=40   R2   horas
#   x1+0.5x2+ x3<=45   R3  horas
# e) Las horas disponibles de acabado disminuyen a 15.####
#2x1+X2+3x3<=42
#2x1+x2+2x3=40
#x1 + .5x2 +x3 =15
Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,40,15)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  

# f) Las horas disponibles de acabado aumentan a 50.####
#2x1+x2+3x3<=42 piel
#2x1+x2+2x3<=40 costura
#x1+1/2x2+x3<=50 acabado
Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,40,50)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  


# g) �Recomendar�a usted contratar un costurero m�s a $15 por hora?####
#  2x1+   x2+3x3<=42   R1   Piel 
#  2x1+   x2+2x2<=40   R2   horas  Costura
#   x1+0.5x2+ x3<=45   R3  horas

Z <- c(24, 22, 25)  # Funci�n objetivo
A <- matrix (c(2, 1, 3,
               2, 1, 2,
               1, 0.5, 1), ncol=3,  nrow=3, byrow=TRUE) # Restricciones
dir <- c("<=", "<=", "<=")  # Maximizaci�n o minimizaci�n
b <- c(42,35,45)  # Disponibilidad 
sol<-lp("max", Z, A, dir, b,  compute.sens=TRUE) # Resolver simplex
sol$objval    # Resultado de la funci�n objetivo  Z
sol$solution  # los valores de cada uno de las x's
sol$duals     # Resultado incluyendo el dual  















