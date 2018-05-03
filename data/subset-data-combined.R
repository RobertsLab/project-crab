library(dplyr)

crab_master <- merge(RNA, Qubit, by = "tube_number")

head(crab_master)

?subset

crab_master$Assay_Name
crab_master$sequence <- rep(0, times=length(crab_master$Sample_Day))
colnames(crab_master)

threshold <- 20
crab_master$sequence[which(crab_master$Qubit_tube_conc >= threshold)] <- rep(1, times=length(which(crab_master$Qubit_tube_conc >= threshold)))
