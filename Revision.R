1:100

mydice <- 1:6
mydice - 1

mydice %*% mydice

mydice %o% mydice

dim(mydice) <- c(2,3)
mydice

dim(mydice) <- c(1,2,3)
mydice


m <- matrix(mydice, nrow = 2)
m

m1 <- matrix(mydice , nrow = 2, byrow = T)
m1

myarray <- array(c(1:12), dim = c(2,2,3))
myarray

# Time and date
now <- Sys.time()
now

class(now)

unclass(now)

#What was the date and time 1000000 seconds ago?

mil <- 1000000
now - mil

data(iris)
head(iris)

class(iris)

class(iris$Sepal.Length)
class(iris$Species)

str(iris)

summary(iris)

#Indexing

iris[1,]
iris[,1]

#Select a column by name
iris[,"Species"]

table(iris$Species)

#Logical Indexing


LogicIndex <- iris[, "Petal.Length"] > 5.5
LogicIndex

iris[LogicIndex, ]

#Summary Statistics

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)

#Functions

MeanAndStd <- function(x){
  c(mean = mean(x), std = sd(x))
}

MeanAndStd(iris$Sepal.Length)

Stats <- aggregate(Sepal.Length ~ Species, data = iris,
                   FUN = MeanAndStd)
Stats


#Visualization
plot(iris$Sepal.Length,
     col = as.numeric(iris$Species),
     ylab = "Sepal Length")
legend("topleft", legend = levels(iris$Species), pch = 1:3)

boxplot(Sepal.Length ~ Species, data = iris)


























