# Docker image for Jupyter with spatial-computing libraries in Fedora

FROM fedora:24

MAINTAINER Weihang Lo <b01605002@gmail.com>

USER root

# setting environment variables
ENV NB_USER nbuser
ENV NB_UID  1000
ENV SHELL   /bin/bash

# add nbuser
RUN useradd -mN -s /bin/bash -u $NB_UID $NB_USER

# change to nbuser account
USER $NB_USER
RUN mkdir -p /home/$NB_USER/notebooks/
WORKDIR /home/$NB_USER/notebooks


USER root

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
    curl-devel \
    tar && \
    dnf autoremove && \
    dnf clean all


# install r and irkernel
COPY Rpackages.R /opt/
RUN echo 'options(repos = c(CRAN = "https://cran.rstudio.com/"))' >> $(R RHOME)/etc/Rprofile.site && \
    Rscript /opt/Rpackages.R && rm /opt/Rpackages.R 


# setup default entrypoint
COPY docker_entrypoint.sh /usr/local/bin/


USER $NB_USER
ENTRYPOINT ["docker_entrypoint.sh"]
EXPOSE 8888
