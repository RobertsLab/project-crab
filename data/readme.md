This folder contains data from crab collection/maturity data, PCR *Hematodinium spp.* data, and hemolymph collection data. 

- [20180125-NPRB-crab-sample-data.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/20180125-NPRB-crab-sample-data.xlsx)
This file contains data taken during the sampling of hemolymph. It includes crab IDs, maturity status, infection status, and tube numbers that the hemolymph samples are stored in.

- [20180125-Crab-Collection-DATA_DNA-plates.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/20180125-Crab-Collection-DATA_DNA-plates.xlsx) 
This file contains crab morphology data as well as _Hematodinium_ assay and blood smears results of all original crabs delivered.

- [20180309-crab-hemo-sample-data.csv](https://raw.github.com/RobertsLab/project-crab/blob/master/data/20180309-crab-hemo-sample-data.csv)
These data are from the master spreadsheet from Pam and the tab labeled "3 samples per crab". I removed some excess comulmns.

**The crabs can be identified using the FRP number in the first column. Each crab has three rows of data (becuase of the three sampling dates).**

We have 113 crabs that have a sample for each of the three time points.

Crabs included have either 0 (uninfected) or 1 (infected) infection status.
	There are only 3 crabs with an infection status of "3" and all are Mature. "3" denotes an unsure infection status.

Both Mature (M) and Immature (I) are included. 

The holding tank is where the crabs were before Day 9 sampling day. They were only kept in tanks 1-3 and 7-9. They are listed as 1C, 2C, 3C, and 7A, 8A, and 9A because that is what those tanks became after the Day 9 sampling day and temperatures were to be changed. 

ALL CRABS START AT AMBIENT AND THEN ARE MOVED TO EITHER COLD, WARM, OR REMAIN IN AMBIENT TANKS

There are NO MATURE crabs in:
Cold, infected
Ambient, infected
Warm, infected
Warm, uninfected

- [20180502_seq_subset.csv](https://raw.github.com/RobertsLab/project-crab/blob/master/data/20180502_seq_subset.csv)
These data are a subset of all the samples that I did RNA isolation and Qubit on. The data in this file are of ALL samples that had quantifiable RNA (Qubit results) 20ng/µL or higher. 

- [20180516_qPCR_DNA-Qubit.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/20180516_qPCR_DNA-Qubit.csv)
These are qPCR and DNA Qubit results from Pam. She performed qPCR for _Hematodinium sp._ in the hemolymph samples from the crabs taken on Day 0 and 1 (before temperature treatment exposure) and on Day 26 (the last day of the experiment). This file is reorganized from what she originally sent me ([qPCR_Qubit_results_to_Grace_050818.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/qPCR_Qubit_results_to_Grace_050818.xlsx)) to be machine readable. There were a lot of empty cells, so all empty cells were replaced with "0". 

- [20180517_sequence_samples.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/20180517_sequence_samples.csv)
These data are for the RNA isolation crab samples that: have 20 ng/µL RNA (Qubit) or more; have three sample dates per crab; and have qPCR and DNA Qubit data from Pam. The qPCR and DNA Qubit data are organized such that the data pertaining to Day 26 samples have "d26" at the end of the column name, and those pertaining to Day 0/1 samples have "d01" at the end of the column name. 

- [Qubit-consolidated.csv](https://raw.github.com/RobertsLab/project-crab/blob/master/data/Qubit-consolidated.csv)
This file contains RNA quantification data from Qubit High Sensitivity taken throughout the RNA isolation attempts. 

- [goodsamples.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/goodsamples.csv)
This file contains data from crab samples that had three samples per crab for which all had 20 ng/µL of RNA (Qubit) or more. 

- [isolated_samples.csv](https://github.com/RobertsLab/project-crab/blob/master/data/isolated_samples.csv)
This file contains ALL RNA isolation and Qubit data for ALL SAMPLES that I performed RNA isolation on. Meaning, that this file contains those that had "Out of Range" RNA (too little/none). 

- [qPCR_Qubit_results_to_Grace_050818.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/qPCR_Qubit_results_to_Grace_050818.xlsx)
This is a workbook from Pam containing the data from her qPCR and DNA Qubit resutls on the crab hemolymph samples from Day 0 and 1, and Day 26 for _Hematodinium sp._ ALL SAMPLES ENDED UP POSITIVE FOR _Hematodinium_ INFECTION (DAY 26 DATA)

- [samples-for-RNA-isolation.csv](https://github.com/RobertsLab/project-crab/blob/master/data/samples-for-RNA-isolation.csv)
This file contains a subset of samples selected for RNA isolation (from crabs that survived experiment)



