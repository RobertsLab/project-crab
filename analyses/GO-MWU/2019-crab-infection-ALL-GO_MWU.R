
# GO_MWU uses continuous measure of significance (such as fold-change or -log(p-value) ) to identify GO categories that are significantly enriches with either up- or down-regulated genes. The advantage - no need to impose arbitrary significance cutoff.

# If the measure is binary (0 or 1) the script will perform a typical "GO enrichment" analysis based Fisher's exact test: it will show GO categories over-represented among the genes that have 1 as their measure. 

# On the plot, different fonts are used to indicate significance and color indicates enrichment with either up (red) or down (blue) regulated genes. No colors are shown for binary measure analysis.

# The tree on the plot is hierarchical clustering of GO categories based on shared genes. Categories with no branch length between them are subsets of each other.

# The fraction next to GO category name indicates the fracton of "good" genes in it; "good" genes being the ones exceeding the arbitrary absValue cutoff (option in gomwuPlot). For Fisher's based test, specify absValue=0.5. This value does not affect statistics and is used for plotting only.

# Stretch the plot manually to match tree to text

# Mikhail V. Matz, UT Austin, February 2015; matz@utexas.edu

################################################################
# First, press command-D on mac or ctrl-shift-H in Rstudio and navigate to the directory containing scripts and input files. Then edit, mark and execute the following bits of code, one after another.
getwd()
#[1] "/Users/graciecrandall/Documents/GitHub/project-crab/analyses/GO-MWU"

# Edit these to match your data file names: 
input="2019-crab-ALL-geneID-log2fc.csv" # two columns of comma-separated values: gene id, continuous measure of significance. To perform standard GO enrichment analysis based on Fisher's exact test, use binary measure (0 or 1, i.e., either sgnificant or not).
goAnnotations="crab-GO-annot.tab" # two-column, tab-delimited, one line per gene, multiple GO terms separated by semicolon. If you have multiple lines per gene, use nrify_GOtable.pl prior to running this script.
goDatabase="go.obo" # download from http://www.geneontology.org/GO.downloads.ontology.shtml
goDivision="MF" # either MF, or BP, or CC
source("gomwu.functions.R")


# Calculating stats. It might take ~3 min for MF and BP. Do not rerun it if you just want to replot the data with different cutoffs, go straight to gomwuPlot. If you change any of the numeric values below, delete the files that were generated in previos runs first.
gomwuStats(input, goDatabase, goAnnotations, goDivision,
           perlPath="../../../../../../../usr/bin/perl", # replace with full path to perl executable if it is not in your system's PATH already
           largest=0.1,  # a GO category will not be considered if it contains more than this fraction of the total number of genes
           smallest=5,   # a GO category should contain at least this many genes to be considered
           clusterCutHeight=0.25, # threshold for merging similar (gene-sharing) terms. See README for details.
           #	Alternative="g" # by default the MWU test is two-tailed; specify "g" or "l" of you want to test for "greater" or "less" instead. 
           #	Module=TRUE,Alternative="g" # un-remark this if you are analyzing a SIGNED WGCNA module (values: 0 for not in module genes, kME for in-module genes). In the call to gomwuPlot below, specify absValue=0.001 (count number of "good genes" that fall into the module)
           #	Module=TRUE # un-remark this if you are analyzing an UNSIGNED WGCNA module 
)
# do not continue if the printout shows that no GO terms pass 10% FDR.

# ------------------------------------------------------
# Results (4/20/2020 - 5:40pm)
#go.obo crab-GO-annot.tab 2019-crab-ALL-geneID-log2fc.csv MF largest=0.1 smallest=5 cutHeight=0.25

#Run parameters:
  
#  largest GO category as fraction of all genes (largest)  : 0.1
#smallest GO category as # of genes (smallest)  : 5
#clustering threshold (clusterCutHeight) : 0.25

#-----------------
#  retrieving GO hierarchy, reformatting data...

#-------------
#  go_reformat:
#  Genes with GO annotations, but not listed in measure table: 3678

#Terms without defined level (old ontology?..): 0
#-------------
#  -------------
#  go_nrify:
#  1280 categories, 9065 genes; size range 5-906.5
#11 too broad
#577 too small
#692 remaining

#removing redundancy:
  
#  calculating GO term similarities based on shared genes...
#428 non-redundant GO categories of good size
#-------------
  
#  Secondary clustering:
#  calculating similarities....
#Continuous measure of interest: will perform MWU test
#15 GO terms at 10% FDR
# ------------------------------------------------------

### WILL CONTINUE WITH PLOTTING ###

# Plotting results
quartz()
results=gomwuPlot(input,goAnnotations,goDivision,
                  absValue=-log(0.05,10),  # genes with the measure value exceeding this will be counted as "good genes". This setting is for signed log-pvalues. Specify absValue=0.001 if you are doing Fisher's exact test for standard GO enrichment or analyzing a WGCNA module (all non-zero genes = "good genes").
                  #	absValue=1, # un-remark this if you are using log2-fold changes
                  level1=0.1, # FDR threshold for plotting. Specify level1=1 to plot all GO categories containing genes exceeding the absValue.
                  level2=0.05, # FDR cutoff to print in regular (not italic) font.
                  level3=0.01, # FDR cutoff to print in large bold font.
                  txtsize=1.2,    # decrease to fit more on one page, or increase (after rescaling the plot so the tree fits the text) for better "word cloud" effect
                  treeHeight=0.5, # height of the hierarchical clustering tree
                  #	colors=c("dodgerblue2","firebrick1","skyblue2","lightcoral") # these are default colors, un-remar and change if needed
)
# manually rescale the plot so the tree matches the text 
# if there are too many categories displayed, try make it more stringent with level1=0.05,level2=0.01,level3=0.001.  

# ------------------------------------------------------
#GO terms dispayed: 15
#"Good genes" accounted for:  914 out of 2994 ( 31% )
#Warning messages:
#  1: In plot.formula(c(1:top) ~ c(1:top), type = "n", axes = F, xlab = "",  :
#                       the formula 'c(1:top) ~ c(1:top)' is treated as 'c(1:top) ~ 1'
#                     2: In plot.formula(c(1:top) ~ c(1:top), type = "n", axes = F, xlab = "",  :
#                                          the formula 'c(1:top) ~ c(1:top)' is treated as 'c(1:top) ~ 1'
# ------------------------------------------------------

# text representation of results, with actual adjusted p-values
results
#write out results
write.csv(results, "2019-crab-ALL-GO_MWU-results.csv", quote = FALSE)

# ------------------------------------------------------
#April 21, 2020
#model after script from EIMD: https://github.com/eimd-2019/project-EWD-transcriptomics/blob/master/analyses/GO-MWU/Zostera-GO_MWU.R 
#separate out GO by BP, CC, and MF and rerun script:

##### GO-BP #####
#I'll use log2fc for these, like I did above
input='2019-crab-ALL-geneID-log2fc.csv' # from `DESeq`, use for just 2019 crab dataset
goAnnotations='crab-GO-annot.tab' #use for entire crab transcriptome
goDatabase='go.obo'
goDivision='BP' #biological process GO 
source("gomwu.functions.R")

#calculate stats. May take ~3 mins for MF and BP. 
gomwuStats(input, goDatabase, goAnnotations, goDivision,
          perlPath = "../../../../../../../usr/bin/perl",
          largest=0.1, #GO category will not be considered if it contains more than this fraction of the total number of genes
          smallest=5, #GO category should contain at least this many genes to be considered
          clusterCutHeight=0.25, #threshold for merging similar (gene-sharing) terms. 
          )
#Do NOT continue to plotting if above results in "0 GO terms pass 10% FDR)
###RESULTS:
#go_nrify:
#1544 categories, 4388 genes; size range 5-438.8
#54 too broad
#717 too small
#773 remaining

#removing redundancy:
  
#  calculating GO term similarities based on shared genes...
#325 non-redundant GO categories of good size

#7 GO terms at 10% FDR
### Continue onto plotting for these 7 GO terms: 
#### PLOTTING FOR GO-BP ####
quartz()
results=gomwuPlot(input,goAnnotations,goDivision,
                  absValue=-log(0.05,10),  # genes with the measure value exceeding this will be counted as "good genes". This setting is for signed log-pvalues. Specify absValue=0.001 if you are doing Fisher's exact test for standard GO enrichment or analyzing a WGCNA module (all non-zero genes = "good genes").
                  #	absValue=1, # un-remark this if you are using log2-fold changes
                  level1=0.1, # FDR threshold for plotting. Specify level1=1 to plot all GO categories containing genes exceeding the absValue.
                  level2=0.05, # FDR cutoff to print in regular (not italic) font.
                  level3=0.01, # FDR cutoff to print in large bold font.
                  txtsize=1.2,    # decrease to fit more on one page, or increase (after rescaling the plot so the tree fits the text) for better "word cloud" effect
                  treeHeight=0.5, # height of the hierarchical clustering tree
                  #	colors=c("dodgerblue2","firebrick1","skyblue2","lightcoral") # these are default colors, un-remar and change if needed
)
# manually rescale the plot so the tree matches the text 
# if there are too many categories displayed, try make it more stringent with level1=0.05,level2=0.01,level3=0.001.  

# text representation of results, with actual adjusted p-values
results
#write out text representation of results for GO-BP
write.csv(results, "2019-crab-ALL-GOBP-results.csv", quote = FALSE)

# ------------------------------------------------------------------
##### GO-MF #####
#I'll use log2fc for these, like I did above
input='2019-crab-ALL-geneID-log2fc.csv' # from `DESeq`, use for just 2019 crab dataset
goAnnotations='crab-GO-annot.tab' #use for entire crab transcriptome
goDatabase='go.obo'
goDivision='MF' #molecular function GO 
source("gomwu.functions.R")

#calculate stats. May take ~3 mins for MF and BP. 
gomwuStats(input, goDatabase, goAnnotations, goDivision,
           perlPath = "../../../../../../../usr/bin/perl",
           largest=0.1, #GO category will not be considered if it contains more than this fraction of the total number of genes
           smallest=5, #GO category should contain at least this many genes to be considered
           clusterCutHeight=0.25, #threshold for merging similar (gene-sharing) terms. 
)
#Do NOT continue to plotting if above results in "0 GO terms pass 10% FDR)
###RESULTS:
#go_nrify:
#1280 categories, 9065 genes; size range 5-906.5
#11 too broad
#577 too small
#692 remaining

#removing redundancy:
  
#  calculating GO term similarities based on shared genes...
#428 non-redundant GO categories of good size
#15 GO terms at 10% FDR 

### WILL CONTINUE ON TO TREE PLOTTING: 
quartz()
results=gomwuPlot(input,goAnnotations,goDivision,
                  absValue=-log(0.05,10),  # genes with the measure value exceeding this will be counted as "good genes". This setting is for signed log-pvalues. Specify absValue=0.001 if you are doing Fisher's exact test for standard GO enrichment or analyzing a WGCNA module (all non-zero genes = "good genes").
                  #	absValue=1, # un-remark this if you are using log2-fold changes
                  level1=0.1, # FDR threshold for plotting. Specify level1=1 to plot all GO categories containing genes exceeding the absValue.
                  level2=0.05, # FDR cutoff to print in regular (not italic) font.
                  level3=0.01, # FDR cutoff to print in large bold font.
                  txtsize=1.2,    # decrease to fit more on one page, or increase (after rescaling the plot so the tree fits the text) for better "word cloud" effect
                  treeHeight=0.5, # height of the hierarchical clustering tree
                  #	colors=c("dodgerblue2","firebrick1","skyblue2","lightcoral") # these are default colors, un-remar and change if needed
)
# manually rescale the plot so the tree matches the text 
# if there are too many categories displayed, try make it more stringent with level1=0.05,level2=0.01,level3=0.001.  

# text representation of results, with actual adjusted p-values
results
#write out text representation of results for GO-BP
write.csv(results, "2019-crab-ALL-GOMF-results.csv", quote = FALSE)

# ------------------------------------------------------------------
##### GO-CC #####
#I'll use log2fc for these, like I did above
input='2019-crab-ALL-geneID-log2fc.csv' # from `DESeq`, use for just 2019 crab dataset
goAnnotations='crab-GO-annot.tab' #use for entire crab transcriptome
goDatabase='go.obo'
goDivision='CC' #cellular component GO 
source("gomwu.functions.R")

#calculate stats. May take ~3 mins for MF and BP. 
gomwuStats(input, goDatabase, goAnnotations, goDivision,
           perlPath = "../../../../../../../usr/bin/perl",
           largest=0.1, #GO category will not be considered if it contains more than this fraction of the total number of genes
           smallest=5, #GO category should contain at least this many genes to be considered
           clusterCutHeight=0.25, #threshold for merging similar (gene-sharing) terms. 
)
#Do NOT continue to plotting if above results in "0 GO terms pass 10% FDR)
####RESULTS: 
#go_nrify:
#380 categories, 5232 genes; size range 5-523.2
#18 too broad
#147 too small
#215 remaining

#removing redundancy:
  
#  calculating GO term similarities based on shared genes...
#129 non-redundant GO categories of good size
#10 GO terms at 10% FDR 

#### CONTINUE ON TO PLOTTING:
quartz()
results=gomwuPlot(input,goAnnotations,goDivision,
                  absValue=-log(0.05,10),  # genes with the measure value exceeding this will be counted as "good genes". This setting is for signed log-pvalues. Specify absValue=0.001 if you are doing Fisher's exact test for standard GO enrichment or analyzing a WGCNA module (all non-zero genes = "good genes").
                  #	absValue=1, # un-remark this if you are using log2-fold changes
                  level1=0.1, # FDR threshold for plotting. Specify level1=1 to plot all GO categories containing genes exceeding the absValue.
                  level2=0.05, # FDR cutoff to print in regular (not italic) font.
                  level3=0.01, # FDR cutoff to print in large bold font.
                  txtsize=1.2,    # decrease to fit more on one page, or increase (after rescaling the plot so the tree fits the text) for better "word cloud" effect
                  treeHeight=0.5, # height of the hierarchical clustering tree
                  #	colors=c("dodgerblue2","firebrick1","skyblue2","lightcoral") # these are default colors, un-remar and change if needed
)
# manually rescale the plot so the tree matches the text 
# if there are too many categories displayed, try make it more stringent with level1=0.05,level2=0.01,level3=0.001.  

# text representation of results, with actual adjusted p-values
results
#write out text representation of results for GO-BP
write.csv(results, "2019-crab-ALL-GOCC-results.csv", quote = FALSE)




