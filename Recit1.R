seq(40,200,20)

seq(10,-32,-6)

rep(seq(-2,3-1), each = 3)

letters[seq(2, length(letters), 2)]



A <- matrix(rep(c(2,3,2), each = 3),nrow = 3, byrow = T)
B <- matrix(c(4,-2,-4,2,2,1,-4,5,2,6,4,6), nrow = 4, byrow = T)
A;B

C <- diag(2:4)
C

A + C

solve(C) %*% A

A %*% t(C)

max(c(det(A),det(C)))

replace_matrix <- function(matrix){
  matrix[2,1] <- -1
  matrix[3,2] <- 1
  return(matrix)
}

A <- replace_matrix(A)

M <- rbind(A,B)
M

L <- rbind(B,C)
L

rownames(L) <- paste("row.",1:nrow(L), sep = "")
colnames(L) <- paste("col.",1:ncol(L), sep = "")
L

liste <- list(A,B,C)
liste

liste$favorite_films <- c("Stalker","The Shinning","Pulp Fiction")
liste

K <- solve(A)%*%C + A %*% t(C)
K

array1 <- array(c(A,C), dim = c(nrow(A), ncol(A),2))
array1

set.seed(16)
value <- c()

while (TRUE) {
  x <- sample(1:10,1)
  values <- c(value,x)
  print(x)
  if(x == 7){
    break
  }
}
value_counts <- table(value)
hist(values, breaks = seq(0.5, 10.5, by = 1))


m1 <- matrix(0, nrow = 6, ncol = 6)
m1[1,] <- 1:6

m1[,1] <- 1:6
for (i in 2:6) {
  for (j in 2:6){
    m1[i,j] <- i*j
    } 
    
  }
  
}
m1


m_size <- 8
m2 <- matrix(0, nrow = m_size, ncol = m_size)

for (i in 1:m_size) { 
  for (j in 1:m_size) {
    if(i == j) {
      m2[i,j] = 0
    } else {
      m2[i,j] <- abs(i - j)
    }
    
  }
  
}

m2

#Currency Function

currency_convertor <- function(TL) {
  currency_vector <- c(TL = 1, USD = 0.033, CAD = 0.044,
                       EURO = 0.030, CHF = 0.029)
  result_matrix <- matrix(currency_vector*TL,
                          dimnames = list(c(names(currency_vector)),"Amount"))
  return(result_matrix)
}
currency_convertor(10000)

#Mortgage Payment Function

calculate <- function(principle, interest_rate, number_of_payments) {
  monthly_interest_rate <- interest_rate / 12 / 100
  loan_term_months <- number_of_payments * 12
  
  monthly_payment <- principle * (monthly_interest_rate * (1 + monthly_interest_rate)
                                  ^number_of_payments)/((1+monthly_interest_rate) ^number_of_payments-1)
  return(monthly_payment)
}

principle <- 200000
interest_rate <- 4.5
number_of_payments <- 30

monthly_payment <- calculate(principle, interest_rate, number_of_payments)
print(monthly_payment)

data <- read.csv("https://users.ssc.wisc.edu/~hemken/Rworkshops/read/classm.csv")
data

str(data)
head(data,4)
tail(data,2)

sum(is.na(data))

no_na <- function(fill_column){
  mean_val <- mean(fill_column, na.rm = TRUE)
  fill_column[is.na(fill_column)] <- mean_val
  return(fill_column)
}
data_fill <- as.data.frame(lapply(data,no_na))
data1 <- na.omit(data)
data1





install.packages("babynames")
library(babynames)
dim(babynames)
options(scipen = 999)

summary(babynames)
colnames(babynames) <- c("Year","Sex","Name","Count","Proportion")

?aggregate
grouped <- aggregate(Count ~ Name + Sex, data = babynames, FUN = sum)
grouped

?sort
sort(grouped)
























































