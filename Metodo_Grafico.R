

#### Ejemplo del soluci�n de un Modelo de Programaci�n Lineal usando R ####

# La f�brica de Hilados y Tejidos requiere fabricar dos tejidos de calidad diferente
# T1 y T2;
#se dispone de  
#500 Kg de hilo A,
#300 Kg de hilo B y
#108 Kg de hilo C.
# Para obtener un metro de T1 diariamente se necesitan
#125 gr de A,  
#150 gr de B y
#72 gr de C; 
#para producir un metro de T2 por d�a se necesitan
#200 gr de A, 
#100 gr  de B
#27 gr de C.
#El T1 se vende a $4000 el metro  
#y el T2 se vende a $5000 el metro.
# Plantear o dise�ar el modelo.
# Si se debe obtener el m�ximo beneficio, �cu�ntos metros de T1 y T2 se deben fabricar?

# Dise�o del modelo####
# T1 = x1  Cantidad de metros diarios de tejido tipo T1 a fabricar####
# T2 = x2  Cantidad de metros diarios de tejido tipo T2 a fabricar 

# Ecuaciones ####
# 0.125x1 + 0.2x2   <= 500 Hilo A    ------ Ec1
# 0.15x1  + 0.1x2   <= 300 Hilo B    ------ Ec2 
# 0.072x1 + 0.027x2 <= 108 Hilo C    ------ Ec3

# z=4000x1+5000x2   Maximizar
# Cumplir la restricci�n de no negatividad x1, x2 >= 0

# Lo primero que tenemos que hacer es encontrar el intercepto ####
# para esto se recomienda hacer x1 = 0 para encontrar la ordenada al origen para cada 
# ecuaci�n 

# Ecuaci�n 1 ####

# 0.2x2=500
# x2=500/0.2=2500

# Ecuaci�n 2 ####
# 
# 0.1x2=300
# x2=300/0.1=3000

# Ecuaci�n 3 ####
# 
# 0.027x2=108
# x2=108/0.027=4000


#Ahora calculamos la ra�z de cada ecuaci�n, esto se logra haciendo x2=0 ####
# en cada una de las ecuaciones como se hizo anteriormente

# Ecuaci�n 1 ####
# 0.125x1=500
# x1=500/0.125=4000
# Ecuaci�n 2 ####
# 0.15x1=300
# x1=300/0.15=2000
# Ecuaci�n 3 ####
# 0.072x1=108
# x1=108/0.072=1500

# Ahora podemos hacer una tabla para las coordenadas de cada ecuaci�n de la manera ####
# siguiente:

# Ecuaci�n 1 ####
#                    | x1   |   x2  |
# Primera coordenada | 0    |  2500 | Intercepto
# Segunda Coordenada | 4000 |  0    | Ra�z

# Ecuaci�n 2 ####
  #                    |   x1 |   x2  |
  # Primera coordenada |   0  | 3000  | Intercepto
  # Segunda Coordenada | 2000 |   0   | Ra�z
# Ecuaci�n 3 ####
  #                    |  x1   |  x2   |
  #                    |_______|_______|
  # Primera coordenada |   0   | 4000  | Intercepto
  #                    |_______|_______|
  # Segunda Coordenada |  1500 |  0    | Ra�z
  #                    |_______|_______|

# Una vez que encontramos las coordenadas debemos de graficarlas en el plano ####
# respetando la restricci�n de que x1 y x2 >= 0

# Ahora despejamos x2 de la ecuaci�n ####
# Ecuaci�n 1 ####
# Para crear la secuencia usamos los valores de la ra�z
x11<-seq(0,4000, by=0.1)
x21<-(500-0.125*x11)/0.2
plot(x11,x21, type='l', col='red', ylim=c(0,4100), xlim=c(0,4100))
abline(h=0, v=0, lty=3, col='gray') # Dibujamos la l�nea de origen 
points(0,2500, col='red') # Dibujamos el intercepto
points(4000,0, col='red') # Dibujamos la ra�z


# Ecuaci�n 2 ####

x12<-seq(0,2000, by=0.1)
x22<-(300-0.15*x12)/0.1
lines(x12,x22, lty=1, col='blue') # Se agrega a la gr�fica anterior
points(0,3000, col='blue') # Dibujamos el intercepto
points(2000,0, col='blue') # Dibujamos la ra�z

# Ecuaci�n 3 ####

x13<-seq(0,1500, 0.1)
x23<-(108-0.072*x13)/0.027
lines(x13,x23, lty=1, col='green') # Se agrega a la gr�fica anterior
points(0,4000, col='green') # Dibujamos el intercepto
points(1500,0, col='green') # Dibujamos la ra�z


# Ahora podemos resolver el sistema de ecuaciones que maximize el problema
# Para esto debemos debemos de usar la forma Ax=b y usamos el comando solve para
# encontrar los valores de x1 y x2 para saber donde tiene soluci�n el sistema de ecuaciones

# Soluci�n de las ecuaciones 1 y 2 ####
# 0.125x1 + 0.2x2   = 500   Hilo A
# 0.15x1 + 0.1x2    = 300   Hilo B
# Formamos  A ####
# Resolvemos el sistema de la forma Ax=b
A1<-matrix(c(0.125, 0.2,
             0.150, 0.1), ncol=2, nrow=2, byrow = TRUE);A1
b1<-c(500, 300)
S1<-solve(A1,b1);S1
#Evaluamos en la funci�n a maximizar
# Z1<-4000*x1+5000*x2;Z1
Z1<-4000*S1[1]+5000*S1[2];Z1
Z1<-4000*571.4286+5000*2142.8571;Z1
# 0.125x1 + 0.2x2   = 500   Hilo A
# 0.072x1 + 0.027x2 = 108   Hilo C
# Soluci�n de las ecuaciones 1 y 3 ####
A2<-matrix(c(0.12, 0.2,
             0.072,0.027), ncol=2, nrow=2, byrow = TRUE);A2
b2<-c(500, 108)
S2<-solve(A2,b2);S2
Z2<-4000*725.8065+5000*2064.516;Z2
# 0.15x1 + 0.1x2    = 300   Hilo B
# 0.072x1 + 0.027x2 = 108   Hilo C
#Ax=b
# Soluci�n de las ecuaciones 2 y 3 ####
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
# Soluci�n 1/Ra�z ec1   |       |      |              |  si |  si |  si |    si  |
# --------------------------------------------------------------------------------
# Soluci�n 2/inter ec1  |  0    | 10   |       50     |  si |  si |  no |    no  |
# --------------------------------------------------------------------------------
# Soluci�n 3/Ra�z ec2   |  10   |  0   |       30     |  no |  si |  no |    no  |
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



# Finalmente podemos crear nuestro gr�fico de resultados finales ####
x11<-seq(0,4167, by=0.1)
x21<-(500-0.12*x11)/0.2
plot(x11,x21, type='l', col='red', ylim=c(0,4100), xlab='Tejido 1', ylab='Tejido 2',
     main='Soluci�n M�todo Gr�fico para la producci�n de Tejidos A y B')
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

# Ahora trazamos las �reas de an�lisis ####

    

plot(10, 10, xlim = c(0, 4000), ylim = c(0, 4100), 
     col = "gray",main='Soluci�n M�todo Gr�fico',
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
text(x=500,y=1000, 'Regi�n\n de \n Soluci�n') 























# Ecuaci�n 1 Horas de ensamble  ####
#2x1+x2<=10

# Ecuacion 2 horas de pintura ####
#x1+2x2<=8

# Funci�n a maximizar  ####
# Z=20000x1+10000x2

# Paso 1: encontrar el intercepto y la ra�z para cada una de las ecuaciones ####
# Para encontrar el intercepto hacemos x1=0 en cada una de las ecuaciones y despejamos 
# x2, el valor de x2 es el intercepto

#Ecuaci�n 1 
#si  x1=0
# x2<=10
# Para encontrar la ra�z hacemos x2=0 en cada una de las ecuaciones y despejamos 
# x1, el valor de x1 corresponde a la ra�z
# si x2=0
# 2x1<=10
# x1=5
#                    | x1   |   x2  |
# Primera coordenada | 0    |  10   | Intercepto
# Segunda Coordenada | 5    |  0    | Ra�z
#Ecuaci�n 2
#x1+2x2<=8

#                    | x1   |   x2  |
# Primera coordenada | 0    |  4   | Intercepto
# Segunda Coordenada | 8    |  0    | Ra�z

# Paso 2: Graficar el sistema de ecuaciones removiendo las restricciones  ####
# Gr�fica Ecuaci�n 1
#2x1+x2<=10
x11<-seq(0,5, by=0.1);x11 # Para graficar usamos los valores de la ra�z
# Despejamos x2 de la ecuaci�n 1
x21<-10-2*x11;x21
# Gr�fica Ecuaci�n 1
plot(x11, x21, col='red', type='l')
abline(h=0, v=0, col='gray', pch=3)

# Graficamos la ecuaci�n 2 junto con la ecuaci�n 1
x12<-seq(0,8, by=0.1);x12
# Despejamos x2 de la ecuaci�n 2
# x1+2x2<=8
x22<-(8-x12)/2;x22
lines(x12, x22, col='green', type='l')
points(0,10, col='red') #Intercepto ecuaci�n 1
points(5,0, col='red') # Ra�z ecuaci�n 1
points(0,4, col='green') #Intercepto ecuaci�n 2
points(8,0, col='green') # Ra�z ecuaci�n 2


# Paso 3: Resolver el sistema de ecuaciones  Ax=b ####
#2x1+ x2<=10
# x1+2x2<=8
# Construimos la matriz A
A<-matrix(c(2, 1,
            1,2), ncol=2, nrow=2, byrow = TRUE );A
# Construimos la matriz b
b<-c(10, 8)
# Encontramos la soluci�n con el comando solve
S<-solve(A, b);S



# Paso 4: Sustituir los valores en la funci�n objetivo para conocer el m�ximo ####
# beneficio

# Z=20000x1+10000x2
Z<-20000*S[1]+10000*S[2];Z
points(4,2,col='black', pch=12)



# Paso 5: Concluir ####

# ???????????? Para maximizare la ganancia se deben de elaborar 4 mesas del modelo A
# y 2 mesas del modelo B ????????????



# Ejercicio 2






























# Ecuaci�n 1 #### 
#2x1+x2=10 
#
#                    | x1   |   x2  |
# Primera coordenada | 0    |  10   | Intercepto
# Segunda Coordenada | 5    |  0    | Ra�z

# Ecuaci�n 2 #### 
#x1+2x2=8
#                    |   x1 |   x2  |
# Primera coordenada |   0  |   4   | Intercepto
# Segunda Coordenada |   8  |   0   | Ra�z

# Ecuaci�n 1 ####
# Para crear la secuencia usamos los valores de la ra�z
x11 <-   seq(0,5, by=0.1);x11
x21 <- 10-2*x11;x21
plot(x11,x21, type='l', col='violet', ylim=c(0,11), xlim=c(0,6))
abline(h=0, v=0, lty=3, col='gray') # Dibujamos la l�nea de origen 
points(0,10, col='violet') # Dibujamos el intercepto
points(5,0, col='violet') # Dibujamos la ra�z


# Ecuaci�n 2 #### 
#x1+2x2=8
# Despejo la ecuaci�n x2 de la ecuaci�n 2
#x2=(8-x1)/2
x12<-seq(0,8, by=0.1)
x22<-(8-x12)/2
lines(x12,x22, lty=1, col='blue') # Se agrega a la gr�fica anterior
points(0,4, col='blue') # Dibujamos el intercepto
points(8,0, col='blue') # Dibujamos la ra�z
points(4,2,col='red')

#Resolvemos el sistema de ecuaciones para encontrar el posible valor 
#que nos maximize la utilidad
#2 x1+x2=10
#x1+2x2=8
A1<-matrix(c(2, 1,
             1, 2), ncol=2, nrow=2, byrow = TRUE);A1
b1<-c(10, 8)
S1<-solve(A1,b1);S1

print(paste('La soluci�n del sistema es ', S1[1],'y',S1[2], 
            'que maximiza la utilidad'))
# Evaluar la soluci�n para saber cual es la m�xima utilidad de acuerdo al 
#n�mero de piezas producidas

Z1=20000*S1[1]+10000*S1[2];Z1
Z1=20000*4+10000*2;Z1
Z1=20000*5;Z1


#Para maximizar la utilidad se deben producir 4 piezas del modelo A y
# 2 piezas del modelo B, cualquier otra combinaci�n la utilidad va a ser 
# menor

# x1+x2<=150 Ecuaci�n 1
# x1<=120 Ecuaci�n 2
# x2<= 100 Ecuaci�n 3
# Z=5*x1+7*x2





# Soluci�n ejercicio 2


# Un estudiante dedica parte de su tiempo al reparto de propaganda
# publicitaria. La empresa A le paga $5 por cada impreso repartido y
# la empresa B, con folletos m�s grandes, le paga $7 por impreso. El
# estudiante lleva dos bolsas: una para los impresos A, en la que
# caben 120 y otra para los impresos B, en la que caben 100. Ha
# calculado que cada d�a es capaz de repartir 150 impresos como
# m�ximo. Determine el modelo adecuado.




# Z=5x1+7x2  Maximizar
# x1<=120       Ecuaci�n 1  Intercepto
# x2<=100       Ecuaci�n 2  Ra�z
# x1+x2<=150    Ecuaci�n 3
# con x1, x2>=0 

# Paso 1 Encontrar el intercepto y la ra�z 

# Ecuaci�n 1

# Valor constante en x1=120
# Ecuaci�n 2

# Valor constante en x2=100

# Ecuaci�n 3


#                    | x1   |   x2  |
# Primera coordenada | 0    |  150  | Intercepto
# Segunda Coordenada | 150    |  0    | Ra�z


# Paso 2 Graficar los sistemas de ecuaciones

# Ecuaci�n 3
x13<-seq(0,150, by=1);x13
x23<-150-x13;x23

plot(x13,x23, col='red', type='l') #Gr�fica Ecuaci�n 3
abline(h=0, v=0, col='gray', lty=3) #Eje de referencia
abline(h=100, col='green') # Ecuaci�n 1
abline(v=120, col='yellow') # Ecuaci�n 2
points(120,100)
points(120,30)
points(50,100)
# Paso 3 Encontrar las soluciones de los sistemas 
# 
# Soluci�n del sistema 12

# x1<=120       Ecuaci�n 1  Intercepto
# x2<=100       Ecuaci�n 2  Ra�z

#  La soluci�n 1 es (120,100)
# Soluci�n del sistema 13

# x1<=120       Ecuaci�n 1  
# x1+x2<=150    Ecuaci�n 3

#  La soluci�n 2 es (120,30)
# Soluci�n del sistema 23


# x2<=100       Ecuaci�n 2  Ra�z
# x1+x2<=150    Ecuaci�n 3
#  La soluci�n 3 es (50,100)

# Paso 4  Evaluar las soluci�nes en la ecuaci�n objetivo 

# Z1<-=5*x1+7*x2 #Maximizaci�n 1 
# Z1=1300 Se descarta porque NO cumple con las restricciones

# Z2<-=5x1+7x2 #Maximizaci�n 2 
# z2=810

# Z3<-=5x1+7x2  Maximizaci�n 3
# Z3=950
#  La soluci�n 3 es (50,100)

# Paso 5  Conclusi�n 

# Para obtener el mayor beneficio se deben de repartir 50 volantes del tipo
# y 100 volantes del tipo B











# x1 impreso A
# x2 impreso B
# x1+x2<=150 Ecuaci�n 1
# x1<=120    Ecuaci�n 2
# x2<=100    Ecuaci�n 3
# Z=5x1+7x2 Mazimizar


# Paso 1
# Equaci�n 1
# s1 x1=0 
# x1+x2=150
# x2=150
# Si x2= 0
# x1=150

#                    | x1   |   x2  |
# Primera coordenada | 0    |  150  | Intercepto
# Segunda Coordenada | 150  |  0    | Ra�z

# Ecuaci�n 2
# si x1=0
# x1=120
# Ecuaci�n 3
# x2=100


# Paso 2

# graficamos las ecuaciones

# Ecuaci�n 1


x11<-seq(0,150, by=1);x11

# Despejamos x2 de la ecuaci�n 1

x21<-150-x11;x21

plot(x11, x21, col='red', type='l', xlab='')
abline(h=0, v=0, type='l', col='gray')
abline(h=100, type='l', col='blue') # Graficar una constante horizonta x2
abline(v=120, type='l', col='green') # Graficar una constante vertical x1

# Resolvemos los sistemas de ecuaciones

# Soluci�n ecuaci�n 12
# x1 impreso A
# x2 impreso B

# x1+x2<=150 Ecuaci�n 1
# x1<=120    Ecuaci�n 2
# x2<-150-120
# Soluci�n 1 x1=120, x2=30

# Evaluamos en la funci�n 
# Z=5x1+7x2 Maximizar
Z1<-5*120+7*30;Z1

# Utilidad 810

# Soluci�n ecuaci�n 13
# x1 impreso A
# x2 impreso B
# x1+x2<=150 Ecuaci�n 1
# x2<=100    Ecuaci�n 3

# Soluci�n x1=50, x2=100
# Z=5x1+7x2 Mazimizar
#  950 Utilidad


# Soluci�n ecuaci�n 23

# x1 impreso A
# x2 impreso B
# x1<=120    Ecuaci�n 2
# x2<=100    Ecuaci�n 3

# Z=5x1+7x2 Maximizar
# 1300 de utilidad

# Conclusi�n

# Para obtener mayor utilidad se deben de repartir 120 impresos del modelo A
# y 100 impresos del modelo B



# Ejercicio 3

# Z=20000x1+15000x2
#  x1+2x2<=80    #Acero    Ecuaci�n 1
# 3x1+2x2<=120   #Aluminio Ecuaci�n 2 

# Paso 1


# Paso 1 encontrar las ra�z e intercepto de cada ecuaci�n

#Ecuaci�n 1
#                    | x1   |   x2  |
# Primera coordenada | 0    |  40   | Intercepto
# Segunda Coordenada | 80   |  0    | Ra�z

#Ecuaci�n 2
#                    | x1   |   x2  |
# Primera coordenada | 0    |  60   | Intercepto
# Segunda Coordenada | 40   |  0    | Ra�z

# Paso 2 Graficar el sistema de ecuaciones 
# Gr�fica ecuaci�n 1
x11<-seq(0,80, by=1);x11
x21<-(80-x11)/2;x21

# Gr�fica ecuaci�n 2
x12<-seq(0,40,by=1)
x22<-(120-3*x12)/2

# Paso 3 Resolver el sistema de ecuaciones para encontrar las posibles soluciones
# del modelo.

#  x1+2x2<=80    #Acero    Ecuaci�n 1
# 3x1+2x2<=120   #Aluminio Ecuaci�n 2
# Ax=b

A<-matrix(c(1,2,
            3,2), ncol = 2, nrow = 2, byrow = TRUE);A
b<-c(80,120);b
S<-solve(A,b);S

# Paso 4 Evaluar las soluciones para saber cu�l es la que maximiza el modelo 

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
plot(x1,y1, col='red', type='l', xlab='N�mero de Bicicletas de Paseo',
     ylab='N�mero de Bicicletas de Monta�a'
     , main='Maximizaci�n de Pruducci�n de Bicicletas')
abline(h=0, v=0, col='black', pch=3)
#Graficamos la Ec.2 junto con la Ec.1
x2<-seq(0,40, by=1)
#Despejamos y de la ecuaci�n 2
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
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n



#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n



#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n

# Ax=b
A<-matrix(c(1,-1, 
            2,1), nrow = 2, ncol = 2, byrow = TRUE);A

b<-c(4,2);b
solve(A,b)


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n


#Ejercicio 2.2


# x-y=4 Ec. 1
#2x+y=2 Ec. 2

x<-seq(1,3,by=1);x  #Creo una secuencia para x
y<-x-4  #Eval�o la primera ecuaci�n
y1<-2-2*x # Eval�o la segunda ecuaci�n
plot(x,y, col='red', type='l') #Gr�fico la primera ecuaci�n
lines(x ,y1, col='blue', type='l') #Gr�fico la primera ecuaci�n





