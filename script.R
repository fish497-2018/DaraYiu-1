fish_data <- read.csv("data/Gaeta_etal_CLC_data.csv")
library(dplyr)
library(ggplot2)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 200, "big", "small"))

ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()
