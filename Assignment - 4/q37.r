# Step1: Install and Load the necessary packages and data
# 
install.packages("dplyr")
library(dplyr)

# Load the starwars dataset from dplyr package
data("starwars", package = "dplyr")

View(starwars)



# Step2 (Select Columns): Extract relevant columns such as
# name, species, height, mass, homeworld, and gender

starwars_data <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

View(starwars_data)



# Step3 (Filter Rows): Filter species that have more than two characters

species_count <- starwars_data %>%
  group_by(species) %>%
  summarize(count = n())

valid_species <- species_count %>%
  filter(count > 2)

filtered_data <- starwars_data %>%
  filter(species %in% valid_species$species)

View(filtered_data)



# Step4 (Create New Columns):
# Convert height from cm to meters and categorize mass

filtered_data <- filtered_data %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 50 ~ "Underweight",
      mass >= 50 & mass <= 80 ~ "Normal",
      mass > 80 ~ "Overweight",
      TRUE ~ NA_character_
    )
  )

View(filtered_data)



# Step5 (Summarize Data):
# Find average height for each species and gender combination

species_gender_avg <- filtered_data %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height, na.rm = TRUE))

View(species_gender_avg)



# Step6 (Top Three Species):
# Identify the top three species with highest average height

top_species <- filtered_data %>%
  group_by(species) %>%
  summarize(avg_height = mean(height, na.rm = TRUE)) %>%
  arrange(desc(avg_height)) %>%
  slice_head(n = 3)

View(top_species)
