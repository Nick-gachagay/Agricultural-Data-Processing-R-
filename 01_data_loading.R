# Load libraries
library(readr)

# Load dataset
data_raw <- read_csv("data/raw/crop_yield_data.csv")

# Preview
print(head(data_raw))

# Save a copy (optional checkpoint)
write_csv(data_raw, "data/processed/raw_backup.csv")
