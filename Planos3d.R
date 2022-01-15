library(matlib)

rm(list=ls())
# Vamos a usar el paquete matlib para representar graficamente 
# los sistamas de ecuaciones. 
# Ejemplo

# 7x1+3x2-x3=15    Ecuación 1
# 2x1-2x2+3x3=20   Ecuación 2
# x1+x2+x3=5       Ecuación 3

# Para realizar los graficos primero debemos de cambiar nuestro 
# sistema de ecuaciones a la forma matricial Ax=b
A<-matrix(c(7,3,-1,
            2,-2,3,
            1,1,1), ncol=3, nrow=3,byrow = TRUE)
b<-c(15,20,5)
showEqn(A, b) # Muestra la ecuación a resolver y graficar
plotEqn3d(A,b, xlim=c(-10,10), ylim=c(-10,10), zlim=c(10,10)) # Este comando sirve para graficar el sistema de ecuaciones
solve(A,b, fractions = TRUE) # Resuleve el sistema
echelon(A, b, verbose=TRUE, fractions=TRUE) # Resuelve el sistema usando G-J


# Esta configuración sirve para solo una ecuación en 3D
A<-matrix(c(7,3,-1), ncol=3, nrow=1,byrow = TRUE)
b<-15
showEqn(A, b)
plotEqn3d(A,b, xlim = c(-10,10), ylim = c(-10,10), zlim = c(-10,10),
          col='blue', alpha = 0.5)


A<-matrix(c(2,-2,3), ncol=3, nrow=1,byrow = TRUE)
b<-20
showEqn(A, b)
plotEqn3d(A,b, xlim = c(-10,10), ylim = c(-10,10), zlim = c(-10,10), 
          col='red', alpha = 0.6)

A<-matrix(c(1,1,1), ncol=3, nrow=1,byrow = TRUE)
b<-0
showEqn(A, b)
plotEqn3d(A,b, xlim = c(-10,10), ylim = c(-10,10), zlim = c(-10,10))


# 10x1+  x2<=10  Ecuación 1
#   x1+10x2<=10  Ecuación 2
#  2x1+ 3x2<=6   Ecuación 3

A<-matrix(c(10, 1,
             1,10,
             2, 3), ncol=2,nrow=3, byrow = TRUE)
b<-c(10,10,6)
showEqn(A,b)
plotEqn(A,b,xlim = c(0,10), ylim = c(0,10), solution = TRUE)
solve(A,b)
echelon(A, b, verbose=TRUE, fractions=TRUE) #Muestrame como la resolviste



library(boot)
# Solución 7/sol 12     |0.909  |0.909 |        7.272 |  si |  si |  si |    si  |
# Maximizar Z=3x1+5x2
# 
# sujeto a las siguientes restricciones 
# 10x1+  x2<=10  Ecuación 1
#   x1+10x2<=10  Ecuación 2
#  2x1+ 3x2<=6   Ecuación 3
Z <- c(3,5) #Función objetivo
Res<-matrix(c(10,1,
              1,10,
              2,3),ncol=2,nrow=3,byrow=TRUE) #Matriz A de restricciones
Sol<-c(10,10,6)  # Vector b de soluciones
Ms <- simplex(Z, A1 = A, b1= b,
              maxi=TRUE );Ms  #Resuelve el sistema usando el método simplex
plotEqn(Res, Sol)

Z<-c(3,2,5)
A<-matrix(c(7,3,-1,
            2,-2,3,
            1,1,1), ncol=3, nrow=3,byrow = TRUE)
b<-c(15,20,5)
Ms <- simplex(Z, A1 = A, b1= b,
              maxi=TRUE );Ms  #Resuelve el sistema usando el método simplex
X<-c('a','b','c', 8,9,10,11,12,13,14,15,16,17,18,19,20)

sample(X,size = 10)



Z <- c(1,2,3)
Res<-matrix(c(0,2,3,
              5,0,3),ncol=3,nrow=2,byrow=TRUE)
Sol<-c(100,100)
Ms <- simplex(Z, A1 = Res, b1= Sol,
              maxi=TRUE );Ms





A<-matrix(c(10,1,
              1,10,
              2,3),ncol=2,nrow=3,byrow=TRUE)
b<-c(10,10,6)
showEqn(A, b)
plotEqn(A,b, xlim=c(0,10), ylim=c(0,10))




A<-matrix(c(7,3,
            3,1,
            1,1), ncol=2, nrow=3,byrow = TRUE)
b<-c(15,20,5)
showEqn(A, b)
plotEqn(A,b, xlim=c)
solve(A,b, fractions = TRUE)
echelon(A, b, verbose=TRUE, fractions=TRUE)



# Creamos variables dummy para generar nuestro plano 3d
dat <- replicate(2, 1:3);dat

# Configuramos nuestro plano 3d
plot3d(dat, type = 'n', xlim = c(-15, 15), ylim = c(-15, 15), zlim = c(-15, 15), 
       xlab = '', ylab = '', zlab = '') 

# Agregamos planos
planes3d(7, 3, -1, 15, col = 'red', alpha = 0.6)
planes3d(2, -2, 3, 20, col = 'orange', alpha = 0.6)
planes3d(1, 1, 1, 5, col = 'blue', alpha = 0.6)



