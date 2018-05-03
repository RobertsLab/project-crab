library(dplyr)
#see current working directory
getwd()

#set new working directory
setwd("../../../Documents/GitHub/project-crab/data/")

#upload files
Qubit <- read.csv("Qubit-consolidated.csv")
RNA <- read_csv("samples-for-RNA-isolation.csv")

#join files based on tube number in new file
crab_master <- data.frame(left_join(RNA, Qubit, by = "tube_number"))
#view first chunk of rows of file
head(crab_master)

#create new column in new combined file and fill all rows with 0
crab_master$sequence <- rep(0, times=length(crab_master$Sample_Day))

#view column names
colnames(crab_master)
head(crab_master)

#set threshold
threshold <- 20

#replace all 0s in sequence column with 1 if value in column Qubit_tube_conc is greater than or equal to 20, which is the minimum conc of RNA in a sample of 50 µL for RNA sequencing
crab_master$sequence[which(crab_master$Qubit_tube_conc >= threshold)] <- rep(1, times=length(which(crab_master$Qubit_tube_conc >= threshold)))

#create subset file with samples that only have RNA conc of 20 ng/µL for sequencing
seq_subset <- subset(crab_master, subset=crab_master$sequence == 1)
#export subset file to working directory
write.csv(seq_subset, "seq_subset.csv")
