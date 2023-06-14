# RStudio container used for Galaxy RStudio Metabolomics Data Processing
# To be honest was helped by ifb.community.fr

FROM quay.io/erasche/docker-rstudio-notebook:19.09

RUN apt-get -qq update && \
    apt-get install --no-install-recommends -y libpng-dev libcurl4-openssl-dev libxml2-dev libssl-dev libgit2-dev libcairo2-dev libx11-dev libxt-dev libnetcdf-dev

ADD ./packages/bioconda.R /tmp/packages/bioconda.R
ADD ./packages/other.R /tmp/packages/other.R


RUN rm -f /usr/local/lib/R/etc/Rprofile.site && \
    Rscript /tmp/packages/other.R && \
    Rscript /tmp/packages/bioconda.R && \
    chmod 777 /import/

# Must happen later, otherwise GalaxyConnector is loaded by default, and fails,
# preventing ANY execution
COPY ./Rprofile.site /home/rstudio/.Rprofile

# COPY ./AskoR_bootstrap.R /opt/AskoR_bootstrap.R
# /usr/local/lib/R/site-library/00LOCK-dplyr/00new/dplyr/libs

EXPOSE 80
