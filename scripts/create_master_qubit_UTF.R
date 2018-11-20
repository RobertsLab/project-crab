library(dplyr)
library(readr)
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

# read .csv the new qubit file 
qubitnew <- read.csv("data/Qubit_data/QubitData_2018-10-10_18-19-56.csv")

# make the new qubit data .csv into a UTF
shell( iconv -f utf-8 -t utf-8 -c QubitData_2018-10-10_18-19-56.csv | \ sed 's/(L)/(uL)/g' | \ sed 's/ng\/L/ng\/uL/g' \ > QubitData_2018-10-10_18-19-56_UTF8.csv, flag = "-c", mustWork = TRUE)

# since I already have this file made into a UTF from the "all-hemo-fixing.R" script, I'll use it and continue

# read in the UTF version of the new qubit data file
qubitnew <- read.csv("data/Qubit_data/QubitData_2018-10-10_18-19-56_UTF8.csv")
  