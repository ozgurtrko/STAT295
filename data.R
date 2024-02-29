data <- read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/biostats.csv")
head(data)

colnames(data) <-  c("Name","Sex","Age","Height","Weight")
plot(data$Weight, col = "lightblue", lwd = 3,
     xlab = "Height",ylab = "Weight",
     main = "Relationship between Height and Weight")

#Print and save it as a pdf

dev.print(pdf, "part_vi.pdf")

##
library(babynames)
#take 10 sample
baby_10 <- babynames[sample(nrow(babynames),size = 10, replace = FALSE),]
baby_10

barplot(baby_10$n, names.arg = baby_10$name, col = ifelse(baby_10$sex == "F",
                                                          "pink","lightblue"),
        cex.names = 0.8, beside = TRUE)

dev.print(pdf, "part_vii.pdf")

##
var1 <- seq(10, 60, 6)
var2 <- list(1:20, letters[1:20])
var3 <- matrix(rnorm(24), nrow = 12)
var4 <- matrix(rep(c(4,6,4),3),nrow = 3, byrow = TRUE)

save(var1, var2, var3, var4, file = "myvar.RData")

#remove all variables on the global environment
rm(list = ls())

#load the data
load("myvar.RData")

