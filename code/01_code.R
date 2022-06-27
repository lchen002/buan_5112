library(tidyverse)
library(haven)

#load data
nfhs <- read_dta("IAHR52FL.dta")

#check on variables and observations
View(nfhs)

#subset data to include only var between hhid and shstruc
hh <- select(nfhs, hhid : shstruc)

#plot distribution of household size for nfhs
ggplot(data = nfhs) +
  geom_histogram(mapping = aes(x = hv009), binwidth = 1) +
  xlab("Household Size")

#create a new data frame that contains only urban households
urban <- filter(nfhs, hv025 == 1)

#boxplot of distribution of household size by type of urban area
ggplot(data = urban) +
  geom_boxplot(mapping = aes(x = hv009, y = hv025, group = hv026)) +
  coord_flip() +
  xlab("Household Size") +
  ylab("Urban Area Type")

#find mean of household size by type of urban area
urban %>%
  group_by(hv026) %>%
  summarise(
    mean = mean(hv009), n = n()
  )

#find median of household size by type of urban area
urban %>%
  group_by(hv026) %>%
  summarise(
    median =median(hv009)
  )