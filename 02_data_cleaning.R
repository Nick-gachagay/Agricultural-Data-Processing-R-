library(dplyr)
library(readr)

# Load raw data
data <- read_csv("data/raw/world_bank_raw.csv")

library(dplyr)
library(readr)

data_clean <- data %>%
  rename(
    country = country,
    year = year,
    yield = yield
  ) %>%
  filter(!is.na(yield)) %>%
  mutate(
    year = as.integer(year),
    yield = as.numeric(yield)
  ) %>%
  distinct()

# Save cleaned data
write_csv(data_clean, "data/processed/world_bank_cleaned.csv")
