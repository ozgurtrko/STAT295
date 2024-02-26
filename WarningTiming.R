#Week 2

#Exceptions and Timing

vec1 <- c(1,2,3)
vec2 <- c(1,2)
vec1*vec2

warn_test <- function(x){
  if(x<=0){
    warning("WATCH OUT! 'x' is less tahn or equal to 0. Set it 1")
    x <- 1
  }
  return(2/x)
}

warn_test(10)
warn_test(0)

error_test <- function(x){
  if(x<=0){
    stop("'x' is less than or equal to 0... TERMİNATE!")
  }
  return(2/x)
}
error_test(0)

myfibrec <- function(n){
  if(n<0){
    warning("n can not be negative number! Assuming you meant n to be positive")
    n <- n*-1
  }else if(n == 0){
    stop("n is not work!")
  }
  if(n == 1 || n == 2){
    return(1)
  }else{
    return(myfibrec(n-1) + myfibrec(n-2))
  }
}
myfibrec(9)
myfibrec(0)
myfibrec(-10)
myfibrec(10)

attempt1 <- try(myfibrec(0))
attempt2 <- try(myfibrec(0), silent = T)
class(attempt1)

attempt3 <- try(myfibrec(6), silent = T)
attempt3
























