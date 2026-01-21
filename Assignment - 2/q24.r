closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 128, 
130, 129, 131, 135, 134, 136, 137, 140, 138, 139, 141, 142, 144, 143, 145, 
146, 148, 147, 149) 
 
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100 
cat("Daily Returns of Stock: ", daily_returns, "\n\n") 
highest_return_day <- which.max(daily_returns) + 1 
lowest_return_day <- which.min(daily_returns) + 1 
highest_return <- max(daily_returns) 
lowest_return <- min(daily_returns) 
cat("Highest Return Day is ", highest_return_day,"with return: ", 
highest_return, "\n") 
cat("Lowest Return Day is ", lowest_return_day, "with return: ", 
lowest_return, "\n\n") 
cumulative_return <- (tail(closing_prices, 1) / head(closing_prices, 1) - 1) 
* 100 
cat("Cumulative Return: ", cumulative_return)