options(repos=structure(c(CRAN="https://cran.rstudio.com/")))

# bioconductor base
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager") # 3.11
# MS data processing
BiocManager::install("xcms", ask=FALSE) # 3.10.2
#BiocManager::install("CAMERA", ask=FALSE)
BiocManager::install("metaMS", ask=FALSE)

# Statistics
#BiocManager::install("ropls")
#BiocManager::install("mixOmics",, ask=FALSE)

#Annotation
# BiocManager::install("Spectra")
# BiocManager::install("CompoundDb")
# BiocManager::install("MetaboAnnotation")


## Installation instructions for the R for Mass Spectrometry tutorial
##      https://rformassspectrometry.github.io/docs/

## Install packages
# BiocManager::install("factoextra")
# BiocManager::install("msdata")
# BiocManager::install("MsExperiment")
# BiocManager::install("QFeatures")
# BiocManager::install("pheatmap")
# BiocManager::install("MSnID")
# BiocManager::install("gc-meox-tms")
