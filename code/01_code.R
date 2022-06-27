library(tidyverse)
library(haven)

#load data
nfhs <- read_dta("IAHR52FL.dta")

#check on variables and observations
View(nfhs)

#subset data to include only var between hhid and shstruc
hh <- select(nfhs, hhid : shstruc)
