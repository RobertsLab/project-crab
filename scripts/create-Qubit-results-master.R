#Oct 31st RNeasy Samples

#read in new UTF version of QubitData
qubitnew <- read.csv("data/Qubit_data/QubitData_2018-10-31_17-54-22_UTF8.csv")

# Add in tube numbers to Qubit file in a new column called "tube_number"
qubitnew$tube_number <- c("423-2", "414-2")

#make "tube_number" characters
qubitnew$tube_number <- as.character(qubitnew$tube_number)

#rename "Original.sample.conc." column name to include units -- "Original_sample_conc_ng.ul" in order to get rid of unit column, as well as to be able to join with hemosample_qubit_table.csv
colnames(qubitnew)[colnames(qubitnew)=="Original.sample.conc."] <- "Original_sample_conc_ng.ul"

#rename "Test.Date" to "Test_Date" so that it joins correctly with hemoqubit
colnames(qubitnew)[colnames(qubitnew)=="Test.Date"] <- "Test_Date"

#before joining with hemo_qubit, add column with contents of extraction type, and whether lyophilized
qubitnew$extraction_method <- "RNeasy"
qubitnew$lyophilized_y_n <- "n"

#change "Original_sampel_conc_ng.ul" to character
qubitnew$Original_sample_conc_ng.ul <- as.character(qubitnew$Original_sample_conc_ng.ul)

#replace "Out of range" in "Original_sample_conc_ng.ul" to "0"s
qubitnew[qubitnew$Original_sample_conc_ng.ul == "Out of range",]$Original_sample_conc_ng.ul = 0

# add total_sample_vol_ul and total_yield_ng
# make sure that the "total_sample_vol_ul" is the ul of sample remaining after Qubit reading and Bioanalyzer/NanoDrop
qubitnew$total_sample_vol_ul <- "12"

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

#check that qubitnew2 looks good

##################################################################
#COMBINE INTO MASTER QUBIT RESULTS CSV
#read in the RNAzol Qubit data (current master of all QUbit results thus far)
RNAzol <- read.csv("analyses/RNAzol_Qubit.csv")

# RNAzol has a column "X" that new qubit data does not. Call out all columns except column "X".
RNAz <- subset(RNAzol, select = c(tube_number, Test_Date, Original_sample_conc_ng.ul, total_sample_vol_ul, total_yield_ng, extraction_method, lyophilized_y_n))


#Need to remove the headers from the qubitnew2


#possible code...
#system("cat analyses/master_qubit.csv analyses/edit-QubitData_2018-10-31_17-54-22.csv > analyses/master_Qubit.csv")
