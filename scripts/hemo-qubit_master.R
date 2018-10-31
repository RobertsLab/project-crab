# Script to make a master hemo-qubit file, and to be able to add new qubit data as mroe samples are process

# read in "sample_table.csv" which is all the hemolymph sampling data and the tube_numbers (including the -1, -2, -3 from Day 26 triplicates). This file has no columns related to Qubit data
mhemo <- read.csv("analyses/sample_table.csv")

# read in the 20180817-Qubit-results.csv from project-crab/data. This file is the combined Qubit results file from all the RNAzol extractions 
qubitresults <- read.csv("data/20180817-Qubit-results.csv")

# add columns: "extraction_method" and "lyophilized_y_n"
qubitresults$extraction_method <- "RNAzol"
qubitresults$lyophilized_y_n <- "n"

# fix the qubitresults file so that it only has the columns of interest and add RNAzol extraction method column
qubitresults <- subset(qubitresults, select = c(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng, extraction_method, lyophilized_y_n))

# Add new qubit data to the qubitresults 

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

#check subset qubitnew2 file visually before concatenating to qubitresults
# figure out how to append the qubitnew2 to qubitresults


