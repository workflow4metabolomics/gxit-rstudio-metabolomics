# RStudio container used for Galaxy RStudio Metabolomics Data Processing
# TO be honest was helped by ifb.community.fr and ChatGPT
FROM quay.io/erasche/docker-rstudio-notebook:19.09

MAINTAINER Yann GUITTON "yann.guitton@gmail.com"

RUN apt-get -qq update && \
    apt-get install --no-install-recommends -y libpng-dev libcurl4-openssl-dev libxml2-dev libssl-dev libgit2-dev libcairo2-dev libx11-dev libxt-dev libnetcdf-dev \
    r-base r-base-core r-recommended r-base-dev \
	python3 python3-pip 

# Install R 4.1.0
RUN wget https://cran.r-project.org/src/base/R-4/R-4.1.0.tar.gz \
    && tar zxvf R-4.1.0.tar.gz \
    && cd R-4.1.0 \
    && ./configure --prefix=/usr/local \
    && make \
    && make install \
    && cd .. \
    && rm -rf R-4.1.0 R-4.1.0.tar.gz
	
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.2.269/quarto-1.2.269-linux-amd64.deb \
    && yes | dpkg -i quarto-1.2.269-linux-amd64.deb
	
	
# Install the latest Bioconductor release
RUN R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager"); BiocManager::install(version = "3.16")'

ADD ./packages/bioconda.R /tmp/packages/bioconda.R
ADD ./packages/other.R /tmp/packages/other.R

# Uncomment the following lines if R version is > 4.1.0
RUN Rscript -e "install.packages('remotes')"
RUN Rscript -e "remotes::install_github('rformassspectrometry/SpectraQL')" \
    && rm -rf /tmp/downloaded_packages/

RUN Rscript /tmp/packages/other.R && \
    Rscript /tmp/packages/bioconda.R && \
    chmod 777 /import/

# Install Python packages
RUN R -e "install.packages('reticulate')"
RUN R -e "reticulate::install_miniconda()"
RUN R -e "reticulate::conda_install('massql')"

# Remove unnecessary temporary files
RUN rm -rf /tmp/packages /quarto-1.2.269-linux-amd64.deb

# Must happen later, otherwise GalaxyConnector is loaded by default, and fails,
# preventing ANY execution
COPY ./Rprofile.site /usr/local/lib/R/etc/Rprofile.site

EXPOSE 80

