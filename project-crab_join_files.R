library(dplyr)
library(tidyverse)

# Script for creating joined and merged data files from project-crab. Ultimate goal is to create a true master file of all crab-related data files in this repo. 

# Join all hemolymph sampling data with Qubit RNA HS results data into one file. 

# read in all-crabs-hemo.csv
hemo <- read.csv("data/20180522-all-crabs-hemo.csv")
# read in Qubit-results.csv
qub <- read.csv("data/20180817-Qubit-results.csv")

# Convert "tube_number" in hemo.csv numeric (not factor)
hemo$tube_number <- as.numeric(hemo$tube_number)

# test that as.numeric conversion worked
is.numeric(hemo$tube_number)

# Join files based on column "tube_number"
master <- left_join(hemo, qub, by = "tube_number")

# Look at columns in master file
colnames(master)

# Select columns that are useful and relevant
master2 <- master %>%
  select(year.FRP, FRP, infection_status, Uniq_ID, sample_day, infection_status, maturity, Holding_Tank, Low_Tag, High_Tag, sample, treatment_tank, where, tube_number, Comments, death, comments, CW, SC, CH, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng) %>%
  arrange(FRP)

# Write updated csv to project-crab data repo. 
write.csv(master2, "20180817-hemo-Qubit.csv")

# Move new csv to data directory in repo project-crab and update readme.md


