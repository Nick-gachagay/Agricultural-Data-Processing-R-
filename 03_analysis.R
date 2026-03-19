library(dplyr)
library(ggplot2)
library(readr)

data <- read_csv("data/processed/world_bank_cleaned.csv")

# Summary
avg_yield <- data %>%
  group_by(country) %>%
  summarise(mean_yield = mean(yield, na.rm = TRUE))

print(avg_yield)

# Save table
write_csv(avg_yield, "outputs/tables/average_yield_by_country.csv")

# Plot trends
plot <- ggplot(data, aes(x = year, y = yield, color = country)) +
  geom_line(size = 1) +
  labs(
    title = "Cereal Yield Trends (East Africa)",
    x = "Year",
    y = "Yield (kg per hectare)"
  ) +
  theme_minimal()

# Save plot
ggsave("outputs/plots/yield_trends.png", plot)
