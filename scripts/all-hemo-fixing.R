# Script for making a clean and valuable data sheet to join new data with as project continues

library(dplyr)
library(tidyverse)

hemo <- read.csv("data/20180522-all-crabs-hemo.csv")
colnames(hemo)

# select relevant columns
newhemo <- hemo %>%
  select(year.FRP, FRP, Uniq_ID, sample_day, infection_status, maturity, treatment_tank, tube_number, Comments, death, comments, CW, SC, CH) %>%
  arrange(FRP)

# Need to change treatment_tank numbers to words. Numbers 1, 2, 3 are COLD; Numbers 4, 5, 6 are WARM; Numbers 7, 8, 9 are AMBIENT. 

