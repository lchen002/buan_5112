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
#factor hv026 into categorical values
urban <- filter(nfhs, hv025 == 1) 
hv026_factored <- factor(urban$hv026, levels = unique(urban$hv026))

#boxplot of distribution of household size by type of urban area
ggplot(data = urban) +
  geom_boxplot(mapping = aes(x = hv026_factored, y = hv009)) +
  xlab("Urban Area Type") +
  ylab("Household Size") +
  scale_x_discrete(labels = c("Large city", "Small City", "Town"))

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