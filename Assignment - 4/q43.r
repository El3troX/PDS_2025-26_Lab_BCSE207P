# Step 1: Install and load required package
install.packages("jsonlite")
library(jsonlite)

# Step 2: Set working directory to Downloads
setwd("C:/Users/thund/Downloads")

# Step 3: Read existing inventory JSON file
inventory <- fromJSON("inventory.json")

print("Existing Inventory:")
print(inventory)

# Step 4: Add a new product to the inventory
new_product <- data.frame(
  product_id = "P105",
  name = "Wireless Mouse",
  category = "Accessories",
  price = 1500,
  stock = 40
)

# Step 5: Append the new product to the inventory
updated_inventory <- rbind(inventory, new_product)

# Step 6: Write updated inventory to a new JSON file
write_json(updated_inventory, "updated_inventory.json", pretty = TRUE)

# Step 7: Verify the updated inventory file
verified_inventory <- fromJSON("updated_inventory.json")

print("Updated Inventory:")
print(verified_inventory)
