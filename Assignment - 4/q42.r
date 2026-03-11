# Step 1: Install and load required packages
install.packages("DBI")
install.packages("RSQLite")
install.packages("dplyr")

library(DBI)
library(RSQLite)
library(dplyr)

# Step 2: Set the working directory
setwd("C:/Users/thund/OneDrive/Documents")

# Step 3: Establish connection to the SQLite database
con <- dbConnect(RSQLite::SQLite(), "songs.db")

# Step 4: Create a reference to the songs table
songs_table <- tbl(con, "songs")

# Step 5: Construct query to retrieve titles where artist_id = 11
queen_songs <- songs_table %>%
  filter(artist_id == 11) %>%
  select(title)

# Step 6: Display the SQL query generated
show_query(queen_songs)

# Retrieve the actual data as a tibble
result <- collect(queen_songs)
print(result)

# Step 7: Disconnect from the database
dbDisconnect(con)
