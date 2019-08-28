## scripts directory for [RobertsLab/project-crab](https://github.com/RobertsLab/project-crab)

[081919-sample-qubit-master.Rmd](https://github.com/RobertsLab/project-crab/blob/master/scripts/081919-sample-qubit-master.Rmd)   
creates [master-qubit-sample.csv](https://github.com/RobertsLab/project-crab/blob/master/analyses/master-qubit-sample.csv) by `join`-ing the hemolymph [sample_table.csv](https://github.com/RobertsLab/project-crab/blob/master/analyses/sample_table.csv) with the isolation data tab in the [master-qubit.xlsx](https://github.com/RobertsLab/project-crab/blob/master/analyses/master-qubit.xlsx) file. 

[all-hemo-fixing.R](https://github.com/RobertsLab/project-crab/blob/master/scripts/all-hemo-fixing.R)   
beginning of script was used to create the [sample_table.csv](https://github.com/RobertsLab/project-crab/blob/master/analyses/sample_table.csv) (lines 1 - 22). Rest of script is now obsolete, but has some useful code that may be used in other analyses, and I will keep for future reference. 

[hemo-qubit_master.R](https://github.com/RobertsLab/project-crab/blob/master/scripts/hemo-qubit_master.R)   
all no longer used, since the [081919-sample-qubit-master.Rmd](https://github.com/RobertsLab/project-crab/blob/master/scripts/081919-sample-qubit-master.Rmd) script is now how I'll be creating the master sheet. Has some potentially useful code in it for the future, so I'll keep it for now. _May delete later_. 
