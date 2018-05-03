library(dplyr)

getwd()

setwd("../../../Documents/GitHub/project-crab/data/")

Qubit <- read.csv("Qubit-consolidated.csv")
RNA <- read_csv("samples-for-RNA-isolation.csv")

crab_master <- data.frame(left_join(RNA, Qubit, by = "tube_number"))
head(crab_master)

crab_master$sequence <- rep(0, times=length(crab_master$Sample_Day))
colnames(crab_master)
head(crab_master)

threshold <- 20
crab_master$sequence[which(crab_master$Qubit_tube_conc >= threshold)] <- rep(1, times=length(which(crab_master$Qubit_tube_conc >= threshold)))
?subset
seq_subset <- subset(crab_master, subset=crab_master$sequence == 1)
write.csv(seq_subset, "seq_subset.csv")
