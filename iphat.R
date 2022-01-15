# Análisis de redes usando R 
library(igraph)  
# Crear una tabla de datos manualmente ####
data1 <- edit(data.frame()) # Crear una tabla de datos que sea data frame



# Cargar un archivo .csv desde la pestaña de comando Import Data ####
# Cargar un archivo .csv selecionando manualmente la ruta donde se encuentra ubicado ####
data1 <- read.csv("C:/Users/Admin/Desktop/Programacion_lineal/Programacion_Lineal/rmc1.csv") 



### Entorno gráfico ####
g <- graph.data.frame(data1, directed = FALSE)  # Crea un objeto llamado igraph 
class(g)                                     # Comprobamos la clase del objeto
V(g)$name                                    # Nombres de los nodos
E(g)$weight                                  # Peso de las aristas
tkplot(g, edge.label = paste(E(g)$weight, sep = ""))  # Gráfico dinámico, sólo sirve para visualización
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta') # Crea un gráfico de la red y nodos
rglplot(g, layout=layout_on_grid(g, dim = 3))



g <- graph.data.frame(data2, directed = FALSE) 
plot(g, edge.label = paste(E(g)$weight, sep = ""), 
     main='Ruta mas corta', vertex.label.color='red',
     vertex.color="green", edge.color="pink", vertex.frame.color="yellow")

# Una vez que podemos generar redes podemos calcular las caminos más cortos
# Camino más corto entre 1 y 5 ####
sp <- shortest.paths(g, v = "1", to = "5")     
sp[]                                           # Nos dice cual es el valor de la distancia más corta
gsp <- get.shortest.paths(g, from = "1", to = "5")
V(g)[gsp$vpath[[1]]]                           # Nos muestra la secuencia de vértices a recorrer


# Calcula la ruta más corta del ejercicio anterior de 1 a 4 y de 5 a 3
sp <- shortest.paths(g, v = "1", to = "4")     
sp[]                                           # Nos dice cual es el valor de la distancia más corta
gsp <- get.shortest.paths(g, from = "1", to = "4")
V(g)[gsp$vpath[[1]]] 

sp <- shortest.paths(g, v = "5", to = "3")     
sp[]                                           # Nos dice cual es el valor de la distancia más corta
gsp <- get.shortest.paths(g, from = "5", to = "3")
V(g)[gsp$vpath[[1]]] 


adj <- get.adjacency(g, attr='weight', sparse = FALSE) #Nos muestra la matriz adjacente
adj
# Matriz de distancias ####
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix[1, 5] 
# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)

##### Ejercicio 2 #####

data1 <- edit(data.frame()) 
g <- graph.data.frame(data1, directed = FALSE)
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta')
sp <- shortest.paths(g, v = "1", to = "5")     
sp[]                                          
gsp <- get.shortest.paths(g, from = "1", to = "5")
V(g)[gsp$vpath[[1]]]                          


##### Ejercicio 3 #####

data3 <- edit(data.frame()) 
g3 <- graph.data.frame(data3, directed = FALSE)
plot(g3, edge.label = paste(E(g3)$weight, sep = ""), main='Ruta mas corta')
sp <- shortest.paths(g3, v = "1", to = "6")     
sp[]                                          
gsp <- get.shortest.paths(g3, from = "1", to = "6")
V(g3)[gsp$vpath[[1]]]                          

#### 

data4 <- edit(data.frame()) 
g4 <- graph.data.frame(data4, directed = FALSE)
plot(g4, edge.label = paste(E(g4)$weight, sep = ""), main='Ruta mas corta')
sp <- shortest.paths(g4, v = "1", to = "6")     
sp[]                                          
gsp <- get.shortest.paths(g4, from = "1", to = "6")
V(g4)[gsp$vpath[[1]]]                          



#### Ejercicio 4 #####
data4 <- read.csv("C:/Users/Admin/Desktop/Programacion_lineal/ej1.csv") 
g <- graph.data.frame(data4, directed = FALSE)
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta')

plot(g, edge.label = paste(E(g)$weight, sep = ""), 
     main='Ruta mas corta', vertex.label.color='red',
     vertex.color="green", edge.color="pink", vertex.frame.color="yellow",)
rglplot(g, layout=layout_on_grid(g, dim = 3))
sp <- shortest.paths(g, v = "1", to = "5")     
sp[]                                          
gsp <- get.shortest.paths(g, from = "1", to = "5")
V(g)[gsp$vpath[[1]]]                          
# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)




# Matriz adjunta o algoritmo de Floyd
adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj
# Matriz de distancias
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix[1, 5] 
# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)

max_flow(g, source=V(g)["1"], target=V(g)["5"])

g1 <- graph_from_data_frame(data4)

distance_table(g, directed = TRUE)


#### Ejercicio 5 #####
data5 <- read.csv("C:/Users/Admin/Desktop/Programacion_lineal/ej2.csv") 


g <- graph.data.frame(data5, directed = FALSE)
plot(g, edge.label = paste(E(g)$weight, sep = ""), main='Ruta mas corta')

plot(g, edge.label = paste(E(g)$weight, sep = ""), 
     main='Ruta mas corta', vertex.label.color='red',
     vertex.color="green", edge.color="pink", vertex.frame.color="yellow",)

rglplot(g, layout=layout_on_grid(g, dim = 3))
sp <- shortest.paths(g, v = "1", to = "7")     
sp[]                                          
gsp <- get.shortest.paths(g, from = "1", to = "7")
V(g)[gsp$vpath[[1]]]                          

# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)
# Matriz adjunta o algoritmo de Floyd
adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj

# Matriz de distancias
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix[1, 7] 

# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)

max_flow(g, source=V(g)["1"], target=V(g)["5"])

g1 <- graph_from_data_frame(data4)

distance_table(g, directed = TRUE)


distances(g, v = V(g), to = V(g), mode = c("all", "out",
           "in"), weights = NULL, algorithm = c("automatic", "unweighted",
          "dijkstra", "bellman-ford", "johnson"))

shortest_paths(g, from, to = V(g), mode = c("out", "all",
              "in"), weights = NULL, output = c("vpath", "epath", "both"),
               predecessors = FALSE, inbound.edges = FALSE)

all_shortest_paths(g, from, to = V(g), mode = c("out", "all",
                                                        "in"), weights = NULL)



g <- make_lattice( c(3,3) )
layout_on_grid(g)

g2 <- make_lattice( c(3,3,3) )
layout_on_grid(g2, dim = 3)


plot(g, layout=layout_on_grid)
rglplot(g2, layout=layout_on_grid(g2, dim = 3))

g <- make_lattice( c(5,5,5) )
coords <- layout_with_fr(g, dim=3)
rglplot(g, layout=coords)


data <- edit(data.frame()) # Crear una tabla de datos que sea data frame
data


g <- graph.data.frame(data, directed = FALSE)  # Crea igraph 
class(g)                                     # Clase del objeto
V(g)$name                                    # Nombres de los vértices
E(g)$weight                                  # Peso de las aristas
tkplot(g)                                    # Gráfico dinámico
plot(g, edge.label = paste(E(g)$weight, sep = "")) # Gráfico de abajo
# Camino más corto entre 1 y 5
sp <- shortest.paths(g, v = "1", to = "6")     
sp[]                                           # Distancia 
gsp <- get.shortest.paths(g, from = "1", to = "6")
V(g)[gsp$vpath[[1]]]                           # Secuencia de vértices 


adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj


# Matriz de distancias
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix[1, 6] 

# Caminos más cortos desde 1
allsp <- get.all.shortest.paths(g, from = "1")
str(allsp)



igraph_demo()
if (interactive()) {
  igraph_demo("centrality")
}



##### Ejercicio Floyd 2  #####
data <- edit(data.frame()) # Crear una tabla de datos que sea data frame
data
g <- graph.data.frame(data, directed = FALSE)  # Crea igraph 
class(g)                                     # Clase del objeto
V(g)$name                                    # Nombres de los vértices
E(g)$weight                                  # Peso de las aristas
tkplot(g)                                    # Gráfico dinámico
plot(g, edge.label = paste(E(g)$weight, sep = "")) # Gráfico de abajo
# Camino más corto entre 1 y 6
sp <- shortest.paths(g, v = "1", to = "6")     
sp[]                                           # Distancia 
gsp <- get.shortest.paths(g, from = "1", to = "6")
V(g)[gsp$vpath[[1]]]            

adj <- get.adjacency(g, attr='weight', sparse = FALSE)
adj


# Matriz de distancias
distMatrix <- shortest.paths(g, weights = E(g)$weight)
distMatrix[1, 6] 















