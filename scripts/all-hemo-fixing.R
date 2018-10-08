# Script for making a clean and valuable data sheet to join new data with as project continues

library(tidyverse)

hemo_table <- read.csv("data/20180522-all-crabs-hemo.csv")

head(hemo_table)

# Need to change treatment_tank numbers to words. Numbers 1, 2, 3 are COLD; Numbers 4, 5, 6 are WARM; Numbers 7, 8, 9 are AMBIENT. 

hemo_table <- 
mutate(hemo_table, trtmnt_tank = ifelse(treatment_tank == 1 | treatment_tank == 2 | treatment_tank == 3, "cold", ifelse(treatment_tank == 4 | treatment_tank == 5 | treatment_tank == 6, "warm", "ambient"))) %>%
select(FRP, Uniq_ID, trtmnt_tank, sample_day, infection_status, maturity, tube_number) %>%
arrange(Uniq_ID)


head(hemo_table)

colnames(hemo_table)

write.csv(hemo_table, "analyses/hemo_table.csv")

sample_table <- read.csv("analyses/sample_table.csv")

# Cleaning up qubit file
qubit <- read.csv("data/20180817-Qubit-results.csv") %>%
  select(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng) 


sample_qubit <- left_join(sample_table, qubit, by = "tube_number")
sample_qubit$extraction_method <- "RNAzol"
#How do I put in different methods? Some were done using Qiagen RNeasy and others will now be done with Trizol
#Also, want to add columns for Bioanalyzer and NanoDrop and whether they were lyophilized

write.csv(sample_qubit, "analyses/hemosample_qubit_table.csv")



