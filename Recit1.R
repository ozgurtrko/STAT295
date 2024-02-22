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
















