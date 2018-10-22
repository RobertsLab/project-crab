# Script for making a clean and valuable data sheet to join new data with as project continues

library(tidyverse)
library(datasets)

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

samsqubit <- read.csv("/Users/graciecrandall/Desktop/QubitData_from_sam_test1-3_spaces.csv", header = TRUE, fileEncoding = "latin1")
#latin1 deals with µ

#Need to left_join sample_table with qubit, then add the new qubit data to that joined table
sample_table$tube_number <- as.factor(sample_table$tube_number)
newqub <- left_join(sample_table, samsqubit, by = "tube_number")
newqub$tube_number <- as.factor(newqub$tube_number)
#add new qubit data
newqubd <- read.csv("/Users/graciecrandall/Desktop/QubitData_2018-10-10_18-19-56.csv", header = TRUE, fileEncoding = "latin1")
newqubd$tube_number <- as.factor(newqubd$tube_number)

#add new qubit data to new_qub
morequb <- left_join(newqub, newqubd, by = "tube_number")

#Need to change "tube_number" in newly joined file to factors in order to be able to join more qubit data down the line

#################################################################################################

# 2018-10-22
#read in hemosample_qubit_table.csv. This .csv is all the hemolymph sampling data, as well as the Qubit data up until now. 
hemo_qubit <- read.csv("analyses/hemosample_qubit_table.csv")

#upload new qubit data to OWL

#Read in new qubit data. NEED TO MAKE THIS COME FROM OWL - NOT MY DESKTOP
qubitnew <- read.csv("../../../Desktop/QubitData_2018-10-10_18-19-56.csv", header = TRUE, fileEncoding = "latin1") 

#before joining with hemo_qubit, add column with contents of extraction type, and whether lyophilized
qubitnew$extraction_method <- "Tri-reagent"
qubitnew$lyophilized_y_n <- "n"

# add total_sample_vol_ul and total_yield_ng
qubitnew$total_sample_vol_ul <- "10"
qubitnew$total_yield_ng <- 
  
#rename "Original.sample.conc." column name to include units -- "Original_sample_conc_ng.ul" in order to get rid of unit columns
colnames(qubitnew)[colnames(qubitnew)=="Original.sample.conc."] <- "Original_sample_conc_ng.ul"

#call out the columns of interest of qubitnew
qubitnew <- select(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng, extraction_method, lyophilized_y_n, qubitnew$total_sample_vol_ul

#left_join with hemo_qubit
hemo_qubit2 <- left_join(hemo_qubit, qubitnew, by = "tube_number")


#read in .csv from owl
qubitnew2 <- read.csv("http://owl.fish.washington.edu/scaphapoda/grace/Crab-project/Qubit/QubitData_2018-10-19_13-22-52.csv", make.names(colnames, unique = TRUE))
