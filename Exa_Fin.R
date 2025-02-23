################################################
####                                        ####
####   Examen Final M�todos Cuantitativos   ####
####                                        ####
################################################

#Para acceder a librer�as que tengan operaciones especificas 
library(igraph)

re2<-matrix(c(r2$Desde, r2$Hasta, r2$weight_4), ncol=3)  
colnames(re2)<-c('Desde', 'Hasta', 'weight')
g <- graph.data.frame(re2, directed = FALSE)  
#Calculo del valor de la ruta m�s corta entre 1 y 9
sp <- shortest.paths(g, v = '1', to = '9')
print(paste('La distancia m�s corta entre 1 y 9 es de ',sp, 'unidades'))                                           
#Recorrido por la ruta m�s corta o Disjktra
gsp <- get.shortest.paths(g, from = "1", to = "9")
gsp$vpath
print(paste('Pasa por',gsp$vpath))
#Calculo de la matriz de distancias
adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj
# Soluci�n usando el m�todo de Floyd
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix['1', '9'] 
#Obtenci�n de todas las rutas posibles de 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)
