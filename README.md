# Docker RStudio Container for Metabolomics Data Processing

[![DockerHub](https://img.shields.io/docker/cloud/build/yguitton/docker-galaxy-rstudio-metabolomics-dataprocessing?label=Docker&style=flat)](https://hub.docker.com/r/yguitton/docker-galaxy-rstudio-metabolomics-dataprocessingbuilds)

This is a customised flavor of https://github.com/hexylena/docker-rstudio-notebook for Metabolomics Data Processing with R packages. Most of the code was taken from [Data Integration Hackathon](https://forgemia.inra.fr/inter_cati_omics/hackathon_inter_cati_decembre_2022/atelier_2_integration_de_donnees/eval_data_integration_tools) analyses.

Additionnal Metabolomics R packages are from [RforMasspectrometry web site](https://rformassspectrometry.github.io/)
* factoextra
* msdata
* mzR
* r hdf5
* lgatto/rpx
* MsCoreUtils
* QFeatures
* Spectra
* ProtGenerics
* PSMatch
* pheatmap
* limma
* MSnID
* RforMassSpectrometry/SpectraVis

##Addition of other packages 
* metaMS
* msPurity
* SpectraQL


Specific Data Integration R packages are pre-installed from Data Integration Hackathon: 
* MixOmics (v6.22 [Bioconductor - mixOmics](https://bioconductor.org/packages/release/bioc/html/mixOmics.html))
* iClusterPlus (v1.34 [Bioconductor - iClusterPlus](https://bioconductor.org/packages/release/bioc/html/iClusterPlus.html))
* MOFA2 (v1.8 [Bioconductor - MOFA2](https://www.bioconductor.org/packages/release/bioc/html/MOFA2.html))

Other pre-installed R packages:
* tidyverse (v1.3.2 [CRAN - tidyverse](https://tidyverse.tidyverse.org/))
* tidymodels ([CRAN - tidymodels](https://www.tidymodels.org/))
* targets (v0.14.1 [GitHub - targets](https://github.com/ropensci/targets))

Other pre-installed linux system package:
* quarto (v1.2.269 [Quarto - get started](https://quarto.org/docs/get-started/))

This image can be used as a Galaxy Interactive Tool.

## Installing it as a Galaxy Interactive Tool on a Galaxy instance

First make sure your Galaxy instance is [configured to support Interactive Tools](https://training.galaxyproject.org/training-material/topics/admin/tutorials/interactive-tools/tutorial.html).

Then you need to copy the [./interactivetool_rstudio_metabolomics-dataprocessing.xml](./interactivetool_rstudio_metabolomics-dataprocessing.xml) file into `$GALAXY_ROOT/tools/interactive/`.

Add this new tool to `$GALAXY_ROOT/config/tool_conf.xml`:

```xml
<?xml version='1.0' encoding='utf-8'?>
<toolbox monitor="true">
  [...]
  <section id="interactive_tools" name="Interactive tools">
    [...]
    <tool file="interactive/interactivetool_rstudio_metabolomics-dataprocessing.xml" />
  </section>
</toolbox>
```

And add this tool to `$GALAXY_ROOT/config/job_conf.xml`: follow the instructions in the [Interactive Tools tutorial](https://training.galaxyproject.org/training-material/topics/admin/tutorials/interactive-tools/tutorial.html), and adapt depending on your setup.
