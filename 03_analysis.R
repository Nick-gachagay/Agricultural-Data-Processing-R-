library(dplyr)
library(ggplot2)
library(readr)

# Load cleaned data
data <- read_csv("data/processed/cleaned_data.csv")

# Average yield per crop
avg_yield <- data %>%
  group_by(crop) %>%
  summarise(mean_yield = mean(yield, na.rm = TRUE))

print(avg_yield)

# Save summary
write_csv(avg_yield, "outputs/tables/average_yield.csv")

# Plot trends
plot <- ggplot(data, aes(x = year, y = yield, color = crop)) +
  geom_line() +
  labs(
    title = "Crop Yield Trends",
    x = "Year",
    y = "Yield (tons/hectare)"
  ) +
  theme_minimal()

# Save plot
ggsave("outputs/plots/yield_trends.png", plot)
