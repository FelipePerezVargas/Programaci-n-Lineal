####################################################
####                                            ####
####         Solución Método Gráfico            ####
####                                            ####
####################################################

# Crear una matriz 
# Definimos el comando c() este comando sirve para asociar, concatenar una colección 
# de números

c(1,2,3,4)

x<-c(1,2,3,4,5,6,7,8,9)

#Vamos a crear una matriz de 3x3 llenada por columnas

A<-matrix(x, ncol=3,nrow = 3, byrow=FALSE);A

#Vamos a crear una matriz de 3x3 llenada por filas

A<-matrix(x, ncol=3,nrow = 3, byrow=TRUE);A

# Operaciones matrices

# Transpuesta

t(A)

# Determinante

det(A)

# Inversa de una matriz

solve(A)

# Para escoger una columna A[,número de columna]
# Para escoger una columna A[número de fila,]

# Selección de columnas
A[,1]
A[,2]
A[,3]

# Selección de filas

A[1,]
A[2,]
A[3,]


# Cargar la base de datos de Tesla

tesla



pcierre<-tesla[,5];pcierre
plot(pcierre, pcierre)

x<-seq(1,10,by=0.1)
plot(x,x)




A<-matrix(c(5,-2,1,
            2,5,-2,
            1,-4,3), nrow = 3,ncol = 3, byrow = TRUE)
#Creamos el vector b
b<-c(24,-14,26)

# Resolvemos el sistema de ecuaciones con el comando solve() Ax=b
solve(A,b)

# Calcular la transpuesta de la matriz A
A
t(A)

# Calcular la inversa de la matriz A

solve(A)

# Calcular el determinante de la matriz A

det(A)

B<-matrix(c(1,-2,1,
            2,5,-2,
            1,-4,3), nrow = 3,ncol = 3, byrow = TRUE)

det(B)

C<-matrix(c(1,-3,2,
            5,6,-1,
            4,-1,3), nrow = 3,ncol = 3, byrow = TRUE)

solve(C)

####################################################
####                                            ####
####   Introducción a los graficos usando R     ####
####                                            ####
####################################################

# Creamos una secuencia de número para evaluar una función 
# El comando seq() esta compuesto de tres parámetros 
# Inicio # Fin # Paso
x<-seq(-3,7, by=1);x
y<- -x/3+2;y


plot(x,y, main = '', xlab = '', ylab = '', type='l')

B<-matrix(c(x1, x21,x22,x23), ncol=4)
B<-data.frame(B);B
colores <- c("Ec1" = "blue", "Ec2" = "red", "Ec3" = "orange")
p<-ggplot(B, aes(x=x1)) +
  geom_line(aes(y=x21), color = "blue") + 
  geom_line(aes(y=x22), color = "red") +
  geom_line(aes(y=x23), color = "orange") +
  labs(x = "x1", y = "x2", color = "colores") +
  scale_color_manual(values = colores)
p
ggplotly(p)



ibrary(ggplot2)
colors <- c("Sepal Width" = "blue", "Petal Length" = "red", "Petal Width" = "orange")

ggplot(iris, aes(x = Sepal.Length)) +
  geom_line(aes(y = Sepal.Width, color = "Sepal Width"), size = 1.5) +
  geom_line(aes(y = Petal.Length, color = "Petal Length"), size = 1.5) +
  geom_line(aes(y = Petal.Width, color = "Petal Width"), size = 1.5) +
  labs(x = "Year",
       y = "(%)",
       color = "Led") +
  scale_color_manual(values = colors)









