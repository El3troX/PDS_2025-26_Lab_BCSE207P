books <- list() 
 
add_book <- function(book, borrowers) { 
  books[[book]] <<- borrowers 
} 
 
remove_book <- function(book) { 
  if (!is.null(books[[book]])) { 
    books[[book]] <<- NULL 
  } 
} 
 
view_books <- function() { 
  print(books) 
} 
 
total_borrowers <- function() { 
  sapply(books, length) 
} 
 
highest_and_lowest <- function() { 
  counts <- total_borrowers() 
  highest <- names(which.max(counts)) 
  lowest <- names(which.min(counts)) 
  list(highest = highest, lowest = lowest) 
} 
 
add_book("The Hobbit", c("Alice", "Bob")) 
add_book("1984", c("Charlie", "Alice")) 
add_book("Moby Dick", c("Bob"))
 
view_books() 
 
remove_book("The Hobbit") 
view_books() 
 
borrower_counts <- total_borrowers() 
result <- highest_and_lowest() 
 
print(borrower_counts) 
print(result) 