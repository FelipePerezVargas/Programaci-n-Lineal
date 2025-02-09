##################################################################
####                                                          ####
####    Representaci�n Gr�fica de las Soluciones Factibles    ####
####                                                          ####
##################################################################
# Una vez que nosotros hemos modelado nuestro problema vamos a proceder
# a hacer el an�lisis gr�fico para saber cu�l es la regi�n factible con 
# respecto a las restricciones impuestas por el modelo
# Ejemplo 1 
# 
# Maximizar Z=3x1+5x2
# 
# sujeto a las siguientes restricciones 
# 10x1+  x2<=10  Ecuaci�n 1
#   x1+10x2<=10  Ecuaci�n 2
#  2x1+ 3x2<=6   Ecuaci�n 3
# 
# Paso 1 Encontrar la ra�z y el intercepto de cada una de la restricciones,
# cada ra�z e intercepto corresponder�n a una soluci�n de frontera.
# 
# Restricci�n 1     10x1+  x2<=10 
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    1    |  0     |  Soluci�n de frontera 1
# -------------------------------- 
# Intercepto |    0    |  10    |  Soluci�n de frontera 2    
#--------------------------------
# 
# Restricci�n 2     x1+10x2<=10 
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    10   |  0     |  Soluci�n de frontera 3
# -------------------------------- 
# Intercepto |    0    |  1     |  Soluci�n de frontera 4    
#---------------------------------
# 
# Restricci�n 3     2x1+ 3x2<=6 
#            |  x1     |  x2    |
# --------------------------------
# Ra�z       |    3    |  0     |  Soluci�n de frontera 5
# -------------------------------- 
# Intercepto |    0    |  2     |  Soluci�n de frontera 6    
#--------------------------------
# 
# Paso 2 Encontrar la soluci�n de los sistemas de ecuaciones 
# Para este caso ser�n 12,13 y 23. Tambi�n van a contar como posibles 
# soluciones del sistema
# 
# Soluci�n Restricci�n 12
# 10x1+  x2<=10  Ecuaci�n 1
#   x1+10x2<=10  Ecuaci�n 2
# Ax=b
A12<-matrix(c(10, 1,
               1,10), ncol = 2, nrow = 2, byrow = TRUE)
b12<-c(10,10)
S1<-solve(A12,b12);S1 # Soluci�n 7
# Soluci�n Ecuaci�n 13
# 10x1+  x2<=10  Ecuaci�n 1
#  2x1+ 3x2<=6   Ecuaci�n 3
A13<-matrix(c(10, 1,
               2, 3), ncol = 2, nrow = 2, byrow = TRUE)
b13<-c(10,6)
S2<-solve(A13,b13);S2 # Soluci�n 8
round(S2, 3)
# Soluci�n Ecuaci�n 23
#   x1+10x2<=10  Ecuaci�n 2
#  2x1+ 3x2<=6   Ecuaci�n 3
A23<-matrix(c(1,10,
              2, 3), ncol = 2, nrow = 2, byrow = TRUE)
b23<-c(10,6)
S3<-solve(A23,b23);S3 # Soluci�n 9
# ------------------------------------------
# | Soluci�n de los sistemas de Ecuaciones |
# ------------------------------------------
# |   Variable    |    x1    |    x2       |    
# ------------------------------------------
# |Soluci�n ec12  |  0.909   |  0.909      | Soluci�n 7
# ------------------------------------------
# |Soluci�n ec13  |  0.857   |  1.428      | Soluci�n 8
# ------------------------------------------
# |Soluci�n ec23  |  1.764   |  0.823      | Soluci�n 9
# ------------------------------------------
  
# Paso 3 Graficar por separado cada una de la restricciones para saber cu�l es la 
# regi�n factible de cada una de las restricciones.
# 
# Ecuaci�n 1  10x1+x2<=10
x11<-seq(0,1,by=0.01)
x21<- 10-10*x11
plot(x11, x21, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad 10x1+x2<=10 ')
# Agrego un punto de prueba 
points(0.2, 3, pch='???', ) # Lado izquierdo
# Evaluamos un punto de prueba en la restricci�n 1
# 10x1+x2<=10
10*0.2+1*(3)   
# Evaluamos 
points(0.8, 6, col='blue', pch='???') # Lado derecho
# 10x1+x2<=10
10*0.8+1*(6)
# La soluci�n izquierda cumple con la desigualdad

# Ecuaci�n 2     x1+10x2<=10 
x12<-seq(0,10, by=0.01)
x22<-(10-x12)/10
plot(x12, x22, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad x1+10x2<=10 ')
#COlocamos un punto de prueba
points(3,0.4, pch='???', col='red') # Lado izquierdo
# x1+10x2<=10
3+10*0.4
points(8, 0.8, col='yellow', pch='???') # Lado derecho
# x1+10x2<=10
8+10*.8
# La soluci�n izquierda cumple con la desigualdad
# Ecuaci�n 3     2x1+ 3x2<=6 
x13<-seq(0,3, by=0.01)
x23<-(6-2*x13)/3
plot(x13, x23, type='l', xlab='X1', ylab = 'x2', 
     main = 'Desigualdad  2x1+ 3x2<=6 ')
# Pongo un punto de prueba
points(1.5,0.5, col='green', pch='???')
# 2x1+ 3x2<=6 
2*(1.5)+3*(0.5)  # Lado izquierdo

points(2.5,1.5, col='gray', pch='???')
2*(2.5)+3*(1.5)  # Lado derecho 
# La soluci�n izquierda cumple con la desigualdad

# Paso 4 Construir la tabla que contenga el valor de cada una de las soluciones 
# el valor de Z para cada una de las soluciones y si cumplen con las 
# restricciones
# --------------------------------------------------------------------------------
#                       |  x1   | x2   |  Z=3x1+5x2   | ec1 | ec2 | ec3 | Cumple | 
# --------------------------------------------------------------------------------
# Soluci�n 1/Ra�z  ec1  |  1    |  0   |        3     |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------
# Soluci�n 2/inter ec1  |  0    | 10   |       50     |  si |  si |  no |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 3/Ra�z  ec2  |  10   |  0   |       30     |  no |  si |  no |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 4/inter ec2  |  0    |  1   |        5     |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------
# Soluci�n 5/inter ec3  |  3    |  0   |        9     |  no |  si |  si |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 6/inter ec3  |  0    |  2   |       10     |  si |  no |  si |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 7/sol 12     |0.909  |0.909 |        7.272 |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------      
# Soluci�n 8/sol 13     |0.857  |1.428 |        9.711 |  si |  no |  si |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 9/sol 23     |1.764  |0.823 |        9.407 |  no |  si |  si |    no  |
# --------------------------------------------------------------------------------
# 10x1+  x2<=10  Ecuaci�n 1
#   x1+10x2<=10  Ecuaci�n 2
#  2x1+ 3x2<=6   Ecuaci�n 3
# Paso 5 Graficar el conjunto de restricciones y los puntos correspondientes
# a cada una de las soluciones.
# Ecuaci�n 1
plot(x11, x21, type='l', xlab='X1', ylab = 'X2', 
     main = 'Soluci�n de Maximizaci�n del Modelo', 
     xlim = c(0,10)) 
# Ra�z e intercepto 
points(1, 0, pch=16)  #Soluci�n de frontera 1
points(0,10, pch=16)  #Soluci�n de frontera 2
# Ecuaci�n 2
lines(x12, x22, type='l', col='red') 
# Ra�z e intercepto 
points(10,0, col='red', pch=16)  #Soluci�n de frontera 3
points( 0,1, col='red', pch=16)  #Soluci�n de frontera 4
# Ecuaci�n 3
lines(x13,x23, type='l', col='blue') 
# Ra�z e intercepto 
points(3,0, col='blue', pch=16)  #Soluci�n de frontera 5
points(0,2, col='blue', pch=16)  #Soluci�n de frontera 6
# Intersecci�n de las restricciones 12
points(0.909,0.909, col='brown', pch=16)  #Soluci�n 7
# Intersecci�n de las restricciones 13
points(0.857,1.428, col='darkslateblue', pch=16)  #Soluci�n 8
# Intersecci�n de las restricciones 23
points(1.764,0.823, col='darkgreen', pch=16)  #Soluci�n 9
# L�mites del modelo 
abline(v=0, h=0, lty=3)
# 
# Paso 6 Crear poligonos de colores para cada una de las posibles soluciones 
# e indicar de color rojo la soluci�n factible. 
#
plot(x11, x21, type='l', xlab='X1', ylab = 'X2', 
     main = 'Soluci�n Factible', 
     xlim = c(0,10)) 
# Ra�z e intercepto 
points(1, 0, pch=16)  #Soluci�n 1
points(0,10, pch=16)  #Soluci�n 2
# Agregamos el origen de de coordenadas
points(0,0, pch=16)
# Ecuaci�n 2
lines(x12, x22, type='l', col='red') 
# Ra�z e intercepto 
points(10,0, pch=16, col='red')  #Soluci�n 3
points( 0,1, pch=16, col='red')  #Soluci�n 4
# Ecuaci�n 3
lines(x13,x23, type='l', col='blue') 
# Ra�z e intercepto 
points(3,0, pch=16, col='blue')  #Soluci�n 5
points(0,2, pch=16, col='blue')  #Soluci�n 6
# Intercepci�n de las restricciones 12
points(0.909,0.909,pch=16, col='lightpink4')  #Soluci�n 7
# Intercepci�n de las restricciones 13
points(0.857,1.428, pch=16, col='hotpink4')  #Soluci�n 8
# Intercepci�n de las restricciones 23
points(1.764,0.823, pch=16, col='greenyellow')  #Soluci�n 9
# L�mites del modelo 
abline(v=0, h=0, lty=3)
# Superficie 1
polygon(x = c(0,0,0.909, 1),                    
        y = c(0,1,0.909, 0),                      
       col = "orchid") 
# Superficie 2
polygon(x = c(0,0, 0.857,0.909),                    
        y = c(1,2, 1.428,0.909),                      
        col = "purple4") 
# Superficie 3
 polygon(x = c(0, 0,0.857),                    
         y = c(2,10,1.428),                      
         col = "red4") 
# Superficie 4
 # Agregamos un punto de referencia
 points(10,10)
polygon(x = c(0.857,0,10, 10,1.764),
        y = c(1.428,10,10,0, 0.823),
        col = "palegreen4")
# Superficie 5
polygon(x = c(3,1.764, 10),
        y = c(0,0.823, 0),
        col = "royalblue4")
# Superficie 6
polygon(x = c(1,0.909,1.764, 3),
        y = c(0,0.909,0.823, 0),
        col = "seagreen4")
# Superficie 7
polygon(x = c(0.909,0.857,1.764),
        y = c(0.909,1.428,0.823),
        col = "lightslateblue")
text(x = 0.5, y = 0.5,               
     "Soluci�n")
grid(nx=10, ny=10)
# Poner un punto de prueba y comprobar que el poligono uno es el �nico que
# cumple con las restricciones del modelo



plot(x11, x21, type='l', xlab='X1', ylab = 'x2', 
     main = 'Restricciones  10x1-x2<=10 y  x1+10x2<=10', 
     xlim = c(0,10)) 
# Puntos de prueba
points(0.2, 6, pch='???') # Lado izquierdo 
points(0.8, 8, col='blue', pch='???') # Lado derecho
# Ra�z e intercepto 
points(1, 0)  #Soluci�n 1
points(0,10)  #Soluci�n 2
# Ecuaci�n 2
lines(x12, x22, type='l', col='red') 
# Puntos de prueba
points(3,0.4, pch='???', col='red') # Lado izquierdo
points(8, 0.8, col='yellow', pch='???') # Lado derecho
# Ra�z e intercepto 
points(10,0)  #Soluci�n 3
points( 0,1)  #Soluci�n 4
# Ecuaci�n 3
lines(x13,x23, type='l', col='blue') 
# Puntos de prueba
points(1.5,0.5, col='green', pch='???') # Lado izquierdo
points(2.5,1.5, col='gray', pch='???') # Lado derecho
# Ra�z e intercepto 
points(3,0)  #Soluci�n 5
points(0,2)  #Soluci�n 6
# Intercepci�n de las restricciones 12
points(0.909,0.909)  #Soluci�n 7
# Intercepci�n de las restricciones 13
points(0.857,1.428)  #Soluci�n 8
# Intercepci�n de las restricciones 23
points(1.764,0.823)  #Soluci�n 9
# L�mites del modelo 
abline(v=0, h=0, lty=3)
# 
# Paso 6 Crear poligonos de colores para cada una de las posibles soluciones 
# e indicar de color rojo la soluci�n factible. 
#
par(bg = "cyan")
plot(x11, x21, type='l', xlab='X1', ylab = 'X2', 
     main = 'Soluci�n Factible', 
     xlim = c(0,10)) 
# Ra�z e intercepto 
points(1, 0, pch=16)  #Soluci�n 1
points(0,10, pch=16)  #Soluci�n 2
# Ecuaci�n 2
lines(x12, x22, type='l', col='red') 
# Ra�z e intercepto 
points(10,0, pch=16, col='red')  #Soluci�n 3
points( 0,1, pch=16, col='red')  #Soluci�n 4
# Ecuaci�n 3
lines(x13,x23, type='l', col='blue') 
# Ra�z e intercepto 
points(3,0, pch=16, col='blue')  #Soluci�n 5
points(0,2, pch=16, col='blue')  #Soluci�n 6
# Intercepci�n de las restricciones 12
points(0.909,0.909,pch=16, col='lightpink4')  #Soluci�n 7
# Intercepci�n de las restricciones 13
points(0.857,1.428, pch=16, col='hotpink4')  #Soluci�n 8
# Intercepci�n de las restricciones 23
points(1.764,0.823, pch=16, col='greenyellow')  #Soluci�n 9
# L�mites del modelo 
abline(v=0, h=0, lty=3)
# Superficie 1
polygon(x = c(0,0,0.909, 1),                    
        y = c(0,1,0.909, 0),                      
        col = "orchid") 
# Superficie 2
polygon(x = c(0,0, 0.857,0.909),                    
        y = c(1,2, 1.428,0.909),                      
        col = "purple4") 
# Superficie 3
polygon(x = c(0,0,0.857),                    
        y = c(2,10,1.428),                      
        col = "red4") 
# Superficie 4
polygon(x = c(0.857,0,10, 10,1.764),
        y = c(1.428,10,10,0, 0.823),
        col = "palegreen4")
# Superficie 5
polygon(x = c(3,1.764, 10),
        y = c(0,0.823, 0),
        col = "royalblue4")
# Superficie 6
polygon(x = c(1,0.909,1.764, 3),
        y = c(0,0.909,0.823, 0),
        col = "aquamarine")
# Superficie 7
polygon(x = c(0.909,0.857,1.764),
        y = c(0.909,1.428,0.823),
        col = "lightslateblue")
text(x = 0.5, y = 0.5, "Soluci�n")
# grid(nx=10, ny=10)
# 
# Poner un punto de prueba y comprobar que el poligono uno es el �nico que
# cumple con las restricciones del modelo






############################################################################
par(bg='darkslategray1')
plot(x11, x21, type='l', xlab='X1', ylab = 'X2', 
     main = 'Soluci�n Factible', 
     xlim = c(0,10)) 
# Superficie 1
polygon(x = c(0,0,0.909, 1),                    
        y = c(0,1,0.909, 0),                      
        col = "orchid") 
# Superficie 2
polygon(x = c(0,0, 0.857,0.909),                    
        y = c(1,2, 1.428,0.909),                      
        col = "purple4") 
# Superficie 3
polygon(x = c(0,0,0.857),                    
        y = c(2,10,1.428),                      
        col = "red4") 
# Superficie 4
polygon(x = c(0.857,0,10, 10,1.764),
        y = c(1.428,10,10,0, 0.823),
        col = "palegreen4")
# Superficie 5
polygon(x = c(3,1.764, 10),
        y = c(0,0.823, 0),
        col = "royalblue4")
# Superficie 6
polygon(x = c(1,0.909,1.764, 3),
        y = c(0,0.909,0.823, 0),
        col = "seagreen4")
# Superficie 7
polygon(x = c(0.909,0.857,1.764),
        y = c(0.909,1.428,0.823),
        col = "lightslateblue")
# Ecuaci�n 2
lines(x12, x22, type='l', col='red') 
# Ecuaci�n 3
lines(x13,x23, type='l', col='blue') 
# Ra�z e intercepto 
points(1, 0, pch=16)  #Soluci�n 1
points(0,10, pch=16)  #Soluci�n 2
# Ra�z e intercepto 
points(10,0, pch=16, col='red')  #Soluci�n 3
points( 0,1, pch=16, col='red')  #Soluci�n 4
# Ra�z e intercepto 
points(3,0, pch=16, col='blue')  #Soluci�n 5
points(0,2, pch=16, col='blue')  #Soluci�n 6
# Intercepci�n de las restricciones 12
points(0.909,0.909,pch=16, col='lightpink4')  #Soluci�n 7
# Intercepci�n de las restricciones 13
points(0.857,1.428, pch=16, col='hotpink4')  #Soluci�n 8
# Intercepci�n de las restricciones 23
points(1.764,0.823, pch=16, col='greenyellow')  #Soluci�n 9
# L�mites del modelo 
abline(v=0, h=0, lty=3)
text(x=0.5, y=0.5, 'Soluci�n')
grid(col='white')









