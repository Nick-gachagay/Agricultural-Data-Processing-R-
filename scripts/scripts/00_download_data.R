# Load libraries
library(WDI)
library(dplyr)
library(readr)

# Fetch agricultural data (cereal yield)
data_raw <- WDI(
  country = c("KE", "UG", "TZ"),  # Kenya, Uganda, Tanzania
  indicator = c(yield = "AG.YLD.CREL.KG"),
  start = 2000,
  end = 2023
)

# Inspect
print(head(data_raw))

# Save raw dataset
write_csv(data_raw, "data/raw/world_bank_raw.csv")
