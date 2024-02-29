# 1.
getwd()

M <- matrix(rbinom(72, size = 10, prob = 0.5), nrow = 12, ncol = 6)
rownames(M) <- paste0("Row.", 1:nrow(M))
colnames(M) <- paste0("Column.", 1:ncol(M))
M

L <- matrix(rnorm(72), nrow = 12, ncol = 6)
rownames(L) <- paste0("Row.", 1:nrow(L))
colnames(L) <- paste0("Column.", 1:ncol(L))
L

part3 <- list(L, M)

write.csv(part3, file = "part3.csv")

