library(dplyr)
#To make the RNAzol Qubit data only have the important information:
# read .csv the combined qubit file containing all qubit results from RNAzol extractions
RNAzolQubit <- read.csv("data/20180817-Qubit-results.csv")

# fix the RNAzolQubit file to contain only pertinent information and re-write.csv
# add columns: "extraction_method" and "lyophilized_y_n"
RNAzolQubit$extraction_method <- "RNAzol"
RNAzolQubit$lyophilized_y_n <- "n"

# fix the qubitresults file so that it only has the columns of interest and add RNAzol extraction method column
RNAzolQubit <- subset(RNAzolQubit, select = c(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng, extraction_method, lyophilized_y_n))

#write.csv to analyses
RNAzolQubit <- write.csv(RNAzolQubit, "analyses/RNAzol_Qubit.csv")
############################################################################
#Here is where you start now:
# read .csv the RNAzol-Qubit.csv
RzolQ <- read.csv("analyses/RNAzol_Qubit.csv")

#convert new csv file to UTF-8
system("pwd")

system("iconv -f utf-8 -t utf-8 -c data/Qubit_data/QubitData_2018-10-31_17-54-22.csv | sed 's/(L)/(uL)/g' | sed 's/ng\\/L/ng\\/uL/g' > QubitData_2018-10-31_17-54-22_UTF8.csv")

#read in new UTF version of QubitData

  