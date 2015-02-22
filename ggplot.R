#ggplot learning code
#Amit Kumar
#February 22 2015

install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

# Loads package into memory
library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")

myplot <- ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) + geom_point(size = 3)

myplot <- ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) + 
  geom_point(aes(shape = Species),size = 3)

myplot + geom_point()
summary(myplot)



d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]

diamondPlot <- ggplot(data = d2, aes(x=carat, y=price, color = color)) + 
  geom_point(size = 3)

diamondPlot + geom_point()

library(MASS)

birthPlot <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(birthPlot)


myplot2 <- ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) + 
  geom_point() + facet_grid(Species ~.)

myplot2 + geom_point()

#Or

myplot2 <- ggplot(data = iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) + 
  geom_point() + facet_grid(.~ Species)

myplot2 + geom_point()


library(RColorBrewer)
display.brewer.all()

library("reshape2")
df <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette="Set1")