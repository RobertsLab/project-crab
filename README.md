# project-crab

## Effects of temperature change and *Hematodinium sp.* - infection (Bitter Crab Disease) on the gene expression of Alaskan Tanner crab (*Chionoecetes bairdi*) (NPRB #1705)      

This repository contains data, analyses, protocols, and scripts.  

Project website: [bittercrab.science](https://bittercrab.wordpress.com)    
Project podcast: [DecaPod](https://podcasts.apple.com/us/podcast/decapod-bittercrab-science/id1437675248)         

## Project background
Alaska Tanner crabs (_Chionoecetes bairdi_) are an important commercial species. They are contending with a disease that renders them lethargic, and also bitter and chalky to taste - making them unmarketable. Prevalence of this disease is higher in Southeast Alaska, which is why Southeast Alaska Tanner crab populations were chosen for this project. Particularly, crab in the Juneau, AK region. The diesease is caused by a parasitic dinoflagellate of the genus _Hematodinium_. Species, transmission, and whether it causes direct mortality in the crab is unknown. The crab become lethargic, their carapace because red or "cooked" in appearance, they hemolymph because opaque/cloudy, and their meat becomes bitter and chalky, hence the name Bitter Crab Disease. 

This project aims to understand how infection with _Hematodinium_ impacts the crab hosts physiologically at different temperatures over time, as well as crab that are not infected with _Hematodinium_ using transcriptomic methods (more details in section below). 

### Design and sampling
In Fall 2017, about 400 male crab were sampled from the Alaska Department of Fish and Game (ADF&G) during their normal fall surveys of the region. The crab were then brought to the Ted Stevens Marine Institute at the Auke Bay Laboratories of NOAA. Upon arrival, conventional PCR was done to determine initial infection status with _Hematodinium_. 

The crab were then allowed to acclimate to tanks for 9 days. After the 9 days, 180 of the surviving crab were chosen to continue in the project, such that 90 were infected with _Hematodinium_ and 90 were uninfected, as determined by the conventional PCR done upon their initial arrival to the laboratory. 

Image of crab in a tank. Lid of tank was taken off for samping, normally there's a foam lid to keep crab from climbing out:       
<p float="left">
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/experimental-design/crabsintank.jpeg" width="300" />
</p>

Once the 180 crab were chosen, hemolymph was sampled from each crab and stored in RNAlater to preserve the integrity of the RNA. Also, some hemolymph was sampled for later qPCR and hemolymph smears. Hemolymph smears are smears of hemolymph on a slide, then a dye is used to visualize the _Hematodinium_, if present, and allows for the determination of life stage of the _Hematodinium_ and visual confirmation of its presence in host hemolymph. 

Hemolymph sampling was done by using a cotton swab to disinfect the outer carapace with ethanol, then a syringe was used to sample the hemolymph (image below).     
<p float="left">
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/experimental-design/hemo-sample.jpeg" width="300" />
</p>

After the initial sampling of hemolymph from the 180 crab, the crab were then separated into 9 tanks, such that there were 20 crab per tank, 10 infected with _Hematodinium_, and 10 uninfected. The temperature in three tanks was then raised to 10˚C (center image), three tanks were kept at ambient (~7˚C) (right image), and three tanks were lowered to a decreased temperature (4˚C) (left image). Images of tanks below:       

<p float="left">
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/experimental-design/cold.jpeg" width="250" />
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/experimental-design/warm.jpeg" width="250" /> 
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/experimental-design/ambient.jpeg" width="250" />
</p>

The hemolymph was then sampled again on Day 2 of the temperature treatment, and on Day 17 of the temperature treatment (the end of the experiment). 

The crab in the warm tank experienced a mass die-off between day 2 and day 17 due to a heater malfunction. Only three crab survived to the final sampling day.     
<p float="left">
  <img src="https://github.com/RobertsLab/project-crab/blob/master/images/survival-fig.png" width="300" />
</p>



## Repository structure and contents

## [analyses](https://github.com/RobertsLab/project-crab/tree/master/analyses)
This folder contains files that are created by merging files in the data folder. 

## [data](https://github.com/RobertsLab/project-crab/tree/master/data)
This folder contains data spreadsheets (.csv and .xlsx) on all things crab. 

## [protcols](https://github.com/RobertsLab/project-crab/tree/master/protocols)
This folder contains .md protocols for the RNA isolation process. 

## [scripts](https://github.com/RobertsLab/project-crab/tree/master/scripts)
This folder contains R scripts for creating merged data spreadsheets and to work towards creating an ultimate master crab data spreadsheet. 
