fish_data <- read.csv("data/Gaeta_etal_CLC_data.csv")

library(tidyverse)

#create columns of categorical data dividng fish by length into big and small
fish_data_cat = fish_data %>%
  mutate(length_cat = ifelse(length > 200, "big", "small"))
summary(fish_data_cat)

#filter out innacurate observations where scale length is less than 1mm
descaled_fish_data_cat <- fish_data_cat %>%
  group_by(scalelength) %>%
  filter(scalelength > 1)
summary(descaled_fish_data_cat)
View(descaled_fish_data_cat)

#plot histogram of fish length by size 
ggplot(descaled_fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

#Plot histogram of scale length by fish categorical size
scale_hist_by_length <- ggplot(fish_data_cat, aes(x = scalelength, fill = length_cat)) +
  geom_histogram()

#save scale length figure
ggsave("figures/scale_hist_by_lenth.jpeg")

#scatterplot
ggplot(data = descaled_fish_data_cat, aes(x=length, y=scalelength, color = lakeid)) + 
       geom_point() +
  ylab("Fish scale length (mm)" ) +
  xlab("Fish standard length (mm)") +
  theme_classic()



