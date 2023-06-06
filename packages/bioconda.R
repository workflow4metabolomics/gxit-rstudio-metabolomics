options(repos=structure(c(CRAN="https://cran.rstudio.com/")))

# bioconductor base
if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install(version = "3.12", ask = FALSE)

# bioconductor packages
BiocManager::install(c("edgeR", "Rgraphviz", "biomaRt", "topGO", "limma", "DESeq2", "cummeRbund", "Biostrings", "GenomicRanges", "Rsamtools", "Glimma", "Rgraphviz", "ComplexHeatmap", "goSTAG", "coseq", "mixOmics", "iClusterPlus", "MOFA2"))

## Installation instructions for the R for Mass Spectrometry tutorial
##      https://rformassspectrometry.github.io/docs/

## Install packages
BiocManager::install("factoextra")
BiocManager::install("msdata")
BiocManager::install("mzR")
BiocManager::install("MsCoreUtils")
BiocManager::install("xcms")
BiocManager::install("CAMERA")
BiocManager::install("metaMS")
BiocManager::install("Spectra")
BiocManager::install("CompoundDb")
BiocManager::install("MetaboAnnotation")
BiocManager::install("MsExperiment")
BiocManager::install("QFeatures")
BiocManager::install("pheatmap")
BiocManager::install("limma")
BiocManager::install("MSnID")
BiocManager::install("RforMassSpectrometry/SpectraVis")
BiocManager::install("ropls")
