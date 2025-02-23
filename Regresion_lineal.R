# Regresi�n Lineal usando ggplot y plotly
library(ggplot2)
library(plotly)


data("midwest", package = "ggplot2") # Cargamos la base de datos 
# llamada midwest
#options(scipen=999)
# ggplot(data, aes(x=))
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
# geom_point() me genera una gr�fico de puntos
  geom_point()
    plot(gg)

#Dependiedo de los datos o distribuci�n de los datos podemos 
# seccionar los siguiente forma


gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state))
plot(gg)

gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity))
plot(gg)


gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity))+ 
  geom_smooth(method="lm", se=T)
plot(gg)


gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000))
plot(gg)



gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="�rea Vs Poblaci�n", 
       y="Poblaci�n", 
       x="�rea", 
       title="Gr�fico de Dispersi�n", 
       caption = "Source: midwest")

plot(gg)
ggplotly(gg)

p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth()
plot(p)
ggplotly(p)



