

#### Ejemplo del solución de un Modelo de Programación Lineal usando R ####

# La fábrica de Hilados y Tejidos requiere fabricar dos tejidos de calidad diferente
# T1 y T2;
#se dispone de  
#500 Kg de hilo A,
#300 Kg de hilo B y
#108 Kg de hilo C.
# Para obtener un metro de T1 diariamente se necesitan
#125 gr de A,  
#150 gr de B y
#72 gr de C; 
#para producir un metro de T2 por día se necesitan
#200 gr de A, 
#100 gr  de B
#27 gr de C.
#El T1 se vende a $4000 el metro  
#y el T2 se vende a $5000 el metro.
# Plantear o diseñar el modelo.
# Si se debe obtener el máximo beneficio, ¿cuántos metros de T1 y T2 se deben fabricar?

# Diseño del modelo####
# T1 = x1  Cantidad de metros diarios de tejido tipo T1 a fabricar####
# T2 = x2  Cantidad de metros diarios de tejido tipo T2 a fabricar 

# Ecuaciones ####
# 0.125x1 + 0.2x2   <= 500 Hilo A    ------ Ec1
# 0.15x1  + 0.1x2   <= 300 Hilo B    ------ Ec2 
# 0.072x1 + 0.027x2 <= 108 Hilo C    ------ Ec3

# z=4000x1+5000x2   Maximizar
# Cumplir la restricción de no negatividad x1, x2 >= 0

# Lo primero que tenemos que hacer es encontrar el intercepto ####
# para esto se recomienda hacer x1 = 0 para encontrar la ordenada al origen para cada 
# ecuación 

# Ecuación 1 ####

# 0.2x2=500
# x2=500/0.2=2500

# Ecuación 2 ####
# 
# 0.1x2=300
# x2=300/0.1=3000

# Ecuación 3 ####
# 
# 0.027x2=108
# x2=108/0.027=4000


#Ahora calculamos la raíz de cada ecuación, esto se logra haciendo x2=0 ####
# en cada una de las ecuaciones como se hizo anteriormente

# Ecuación 1 ####
# 0.125x1=500
# x1=500/0.125=4000
# Ecuación 2 ####
# 0.15x1=300
# x1=300/0.15=2000
# Ecuación 3 ####
# 0.072x1=108
# x1=108/0.072=1500

# Ahora podemos hacer una tabla para las coordenadas de cada ecuación de la manera ####
# siguiente:

# Ecuación 1 ####
#                    | x1   |   x2  |
# Primera coordenada | 0    |  2500 | Intercepto
# Segunda Coordenada | 4000 |  0    | Raíz

# Ecuación 2 ####
  #                    |   x1 |   x2  |
  # Primera coordenada |   0  | 3000  | Intercepto
  # Segunda Coordenada | 2000 |   0   | Raíz
# Ecuación 3 ####
  #                    |  x1   |  x2   |
  #                    |_______|_______|
  # Primera coordenada |   0   | 4000  | Intercepto
  #                    |_______|_______|
  # Segunda Coordenada |  1500 |  0    | Raíz
  #                    |_______|_______|

# Una vez que encontramos las coordenadas debemos de graficarlas en el plano ####
# respetando la restricción de que x1 y x2 >= 0

# Ahora despejamos x2 de la ecuación ####
# Ecuación 1 ####
# Para crear la secuencia usamos los valores de la raíz
x11<-seq(0,4000, by=0.1)
x21<-(500-0.125*x11)/0.2
plot(x11,x21, type='l', col='red', ylim=c(0,4100), xlim=c(0,4100))
abline(h=0, v=0, lty=3, col='gray') # Dibujamos la línea de origen 
points(0,2500, col='red') # Dibujamos el intercepto
points(4000,0, col='red') # Dibujamos la raíz


# Ecuación 2 ####

x12<-seq(0,2000, by=0.1)
x22<-(300-0.15*x12)/0.1
lines(x12,x22, lty=1, col='blue') # Se agrega a la gráfica anterior
points(0,3000, col='blue') # Dibujamos el intercepto
points(2000,0, col='blue') # Dibujamos la raíz

# Ecuación 3 ####

x13<-seq(0,1500, 0.1)
x23<-(108-0.072*x13)/0.027
lines(x13,x23, lty=1, col='green') # Se agrega a la gráfica anterior
points(0,4000, col='green') # Dibujamos el intercepto
points(1500,0, col='green') # Dibujamos la raíz


# Ahora podemos resolver el sistema de ecuaciones que maximize el problema
# Para esto debemos debemos de usar la forma Ax=b y usamos el comando solve para
# encontrar los valores de x1 y x2 para saber donde tiene solución el sistema de ecuaciones

# Solución de las ecuaciones 1 y 2 ####
# 0.125x1 + 0.2x2   = 500   Hilo A
# 0.15x1 + 0.1x2    = 300   Hilo B
# Formamos  A ####
# Resolvemos el sistema de la forma Ax=b
A1<-matrix(c(0.125, 0.2,
             0.150, 0.1), ncol=2, nrow=2, byrow = TRUE);A1
b1<-c(500, 300)
S1<-solve(A1,b1);S1
#Evaluamos en la función a maximizar
# Z1<-4000*x1+5000*x2;Z1
Z1<-4000*S1[1]+5000*S1[2];Z1
Z1<-4000*571.4286+5000*2142.8571;Z1
# 0.125x1 + 0.2x2   = 500   Hilo A
# 0.072x1 + 0.027x2 = 108   Hilo C
# Solución de las ecuaciones 1 y 3 ####
A2<-matrix(c(0.12, 0.2,
             0.072,0.027), ncol=2, nrow=2, byrow = TRUE);A2
b2<-c(500, 108)
S2<-solve(A2,b2);S2
Z2<-4000*725.8065+5000*2064.516;Z2
# 0.15x1 + 0.1x2    = 300   Hilo B
# 0.072x1 + 0.027x2 = 108   Hilo C
#Ax=b
# Solución de las ecuaciones 2 y 3 ####
A3<-matrix(c(0.15, 0.1,
             0.072,0.027), ncol=2, nrow=2, byrow = TRUE);A3
b3<-c(300, 108)
S3<-solve(A3,b3);S3
Z3<-4000*S3[1]+5000*S3[2];Z3

x1<-c(0,4000,0,2000,0,1500,571.428,725.806,857.142)
x2<-c(2500,0,3000,0,4000,0,2142.857,2064.516,1714.285)
Z<-4000*x1+5000*x2;Z

# Ecuaciones ####
r1<- 0.125*x1 + 0.2*x2;r1   #<= 500 Hilo A    ------ Ec1
r2<- 0.15*x1  + 0.1*x2;r2 #<= 300 Hilo B    ------ Ec2 
r3<- 0.072*x1 + 0.027*x2;r3 #<= 108 Hilo C    ------ Ec3


# --------------------------------------------------------------------------------
#                       |  x1   | x2   |  Z=3x1+5x2   | ec1 | ec2 | ec3 | Cumple | 
# --------------------------------------------------------------------------------
# Solución 1/Raíz ec1   |       |      |              |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------
# Solución 2/inter ec1  |  0    | 10   |       50     |  si |  si |  no |    no  |
# --------------------------------------------------------------------------------
# Solución 3/Raíz ec2   |  10   |  0   |       30     |  no |  si |  no |    no  |
# --------------------------------------------------------------------------------
# Solución 4/inter ec2  |  0    |  1   |        5     |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------
# Solución 5/inter ec3  |  3    |  0   |        9     |  no |  si |  si |    no  |
# --------------------------------------------------------------------------------
# Solución 6/inter ec3  |  0    |  2   |       10     |  si |  no |  si |    no  |
# --------------------------------------------------------------------------------
# Solución 7/sol 12     |0.909  |0.909 |        7.272 |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------      
# Solución 8/sol 13     |0.857  |1.428 |        9.711 |  si |  no |  si |    no  |
# --------------------------------------------------------------------------------
# Solución 9/sol 23     |1.764  |0.823 |        9.407 |  no |  si |  si |    no  |
# --------------------------------------------------------------------------------



# Finalmente podemos crear nuestro gráfico de resultados finales ####
x11<-seq(0,4167, by=0.1)
x21<-(500-0.12*x11)/0.2
plot(x11,x21, type='l', col='red', ylim=c(0,4100), xlab='Tejido 1', ylab='Tejido 2',
     main='Solución Método Gráfico para la producción de Tejidos A y B')
abline(h=0, v=0, lty=3, col='gray')
points(0,2500, col='red')
points(4167,0, col='red')
x12<-seq(0,2000, 0.1)
x22<-(300-0.15*x12)/0.1
lines(x12,x22, lty=1, col='blue')
points(0,3000, col='blue')
points(2000,0, col='blue')
x13<-seq(0,1500, 0.1)
x23<-(108-0.072*x13)/0.027
lines(x13,x23, lty=1, col='green')
points(0,4000, col='green')
points(1500,0, col='green')
points(S1[1],S1[2], col='black', pch=16)
points(S2[1],S2[2], col='black', pch=16)
points(S3[1],S3[2], col='black', pch=16)
points(0,0, col='black', pch=16)
legend('topright',legend=c('Perros','Gatos', 'Chivos'),
       pch=c('-','-', '-'),col=c('red','blue','green'))

# Ahora trazamos las áreas de análisis ####

    

plot(10, 10, xlim = c(0, 4000), ylim = c(0, 4100), 
     col = "gray",main='Solución Método Gráfico',
     xlab = "Tejido A", ylab = "Tejido B")
polygon(x = c(0,    0,  S1[1], S3[1], 1500),                    
        y = c(0, 2500,  S1[2], S3[2],   0),                      
        col = "lightslateblue") 
polygon(x = c(S1[1], S2[1], S3[1]),                     
        y = c(S1[2], S2[2], S3[2]),                     
        col = "yellow") 
polygon(x = c(1500,S3[1], 2000),                     
        y = c(0, S3[2],0),                     
        col = "gray") 
polygon(x = c(2000,S3[1],S2[1], 4167),                     
        y = c(0, S3[2],S2[2],0),                     
        col = "pink") 
polygon(x = c(0,0,S1[1]),                     
        y = c(2500,3000, S1[2]),                     
        col = "#d94800") 
polygon(x = c(0,0,S2[1],S1[1]),
        y = c(3000,4000, S2[2], S1[2]),
        col = "purple")
polygon(x = c(0,0,4167,4167,S2[1]),
        y = c(4001,4100,4100, 0, S2[2]),
        col = "darkgreen")
abline(h=0, v=0, lty=3, col='gray')
lines(x11,x21, lty=1, col='red', lwd=2)
lines(x12,x22, lty=1, col='blue', lwd=2)
lines(x13,x23, lty=1, col='green', lwd=2)
points(0,2500, col='red', pch=16)
points(4167,0, col='red', pch=16)
points(0,3000, col='blue', pch=16)
points(2000,0, col='blue', pch=16)
points(0,4000, col='green', pch=16)
points(1500,0, col='green', pch=16)
points(S1[1],S1[2], col='black', pch=16)
points(S2[1],S2[2], col='black', pch=16)
points(S3[1],S3[2], col='black', pch=16)
points(0,0, col='black', pch=16)
text(x=500,y=1000, 'Región\n de \n Solución') 























# Ecuación 1 Horas de ensamble  ####
#2x1+x2<=10

# Ecuacion 2 horas de pintura ####
#x1+2x2<=8

# Función a maximizar  ####
# Z=20000x1+10000x2

# Paso 1: encontrar el intercepto y la raíz para cada una de las ecuaciones ####
# Para encontrar el intercepto hacemos x1=0 en cada una de las ecuaciones y despejamos 
# x2, el valor de x2 es el intercepto

#Ecuación 1 
#si  x1=0
# x2<=10
# Para encontrar la raíz hacemos x2=0 en cada una de las ecuaciones y despejamos 
# x1, el valor de x1 corresponde a la raíz
# si x2=0
# 2x1<=10
# x1=5
#                    | x1   |   x2  |
# Primera coordenada | 0    |  10   | Intercepto
# Segunda Coordenada | 5    |  0    | Raíz
#Ecuación 2
#x1+2x2<=8

#                    | x1   |   x2  |
# Primera coordenada | 0    |  4   | Intercepto
# Segunda Coordenada | 8    |  0    | Raíz

# Paso 2: Graficar el sistema de ecuaciones removiendo las restricciones  ####
# Gráfica Ecuación 1
#2x1+x2<=10
x11<-seq(0,5, by=0.1);x11 # Para graficar usamos los valores de la raíz
# Despejamos x2 de la ecuación 1
x21<-10-2*x11;x21
# Gráfica Ecuación 1
plot(x11, x21, col='red', type='l')
abline(h=0, v=0, col='gray', pch=3)

# Graficamos la ecuación 2 junto con la ecuación 1
x12<-seq(0,8, by=0.1);x12
# Despejamos x2 de la ecuación 2
# x1+2x2<=8
x22<-(8-x12)/2;x22
lines(x12, x22, col='green', type='l')
points(0,10, col='red') #Intercepto ecuación 1
points(5,0, col='red') # Raíz ecuación 1
points(0,4, col='green') #Intercepto ecuación 2
points(8,0, col='green') # Raíz ecuación 2


# Paso 3: Resolver el sistema de ecuaciones  Ax=b ####
#2x1+ x2<=10
# x1+2x2<=8
# Construimos la matriz A
A<-matrix(c(2, 1,
            1,2), ncol=2, nrow=2, byrow = TRUE );A
# Construimos la matriz b
b<-c(10, 8)
# Encontramos la solución con el comando solve
S<-solve(A, b);S



# Paso 4: Sustituir los valores en la función objetivo para conocer el máximo ####
# beneficio

# Z=20000x1+10000x2
Z<-20000*S[1]+10000*S[2];Z
points(4,2,col='black', pch=12)



# Paso 5: Concluir ####

# ???????????? Para maximizare la ganancia se deben de elaborar 4 mesas del modelo A
# y 2 mesas del modelo B ????????????



# Ejercicio 2






























# Ecuación 1 #### 
#2x1+x2=10 
#
#                    | x1   |   x2  |
# Primera coordenada | 0    |  10   | Intercepto
# Segunda Coordenada | 5    |  0    | Raíz

# Ecuación 2 #### 
#x1+2x2=8
#                    |   x1 |   x2  |
# Primera coordenada |   0  |   4   | Intercepto
# Segunda Coordenada |   8  |   0   | Raíz

# Ecuación 1 ####
# Para crear la secuencia usamos los valores de la raíz
x11 <-   seq(0,5, by=0.1);x11
x21 <- 10-2*x11;x21
plot(x11,x21, type='l', col='violet', ylim=c(0,11), xlim=c(0,6))
abline(h=0, v=0, lty=3, col='gray') # Dibujamos la línea de origen 
points(0,10, col='violet') # Dibujamos el intercepto
points(5,0, col='violet') # Dibujamos la raíz


# Ecuación 2 #### 
#x1+2x2=8
# Despejo la ecuación x2 de la ecuación 2
#x2=(8-x1)/2
x12<-seq(0,8, by=0.1)
x22<-(8-x12)/2
lines(x12,x22, lty=1, col='blue') # Se agrega a la gráfica anterior
points(0,4, col='blue') # Dibujamos el intercepto
points(8,0, col='blue') # Dibujamos la raíz
points(4,2,col='red')

#Resolvemos el sistema de ecuaciones para encontrar el posible valor 
#que nos maximize la utilidad
#2 x1+x2=10
#x1+2x2=8
A1<-matrix(c(2, 1,
             1, 2), ncol=2, nrow=2, byrow = TRUE);A1
b1<-c(10, 8)
S1<-solve(A1,b1);S1

print(paste('La solución del sistema es ', S1[1],'y',S1[2], 
            'que maximiza la utilidad'))
# Evaluar la solución para saber cual es la máxima utilidad de acuerdo al 
#número de piezas producidas

Z1=20000*S1[1]+10000*S1[2];Z1
Z1=20000*4+10000*2;Z1
Z1=20000*5;Z1


#Para maximizar la utilidad se deben producir 4 piezas del modelo A y
# 2 piezas del modelo B, cualquier otra combinación la utilidad va a ser 
# menor

# x1+x2<=150 Ecuación 1
# x1<=120 Ecuación 2
# x2<= 100 Ecuación 3
# Z=5*x1+7*x2





# Solución ejercicio 2


# Un estudiante dedica parte de su tiempo al reparto de propaganda
# publicitaria. La empresa A le paga $5 por cada impreso repartido y
# la empresa B, con folletos más grandes, le paga $7 por impreso. El
# estudiante lleva dos bolsas: una para los impresos A, en la que
# caben 120 y otra para los impresos B, en la que caben 100. Ha
# calculado que cada día es capaz de repartir 150 impresos como
# máximo. Determine el modelo adecuado.




# Z=5x1+7x2  Maximizar
# x1<=120       Ecuación 1  Intercepto
# x2<=100       Ecuación 2  Raíz
# x1+x2<=150    Ecuación 3
# con x1, x2>=0 

# Paso 1 Encontrar el intercepto y la raíz 

# Ecuación 1

# Valor constante en x1=120
# Ecuación 2

# Valor constante en x2=100

# Ecuación 3


#                    | x1   |   x2  |
# Primera coordenada | 0    |  150  | Intercepto
# Segunda Coordenada | 150    |  0    | Raíz


# Paso 2 Graficar los sistemas de ecuaciones

# Ecuación 3
x13<-seq(0,150, by=1);x13
x23<-150-x13;x23

plot(x13,x23, col='red', type='l') #Gráfica Ecuación 3
abline(h=0, v=0, col='gray', lty=3) #Eje de referencia
abline(h=100, col='green') # Ecuación 1
abline(v=120, col='yellow') # Ecuación 2
points(120,100)
points(120,30)
points(50,100)
# Paso 3 Encontrar las soluciones de los sistemas 
# 
# Solución del sistema 12

# x1<=120       Ecuación 1  Intercepto
# x2<=100       Ecuación 2  Raíz

#  La solución 1 es (120,100)
# Solución del sistema 13

# x1<=120       Ecuación 1  
# x1+x2<=150    Ecuación 3

#  La solución 2 es (120,30)
# Solución del sistema 23


# x2<=100       Ecuación 2  Raíz
# x1+x2<=150    Ecuación 3
#  La solución 3 es (50,100)

# Paso 4  Evaluar las soluciónes en la ecuación objetivo 

# Z1<-=5*x1+7*x2 #Maximización 1 
# Z1=1300 Se descarta porque NO cumple con las restricciones

# Z2<-=5x1+7x2 #Maximización 2 
# z2=810

# Z3<-=5x1+7x2  Maximización 3
# Z3=950
#  La solución 3 es (50,100)

# Paso 5  Conclusión 

# Para obtener el mayor beneficio se deben de repartir 50 volantes del tipo
# y 100 volantes del tipo B











# x1 impreso A
# x2 impreso B
# x1+x2<=150 Ecuación 1
# x1<=120    Ecuación 2
# x2<=100    Ecuación 3
# Z=5x1+7x2 Mazimizar


# Paso 1
# Equación 1
# s1 x1=0 
# x1+x2=150
# x2=150
# Si x2= 0
# x1=150

#                    | x1   |   x2  |
# Primera coordenada | 0    |  150  | Intercepto
# Segunda Coordenada | 150  |  0    | Raíz

# Ecuación 2
# si x1=0
# x1=120
# Ecuación 3
# x2=100


# Paso 2

# graficamos las ecuaciones

# Ecuación 1


x11<-seq(0,150, by=1);x11

# Despejamos x2 de la ecuación 1

x21<-150-x11;x21

plot(x11, x21, col='red', type='l', xlab='')
abline(h=0, v=0, type='l', col='gray')
abline(h=100, type='l', col='blue') # Graficar una constante horizonta x2
abline(v=120, type='l', col='green') # Graficar una constante vertical x1

# Resolvemos los sistemas de ecuaciones

# Solución ecuación 12
# x1 impreso A
# x2 impreso B

# x1+x2<=150 Ecuación 1
# x1<=120    Ecuación 2
# x2<-150-120
# Solución 1 x1=120, x2=30

# Evaluamos en la función 
# Z=5x1+7x2 Maximizar
Z1<-5*120+7*30;Z1

# Utilidad 810

# Solución ecuación 13
# x1 impreso A
# x2 impreso B
# x1+x2<=150 Ecuación 1
# x2<=100    Ecuación 3

# Solución x1=50, x2=100
# Z=5x1+7x2 Mazimizar
#  950 Utilidad


# Solución ecuación 23

# x1 impreso A
# x2 impreso B
# x1<=120    Ecuación 2
# x2<=100    Ecuación 3

# Z=5x1+7x2 Maximizar
# 1300 de utilidad

# Conclusión

# Para obtener mayor utilidad se deben de repartir 120 impresos del modelo A
# y 100 impresos del modelo B



# Ejercicio 3

# Z=20000x1+15000x2
#  x1+2x2<=80    #Acero    Ecuación 1
# 3x1+2x2<=120   #Aluminio Ecuación 2 

# Paso 1


# Paso 1 encontrar las raíz e intercepto de cada ecuación

#Ecuación 1
#                    | x1   |   x2  |
# Primera coordenada | 0    |  40   | Intercepto
# Segunda Coordenada | 80   |  0    | Raíz

#Ecuación 2
#                    | x1   |   x2  |
# Primera coordenada | 0    |  60   | Intercepto
# Segunda Coordenada | 40   |  0    | Raíz

# Paso 2 Graficar el sistema de ecuaciones 
# Gráfica ecuación 1
x11<-seq(0,80, by=1);x11
x21<-(80-x11)/2;x21

# Gráfica ecuación 2
x12<-seq(0,40,by=1)
x22<-(120-3*x12)/2

# Paso 3 Resolver el sistema de ecuaciones para encontrar las posibles soluciones
# del modelo.

#  x1+2x2<=80    #Acero    Ecuación 1
# 3x1+2x2<=120   #Aluminio Ecuación 2
# Ax=b

A<-matrix(c(1,2,
            3,2), ncol = 2, nrow = 2, byrow = TRUE);A
b<-c(80,120);b
S<-solve(A,b);S

# Paso 4 Evaluar las soluciones para saber cuál es la que maximiza el modelo 

# Z=20000x1+15000x2

Z=20000*S[1]+15000*S[2];Z

# Paso 5 Concluir


# Para maximizar las utilidades, se deben de elaborar 20 bicicletas
# de 

A62<-matrix(c(12,15,
              2,2.5), nrow=2, ncol=2, byrow=TRUE);A62
b62<-c(-18,-3);b62
solve(A62,b62)




# 
#Ec.1
x1<-seq(0,80, by=1);x1
#Despejamos y de la ec.1
y1<-(-x1+80)/2;y1
plot(x1,y1, col='red', type='l', xlab='Número de Bicicletas de Paseo',
     ylab='Número de Bicicletas de Montaña'
     , main='Maximización de Pruducción de Bicicletas')
abline(h=0, v=0, col='black', pch=3)
#Graficamos la Ec.2 junto con la Ec.1
x2<-seq(0,40, by=1)
#Despejamos y de la ecuación 2
y2<-(120-3*x2)/2;y2
lines(x2,y2,col='green', type='l')


# x1=20, x2=30



set.seed(12345)                                   
x <- rnorm(50)   
plot(density(x), main = "")   
polygon(c(min(density(x)$x), density(x)$x),       
        c(0, density(x)$y),                       
        col = "#d94800") 





#Ejercicio 2.1


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación



#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación



#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación

# Ax=b
A<-matrix(c(1,-1, 
            2,1), nrow = 2, ncol = 2, byrow = TRUE);A

b<-c(4,2);b
solve(A,b)


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Evalúo la primera ecuación
y1<-2-2*x # Evalúo la segunda ecuación
plot(x,y, col='red', type='l') #Gráfico la primera ecuación
lines(x ,y1, col='blue', type='l') #Gráfico la primera ecuación





