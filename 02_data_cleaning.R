library(dplyr)
library(readr)

# Load raw data
data <- read_csv("data/raw/crop_yield_data.csv")

# Rename columns for consistency
data_clean <- data %>%
  rename(
    country = Country,
    year = Year,
    crop = Crop,
    yield = Yield_tons_per_hectare
  )

# Remove missing values
data_clean <- data_clean %>%
  filter(!is.na(yield))

# Convert types
data_clean <- data_clean %>%
  mutate(
    year = as.integer(year),
    yield = as.numeric(yield),
    crop = tolower(crop)
  )

# Remove duplicates
data_clean <- distinct(data_clean)

# Save cleaned data
write_csv(data_clean, "data/processed/cleaned_data.csv")
