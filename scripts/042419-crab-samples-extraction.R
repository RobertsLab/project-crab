#script for creating sample spreadsheet for extracting RNA from all 12 libraries at once
library(tidyverse)
library(dplyr)
samples <- read.csv("analyses/hemosample_qubit_table.csv")

#want to have a spreadhseet with the crabs ordered so that there are 12 rows in a row from each group, repeating

#add column called "library_gp" and number each library 1-12

samples$library_gp <- ifelse(samples$sample_day == 9 & samples$infection_status == 0, '01',
                             ifelse(samples$sample_day == 9 & samples$infection_status == 1, '02',
                                    ifelse(samples$sample_day == 12 & samples$infection_status == 0 & samples$trtmnt_tank == 'ambient', '03', 
                                           ifelse(samples$sample_day == 12 & samples$infection_status == 1 & samples$trtmnt_tank == 'ambient', '04', 
                                                  ifelse(samples$sample_day == 12 & samples$infection_status == 0 & samples$trtmnt_tank == 'cold', '05', 
                                                         ifelse(samples$sample_day == 12 & samples$infection_status == 1 & samples$trtmnt_tank == 'cold', '06', 
                                                                ifelse(samples$sample_day == 12 & samples$infection_status == 0 & samples$trtmnt_tank == 'warm', '07', 
                                                                       ifelse(samples$sample_day == 12 & samples$infection_status == 1 & samples$trtmnt_tank == 'warm', '08',
                                                                              ifelse(samples$sample_day == 26 & samples$infection_status == 0 & samples$trtmnt_tank == 'ambient', '09', 
                                                                                     ifelse(samples$sample_day == 26 & samples$infection_status == 1 & samples$trtmnt_tank == 'ambient', '10', 
                                                                                            ifelse(samples$sample_day == 26 & samples$infection_status == 0 & samples$trtmnt_tank == 'cold', '11', '12')))))))))))

#arrange rows so that there's a set of 12 repeating
samples <- arrange(samples, library_gp, sample_day, infection_status)
write.csv(samples, "analyses/0424-extraction-samples.csv")
