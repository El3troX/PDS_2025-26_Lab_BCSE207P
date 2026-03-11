# Step 1: Load required package
install.packages("dplyr")
library(dplyr)

# Step 2: Create Customers dataset
customers <- data.frame(
  CustomerName = c("John Doe","Jane Smith","Robert Brown","Emily Davis","Michael Green"),
  Email = c("john.doe@example.com",
            "jane.smith@example.com",
            "robert.brown@example.com",
            "emily.davis@example.com",
            "michael.green@example.com")
)

View(customers)

# Step 3: Create Purchases dataset
purchases <- data.frame(
  CustomerName = c("John Doe","Jane Smith","Robert Brown","Sarah Johnson","Emily Davis"),
  PurchaseAmount = c(150,200,120,180,220),
  Date = as.Date(c("2023-01-01",
                   "2023-01-02",
                   "2023-01-03",
                   "2023-01-04",
                   "2023-01-05"))
)

View(purchases)

# Step 4: Perform Left Join
left_join_result <- left_join(customers, purchases, by = "CustomerName")
print("Left Join Result:")
print(left_join_result)

# Step 5: Perform Right Join
right_join_result <- right_join(customers, purchases, by = "CustomerName")
print("Right Join Result:")
print(right_join_result)

# Step 6: Perform Inner Join
inner_join_result <- inner_join(customers, purchases, by = "CustomerName")
print("Inner Join Result:")
print(inner_join_result)

# Step 7: Perform Outer Join (Full Join)
full_join_result <- full_join(customers, purchases, by = "CustomerName")
print("Full Join Result:")
print(full_join_result)
