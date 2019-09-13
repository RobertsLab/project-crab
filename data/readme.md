### `data` directory for [RobertsLab/project-crab](https://github.com/RobertsLab/project-crab)

Folder: [Excel-data-from-Pam](https://github.com/RobertsLab/project-crab/tree/master/data/Excel-data-from-Pam)     
Contains all excel spreadsheets from Pam

Folder: [Qubit_data](https://github.com/RobertsLab/project-crab/tree/master/data/Qubit_data)   
Contains Qubit result .csv files that were used to create the [master qubit data excel document](https://github.com/RobertsLab/project-crab/blob/master/analyses/master-qubit.xlsx). 

Folder: [Temperature](https://github.com/RobertsLab/project-crab/tree/master/data/Temperature)    
Contains all the temperature data from the experiment recorded on Hobo TidBits. 

---

This folder contains data from crab collection/maturity data, PCR *Hematodinium spp.* data, hemolymph collection data, RNA isolation and RNA HS Qubit results, and qPCR and DNA Qubit results.

- [20180522-all-crabs-hemo.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/20180522-master-all-crabs-hemo.csv)     
This file is copy and pasted from Pam's [20180125-NPRB-crab-sample-data.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/20180125-NPRB-crab-sample-data.xlsx) tab "all crabs". I added a column of "Uniq_ID"s. This was made by concatonating the FRP_Tubenumber_sampleday. Has every single crab used in experiment listed with FRP number, infections status. Includes the crabs that died along the way. Used in [all-hemo-fixing.R](https://github.com/RobertsLab/project-crab/blob/master/scripts/all-hemo-fixing.R) to create [sample_table.csv](https://github.com/RobertsLab/project-crab/blob/master/analyses/sample_table.csv).

- [20180522-qPCR-all-runs.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/20180522-master-qPCR-all-runs.csv)     
These data are taken from the "all runs" tab in the [20180518-master_Hemato_qPCR_results.xlsx](https://github.com/RobertsLab/project-crab/blob/master/data/20180518-master_Hemato_qPCR_results.xlsx) excel workbook from Pam. This file contains ALL data from all of Pam's qPCR runs. 

- [20180817-Qubit-results.csv](https://raw.githubusercontent.com/RobertsLab/project-crab/master/data/20180817-Qubit-results.csv)   
This file contains the most of the Qubit results with tube numbers for each sample. Was used to create the excel RNA isolation master spreadsheet, [master-qubit.xlsx](https://github.com/RobertsLab/project-crab/blob/master/analyses/master-qubit.xlsx).


**Individual crabs can be identified by the FRP number. In some sheets, there is a "year-FRP" and a "FRP" column. The "year-FRP" is formatted '2017-####', and in all sheets there is a "FRP" column, which excludes the year becauase all are from 2017.**
0.2ml of hemolymph in ___ ml of RNAlater. 

We have 113 crabs that have a sample for each of the three time points (survived the entire experiment).

Crabs included have either 0 (uninfected) or 1 (infected) infection status, as determined by a conventional PCR (cPCR) assay on Day 0/1 (when they were brought to the lab). Some crabs may have an infection status of "3", which indicates that the cPCR results were inconclusive. 

The holding tank is where the crabs were before Day 9 sampling day. They were only kept in tanks 1-3 and 7-9. They are listed as 1C, 2C, 3C, and 7A, 8A, and 9A because that is what those tanks became after the Day 9 sampling day and temperatures were to be changed. 

ALL CRABS START AT AMBIENT (Day 9 sampling day) AND THEN ARE MOVED TO EITHER COLD, WARM, OR REMAIN IN AMBIENT TANKS (Day 12 and 26 sampling days)
