# Docker image for Jupyter with spatial-computing libraries in Fedora

FROM fedora:24

MAINTAINER Weihang Lo <b01605002@gmail.com>

USER root

# setting environment variables
ENV WORKDIR /home/notebooks
ENV SHELL /bin/bash

# mkdir
RUN mkdir -p $WORKDIR
WORKDIR $WORKDIR

# install  packages
RUN dnf install -y \
    python3-devel \
    gcc-c++ \
    redhat-rpm-config \
    czmq-devel \
    R-core-devel && \
    dnf autoremove && \
    dnf clean all && \
    pip3 install --no-cache-dir jupyter

# install R packages dependencies libs
RUN dnf install -y \
    openssl-devel \
    gdal-devel \
    proj-devel \
    proj-nad \
    proj-epsg \
    geos-devel \
    curl-devel \
    libjpeg-turbo-devel \
    tar && \
    dnf autoremove && \
    dnf clean all


# install r and irkernel
COPY Rpackages /opt/
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> $(R RHOME)/etc/Rprofile.site && \
    Rscript /opt/Rpackages && rm /opt/Rpackages

# setup default entrypoint
COPY docker_entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker_entrypoint.sh"]
EXPOSE 8888
