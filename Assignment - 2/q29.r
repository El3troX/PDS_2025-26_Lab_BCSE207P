customers <- list() 
add_customer <- function(name, purchases) { 
  customers[[name]] <<- purchases 
} 
remove_customer <- function(name) { 
  customers[[name]] <<- NULL 
} 
view_customer <- function() { 
  print(customers) 
} 
total_purchases <- function() { 
  sapply(customers, sum) 
} 
highest_lowest_customer <- function() { 
  totals <- total_purchases() 
  list( 
    highest = names(totals)[which.max(totals)], 
    lowest = names(totals)[which.min(totals)] 
  ) 
} 
add_customer("Alice", c(200, 150, 300)) 
add_customer("Bob", c(100, 80, 150)) 
add_customer("Charlie", c(250, 300, 100)) 
 
remove_customer("Alice") 
add_customer("Alice", c(200, 150, 300)) 
print(total_purchases()) 
print(highest_lowest_customer())