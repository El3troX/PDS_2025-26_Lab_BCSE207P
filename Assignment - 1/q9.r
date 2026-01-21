calculate_square<- function(number) { 
  return(number*number) 
} 
 
# Test the function with different sets of inputs 
num1 <- 4 
sq1<-calculate_square(num1) 
num2 <- -3 
sq2<-calculate_square(num2) 
num3 <- 0 
sq3<-calculate_square(num3) 
num4 <- 5.7 
sq4<-calculate_square(num4) 
 
 
# Print the test results 
cat("Square of 4: ", sq1, "\n") 
cat("Square of -3: ", sq2, "\n") 
cat("Square of 0: ", sq3, "\n") 
cat("Square of 5.7: ", sq4, "\n")