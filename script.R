fish_data <- read.csv("data/Gaeta_etal_CLC_data.csv")
library(dplyr)
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 200, "big", "small"))

