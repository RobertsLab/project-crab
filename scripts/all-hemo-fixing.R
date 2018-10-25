# Script for making a clean and valuable data sheet to join new data with as project continues

library(tidyverse)
library(dplyr)

#hemo_table <- read.csv("data/20180522-all-crabs-hemo.csv")

#head(hemo_table)

# Need to change treatment_tank numbers to words. Numbers 1, 2, 3 are COLD; Numbers 4, 5, 6 are WARM; Numbers 7, 8, 9 are AMBIENT. 

#hemo_table <- 
#mutate(hemo_table, trtmnt_tank = ifelse(treatment_tank == 1 | treatment_tank == 2 | treatment_tank == 3, "cold", ifelse(treatment_tank == 4 | treatment_tank == 5 | treatment_tank == 6, "warm", "ambient"))) %>%
#select(FRP, Uniq_ID, trtmnt_tank, sample_day, infection_status, maturity, tube_number) %>%
#arrange(Uniq_ID)


#head(hemo_table)

#colnames(hemo_table)

#write.csv(hemo_table, "analyses/hemo_table.csv")

#sample_table <- read.csv("analyses/sample_table.csv")

# Cleaning up qubit file
#qubit <- read.csv("data/20180817-Qubit-results.csv") %>%
  #select(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng) 
#add column for extraction method and that they weren't lyophilized
#qubit$extraciton_method <- "RNAzol"
#qubit$lyophilized_y_n <- "n"


#sample_qubit <- left_join(sample_table, qubit, by = "tube_number")


#write.csv(sample_qubit, "analyses/hemosample_qubit_table.csv")

#samsqubit <- read.csv("/Users/graciecrandall/Desktop/QubitData_from_sam_test1-3_spaces.csv", header = TRUE, fileEncoding = "latin1")
#latin1 deals with µ

#Need to left_join sample_table with qubit, then add the new qubit data to that joined table
#sample_table$tube_number <- as.factor(sample_table$tube_number)
#newqub <- left_join(sample_table, samsqubit, by = "tube_number")
#newqub$tube_number <- as.factor(newqub$tube_number)
#add new qubit data
#newqubd <- read.csv("/Users/graciecrandall/Desktop/QubitData_2018-10-10_18-19-56.csv", header = TRUE, fileEncoding = "latin1")
#newqubd$tube_number <- as.factor(newqubd$tube_number)

#add new qubit data to new_qub
#morequb <- left_join(newqub, newqubd, by = "tube_number")

#Need to change "tube_number" in newly joined file to factors in order to be able to join more qubit data down the line

#################################################################################################

# 2018-10-23

#read in hemosample_qubit_table.csv. This .csv is all the hemolymph sampling data, as well as the Qubit data up until now. 
hemo_qubit <- read.csv("analyses/hemosample_qubit_table.csv")

#upload new qubit data GitHub: https://github.com/RobertsLab/project-crab/tree/master/data/Qubit_data

# in bash, run the following code, making sure to be in the correct working directory, and using the correct QubitData .csv

#D-10-19-119-59:~ graciecrandall$ cd
#D-10-19-119-59:~ graciecrandall$ cd Documents/GitHub/project-crab/data/Qubit_data/
#D-10-19-119-59:Qubit_data graciecrandall$ iconv -f utf-8 -t utf-8 -c QubitData_2018-10-10_18-19-56.csv | \
#> sed 's/(L)/(uL)/g' | \
#> sed 's/ng\/L/ng\/uL/g' \
#> > QubitData_2018-10-10_18-19-56_UTF8.csv
#D-10-19-119-59:Qubit_data graciecrandall$ ls
#QubitData_2018-10-10_18-19-56.csv	QubitData_2018-10-19_13-22-52_UTF8.csv
#QubitData_2018-10-10_18-19-56_UTF8.csv	README.md

#read in the new qubit csv
qubitnew <- read.csv("data/Qubit_data/QubitData_2018-10-10_18-19-56_UTF8.csv")

# Add in tube numbers to Qubit file in a new column called "tube_number"
qubitnew$tube_number <- c("491-1","452-1","455-1","405-1","430-1","441-1","437-1","418-1","410-1","493-1")

qubitnew$tube_number <- as.character(qubitnew$tube_number)

#rename "Original.sample.conc." column name to include units -- "Original_sample_conc_ng.ul" in order to get rid of unit column, as well as to be able to join with hemosample_qubit_table.csv
colnames(qubitnew)[colnames(qubitnew)=="Original.sample.conc."] <- "Original_sample_conc_ng.ul"

#rename "Test.Date" to "Test_Date" so that it joins correctly with hemoqubit
colnames(qubitnew)[colnames(qubitnew)=="Test.Date"] <- "Test_Date"


#before joining with hemo_qubit, add column with contents of extraction type, and whether lyophilized
qubitnew$extraction_method <- "Tri-reagent"
qubitnew$lyophilized_y_n <- "n"

#change "Original_sampel_conc_ng.ul" to character
qubitnew$Original_sample_conc_ng.ul <- as.character(qubitnew$Original_sample_conc_ng.ul)

#replace "Out of range" in "Original_sample_conc_ng.ul" to "0"s
qubitnew[qubitnew$Original_sample_conc_ng.ul == "Out of range",]$Original_sample_conc_ng.ul = 0


# add total_sample_vol_ul and total_yield_ng
# make sure that the "total_sample_vol_ul" is the ul of sample remaining after Qubit reading
qubitnew$total_sample_vol_ul <- "5"

# make "total_sample_vol_ul" and "Original_sample_conc_ng.ul" into numeric
qubitnew$total_sample_vol_ul <- as.numeric(qubitnew$total_sample_vol_ul)
qubitnew$Original_sample_conc_ng.ul <- as.numeric(qubitnew$Original_sample_conc_ng.ul)

# make "Original_sample_conc_ng.ul" and "total_sample_vol_ul" into objects
x <- qubitnew$Original_sample_conc_ng.ul
y <- qubitnew$total_sample_vol_ul

# make new column called "total_yield_ng" that multiplies "Original_sample_conc_ng.ul" and "total_sample_vol_ul"
qubitnew$total_yield_ng <- x * y

#list column names
colnames(qubitnew)

#call out the columns of interest of qubitnew
qubitnew2 <- subset(qubitnew, select = c(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng, extraction_method, lyophilized_y_n))


#check subset qubit file visually before joining with hemosample_qubit_table.csv
#change tube number in hemo_qubit to character to match qubitnew2
hemo_qubit$tube_number <- as.character(hemo_qubit$tube_number)

#left_join with hemo_qubit
hemo_qubit2 <- left_join(hemo_qubit, qubitnew2, by = "tube_number")


#I don't want it like this because it ends up making .x and .y columns.... 



