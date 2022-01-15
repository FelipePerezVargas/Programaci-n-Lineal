#######################################
# Introducción a la programación en R #
#######################################

# Primeros pasos en R

# R sirvo como calculadora

4+3
4-3
4*3
4/3

# La forma de ejecutar una línea en R son de varias maneras la primera
# Seleccionas la línea que deseas ejecurar y presionas ctrl + enter
# Le segunda manera de ejecutar es la siguiente 
# Seleccionas la línea o líneas de código que desear ejecutar y deas click 
# en el boton de Run 


# Podemos asignar valores que puedan ser almacenados en la memoria de la pc

A<-4
B<-3



# Para imprimir el valor almacenado en las variables A y B se hace lo siguiente:

A<-4;A
(B<-3)
B<-3
B
print(B)

C<-A+B;C
C<-A-B;C
C<-A*B;C
C<-A/B;C

# Calcular la hipotenusa del teorema de Pitágoras

a<-30 #Cateto opuesto
b<-40 #Cateto adyacente
# el comando sqrt() te calcula la raíz cuadrada de lo que esta dentro del parentesis
# el doble ** equivale a la potencia a la que se desea alevar dicha cantidad
c<-sqrt(a**2+b**2)
print(paste('El valor de la hipotenusa es',c,'cm'))

# Calcula el volumen de una esfera 

pi # valor de pi

r<-1 #radio de la esfera 

V<-(4/3)*pi*r**3
print(paste('El valor de la esfera es',V,'cm'))

# Podemos instalar paquetes especializados

# La primera es usando el comando de 


# La otra manera es directo de la pestaña Packages


# Una vez instaladas los paquetes podemos agregarlos a nuestro código para
# poder utilizarlo
install.packages('MASS')
library(MASS)
install.packages('matlib')
library(matlib)

# Vamos a realizar un programita para resolver un sistema de ecuaciones de 3x3
# mediante el método gráfico y analítico 

# Existe un comando c() que sirve para almacenar números, letras,....etc

#c(1,2,3)
#Creamos la matriz A
A<-matrix(c(5,-2,1,
            2,5,-2,
            1,-4,3), nrow = 3,ncol = 3, byrow = TRUE)
#Creamos el vector b
b<-c(24,-14,26)

colnames(A)<-paste0('x',1:3)
showEqn(A,b)
solve(A,b, fractions=TRUE)
echelon(A, b, verbose=TRUE, fractions=TRUE)
showEig(A,b)
plotEqn3d(A,b)
gaussianElimination(A,b)

x <- c(2,1)
y <- c(1,1)
angle(x, y) # degrees
angle(x, y, degree = FALSE) # radians
# visually
xlim <- c(0,2.5)
ylim <- c(0,2)
# proper geometry requires asp=1
plot( xlim, ylim, type="n", xlab="X", ylab="Y", asp=1,
      main = expression(theta == 18.4))
abline(v=0, h=0, col="gray")
vectors(rbind(x,y), col=c("red", "blue"), cex.lab=c(2, 2))
text(.5, .37, expression(theta))

####
x <- c(-2,1)
y <- c(1,1)
angle(x, y) # degrees
angle(x, y, degree = FALSE) # radians
# visually
xlim <- c(-2,1.5)
ylim <- c(0,2)
# proper geometry requires asp=1
plot( xlim, ylim, type="n", xlab="X", ylab="Y", asp=1,
      main = expression(theta == 108.4))
abline(v=0, h=0, col="gray")
vectors(rbind(x,y), col=c("red", "blue"), cex.lab=c(2, 2))
text(0, .4, expression(theta), cex=1.5)

library(rgl)
vec <- rbind(diag(3), c(1,1,1))
rownames(vec) <- c("X", "Y", "Z", "J")
open3d()
aspect3d("iso")
vectors3d(vec, col=c(rep("black",3), "red"), lwd=2)
# draw the XZ plane, whose equation is Y=0
planes3d(0, 0, 1, 0, col="gray", alpha=0.2)
# show projections of the unit vector J
segments3d(rbind( c(1,1,1), c(1, 1, 0)))
segments3d(rbind( c(0,0,0), c(1, 1, 0)))
segments3d(rbind( c(1,0,0), c(1, 1, 0)))
segments3d(rbind( c(0,1,0), c(1, 1, 0)))
segments3d(rbind( c(1,1,1), c(1, 0, 0)))

# Vectores ortogonales
p1 <- c(0,0,0)
p2 <- c(1,1,0)
p3 <- c(1,1,1)
p4 <- c(1,0,0)
# show some angles
arc(p1, p2, p3, d=.2)
arc(p4, p1, p2, d=.2)
arc(p3, p1, p2, d=.2)

z <- 2 * volcano # Exaggerate the relief
x <- 10 * (1:nrow(z)) # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z)) # 10 meter spacing (E to W)


open3d()
id <- persp3d(x, y, z, aspect = "iso",
              axes = FALSE, box = FALSE, polygon_offset = 1)
contourLines3d(id) # "z" is the default function
filledContour3d(id, polygon_offset = 1, nlevels = 10, replace = TRUE)
# Draw longitude and latitude lines on a globe
lat <- matrix(seq(90, -90, len = 50)*pi/180, 50, 50, byrow = TRUE)
long <- matrix(seq(-180, 180, len = 50)*pi/180, 50, 50)
r <- 6378.1 # radius of Earth in km
x <- r*cos(lat)*cos(long)
y <- r*cos(lat)*sin(long)
z <- r*sin(lat)
open3d()
ids <- persp3d(x, y, z, col = "white",
               texture = system.file("textures/worldsmall.png", package = "rgl"),
               specular = "black", axes = FALSE, box = FALSE, xlab = "", ylab = "", zlab = "",
               normal_x = x, normal_y = y, normal_z = z, polygon_offset = 1)
contourLines3d(ids, list(latitude = function(x, y, z) asin(z/sqrt(x^2+y^2+z^2))*180/pi,
                         longitude = function(x, y, z) atan2(y, x)*180/pi))



# trefoil knot
open3d()
theta <- seq(0, 2*pi, len = 25)
knot <- cylinder3d(
  center = cbind(
    sin(theta) + 2*sin(2*theta),
    2*sin(3*theta),
    cos(theta) - 2*cos(2*theta)),
  e1 = cbind(
    cos(theta) + 4*cos(2*theta),
    6*cos(3*theta),
    sin(theta) + 4*sin(2*theta)),
  radius = 0.8,
  closed = TRUE)
shade3d(addNormals(subdivision3d(knot, depth = 2)), col = "green")


open3d()
x <- rnorm(100)
y <- rnorm(100)
z <- 0.2*x - 0.3*y + rnorm(100, sd = 0.3)
fit <- lm(z ~ x + y)
plot3d(x, y, z, type = "s", col = "red", size = 1)

coefs <- coef(fit)
a <- coefs["x"]
b <- coefs["y"]
c <- -1
d <- coefs["(Intercept)"]
planes3d(a, b, c, d, alpha = 0.5)


open3d()
ids <- plot3d(x, y, z, type = "s", col = "red", size = 1, forceClipregion = TRUE)
oldid <- useSubscene3d(ids["clipregion"])
clipplanes3d(a, b, c, d)
useSubscene3d(oldid)


open3d()
plot3d( cube3d(col = "pink") )
M <- par3d("userMatrix")
if (!rgl.useNULL())
  play3d( par3dinterp(time = (0:2)*0.75,
                      userMatrix = list(M,
                                        rotate3d(M, pi/2, 1, 0, 0),
                                        rotate3d(M, pi/2, 0, 1, 0) ) ),
          duration = 3 )

movie3d( spin3d(), duration = 5 )







open3d()
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
plot3d(x, y, z, col = rainbow(1000))
fit <- lm(z ~ x + y)
coefs <- coef(fit)
a <- coefs["x"]
b <- coefs["y"]
c <- -1
d <- coefs["(Intercept)"]
planes3d(a, b, c, d, alpha = 0.5)



sample(10,2,replace = FALSE)
########################################################################
###                        Ejercicio 1                               ###
########################################################################
#??????????????????.????????????




