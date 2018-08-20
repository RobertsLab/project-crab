# Script for making a clean and valuable data sheet to join new data with as project continues

library(tidyverse)

hemo_table <- read.csv("data/20180522-all-crabs-hemo.csv")

head(hemo_table)

# Need to change treatment_tank numbers to words. Numbers 1, 2, 3 are COLD; Numbers 4, 5, 6 are WARM; Numbers 7, 8, 9 are AMBIENT. 

hemo_table <- 
mutate(hemo_table, trtmnt_tank = ifelse(treatment_tank == 1 | treatment_tank == 2 | treatment_tank == 3, "cold", ifelse(treatment_tank == 4 | treatment_tank == 5 | treatment_tank == 6, "warm", "ambient"))) %>%
select(year.FRP, FRP, Uniq_ID, trtmnt_tank, sample_day, infection_status, maturity, tube_number) %>%
arrange(FRP)


head(hemo_table)

colnames(hemo_table)


