############################################################
###                                                      ###  
###                 Solución Examen  1                   ###
###                                                      ###
############################################################



### Ejecicio 1

# La empresa de Muebles Patito fabrica mesas y sillas de comedor. 
# Cada silla necesitas
# 20 pies de tabla 
# y 4 horas de trabajo. 
# Cada mesa, 
# 50 pies de tabla
# y 3 horas
# de trabajo. El fabricante tiene 
# 3300 pies de tabla de madera disponible
# y un equipo humano capaz de proporcionar 
# 380 horas de trabajo. Por último, el 
# fabricante ha determinado que hay una de 
# $\$3$ por cada silla vendida 
# y $\$6$ # por cada mesa vendida.
#   ¿Cuántas mesas y sillas se deben de producir 
# para maximizar las utilidades, suponiendo que se vende todo el objeto producido?


# Función a maximizar 
# 3x1+6x2=Z
# Restricciones
# 20x1+50x2<= 3300 Madera
# 4x1+3x2<= 380    Mano de obra


# Ejercicio 2

# Función a maximizar 
# 2x1+8x2=Z
# Restricciones
# 20x1+50x2<= 3150 Madera
# 4x1+3x2<= 385    Mano de obra




library(lpSolve)
# Parametros del problema
coef <- c(2, 8)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3150, 385)
solve(A,b)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution

# Ejercicio 3

# Función a maximizar 
# 5x1+5x2=Z
# Restricciones
# 20x1+50x2<= 3200 Madera
# 4x1+3x2<= 390    Mano de obra

# Parametros del problema
coef <- c(5, 5)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3200, 390)
solve(A,b)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution



# Ejercicio 4

# Función a maximizar 
# 5x1+5x2=Z
# Restricciones
# 20x1+50x2<= 3200 Madera
# 4x1+3x2<= 390    Mano de obra

# Parametros del problema
coef <- c(8, 4)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3000, 360)
solve(A,b)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution



# Ejercicio 5

# Función a maximizar 
# 8x1+2x2=Z
# Restricciones
# 20x1+50x2<= 3500 Madera
# 4x1+3x2<= 400    Mano de obra

# Parametros del problema
coef <- c(8, 2)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3500, 400)
solve(A,b)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution

# Ejercicio 6

# Un lago de montaña en una parque nacional tiene en la primavera de cada año
# dos especies $S_{1}$ y $S_{2}$. 
# El peso promedio de cada pez en el lago es de 
# 4 libras para $S_{1}$ 
# y de 2 libras para $S_{2}$. 
# Se dispone de 2 tipos de alimentos, $F_{1}$ y $F_{2}$.
# Las necesidades promedio de un pez de especie
# $S_{1}$ son de 1 unidad de $F_{1}$ 
# y 3 unidades de $F_{2}$ diariamente. Las 
# necesidades correspondientes de 
# $S_{2}$ son de 2 unidades de$F_{1}$ y 1 
# unidad de $F_{2}$. 
# Si se cuenta con 500 unidades de $F_{1}$ 
# y 900 unidades de
# $F_{2}$ por día, ¿Cómo debe de ser la cantidad de peces de cada clase para 
# maximizar al peso de pescado que se pueda producir?

# Función a maximizar 
# 4x1+2x2=Z
# Restricciones
# x1+2x2<= 500    Alimento 1
# 3x1+x2<= 900    Alimento 2

# Parametros del problema
coef <- c(4, 2)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3000, 360)
solve(A,b)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution






library(lpSolve)
# Parametros del problema
coef <- c(3, 6)
A <- matrix(c(20, 50, 
              4, 3), ncol=2, nrow = 2, byrow = 2)
b <- c(3300, 380)
dir <- rep('<=', 2)
# Solucion
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution


# Ejercicio 2
# Función a maximizar 
# 2x1+8x2=Z
# Restricciones
# 20x1+50x2<= 3150   Madera
#  4x1+ 3x2<= 385    Mano de obra


# Ejercicio 3

# Función a maximizar 
# 5x1+5x2=Z
# Restricciones
# 20x1+50x2<= 3100   Madera
#  4x1+ 3x2<= 370    Mano de obra

# Ejercicio 4 
# Función a maximizar 
# 8x1+4x2=Z
# Restricciones
# 20x1+50x2<= 3500   Madera
#  4x1+ 3x2<= 400    Mano de obra


# Ejercicio 5
# Función a maximizar 
# 8x1+2x2=Z
# Restricciones
# 20x1+50x2<= 3500   Madera
#  4x1+ 3x2<= 400    Mano de obra

# Ejercicio 6

# Función a maximizar 
# Z=4x1+2x2
# Restricciones 
#  x1+2x2<=500 Alimento F1
# 3x1+ x2<=900 Alimento F2
coef <- c(4, 2)
A <- matrix(c(1, 2, 
              3, 1), ncol=2, nrow = 2, byrow = 2)
b <- c(500, 900)
solve(A,b)
dir <- rep('<=', 2)
# Solución
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution
solucion$direction
solucion$objective
solucion$constraints


# Ejercicio 7  
# Función a maximizar 
# Z=3x1+3x2
# Restricciones 
# x1+2x2<=1000 Alimento F1
# 3x1+x2<=1800 Alimento F2


coef <- c(3, 3)
A <- matrix(c(1, 2, 
              3, 1), ncol=2, nrow = 2, byrow = 2)
b <- c(1000, 1800)
solve(A,b)
dir <- rep('<=', 2)
# Solución
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution
solucion$direction
solucion$objective
solucion$constraints



# Ejercicio 8
# Función a maximizar 
# Z=2x1+4x2
# Restricciones 
# x1+2x2<=1000 Alimento F1
# 3x1+x2<=1000 Alimento F2

coef <- c(2, 4)
A <- matrix(c(1, 2, 
              3, 1), ncol=2, nrow = 2, byrow = 2)
b <- c(1000, 1000)
solve(A,b)
dir <- rep('<=', 2)
# Solución
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution
solucion$direction
solucion$objective
solucion$constraints


# Ejercicio 9
# Función a maximizar 
# Z=3x1+2x2
# Restricciones 
# x1+2x2<=1500 Alimento F1
# 3x1+x2<=900  Alimento F2


coef <- c(3, 2)
A <- matrix(c(1, 2, 
              3, 1), ncol=2, nrow = 2, byrow = 2)
b <- c(1500, 900)
solve(A,b)
dir <- rep('<=', 2)
# Solución
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution




# Ejercicio 10
# Función a maximizar 
# Z=5x1+3x2
# Restricciones 
# x1+2x2<=750 Alimento F1
# 3x1+x2<=1500 Alimento F2


coef <- c(5, 3)
A <- matrix(c(1, 2, 
              3, 1), ncol=2, nrow = 2, byrow = 2)
b <- c(750, 1500)
solve(A,b)
dir <- rep('<=', 2)
# Solución
solucion <- lp('max', coef, A, dir, b);solucion
solucion$solution

