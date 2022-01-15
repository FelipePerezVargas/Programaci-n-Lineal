# Análisis de redes usando R 
library(igraph)  

# Ejercicio Seervada Park

data<- read.csv("C:/Users/Admin/Desktop/Programacion_lineal/mnp.csv") 

g <- graph.data.frame(data, directed = FALSE)  
tkplot(g, edge.label = paste(E(g)$weight, sep = ""))  
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta') 
rglplot(g, layout=layout_on_grid(g, dim = 3))
sp <- shortest.paths(g, v = "SE", to = "LN")     
sp[]                                           
gsp <- get.shortest.paths(g, from = "SE", to = "LN")
V(g)[gsp$vpath[[1]]]                           
adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix['SE', 'LN'] 
allsp <- get.all.shortest.paths(g, from = "LN")
str(allsp)


data<- read.csv("C:/Users/Admin/Desktop/Programacion_lineal/mnp1.csv") 

g <- graph.data.frame(data, directed = FALSE)  
tkplot(g, edge.label = paste(E(g)$weight, sep = ""))  
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta') 
rglplot(g, layout=layout_on_grid(g, dim = 3))
sp <- shortest.paths(g, v = "A", to = "G")     
sp[]                                           
gsp <- get.shortest.paths(g, from = "A", to = "G")
V(g)[gsp$vpath[[1]]]                           
adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix['A', 'G'] 
allsp <- get.all.shortest.paths(g, from = "G")
str(allsp)






