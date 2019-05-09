# Script to join qubit results from Sam's extractions using the ______ kit on _____

library(dplyr)
newres <- read.csv("data/Qubit_data/20190430_qubit_RNA_crab - QubitData_2019-04-30_14-41-32.csv")

#add column of extraction method
newres$extraction_method <- "Zymo_microprep"

colnames(newres)

#change "Sample.ID" name to "Uniq_ID"
colnames(newres)[colnames(newres)=="Sample.ID"] <- "Uniq_ID"

colnames(newres)[colnames(newres)=="Test.Date"] <- "Test_Date"

colnames(newres)[colnames(newres)=="Original.sample.conc."]<- "Original_sample_conc_ng.ul"

#subset the columns of interest
newres2 <- subset(newres, select = c(Uniq_ID, Test_Date, Original_sample_conc_ng.ul, extraction_method))

#write.csv to analyses
write.csv(newres2, "analyses/qubit_results-for-libraries.csv")


#read the new csv in
newqub <- read.csv("analyses/qubit_results-for-libraries.csv")

#convert new csv file to UTF-8
system("pwd")

#QubitData_2018-10-31_17-54-22.csv
system("iconv -f utf-8 -t utf-8 -c analyses/qubit_results-for-libraries.csv | sed 's/(L)/(uL)/g' | sed 's/ng\\/L/ng\\/uL/g' > analyses/qubit_results-for-libraries.csv_UTF8.csv")                   
