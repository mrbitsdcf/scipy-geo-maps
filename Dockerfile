FROM unidata/python:latest
LABEL "Maintainer"="MrBiTs"
LABEL "e-mail"="mrbits.dcf@gmail.com"
LABEL "version"="0.0.2"

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"
ARG GEOS_DIR="/home/jovyan/geos-3.3.3"
ARG CONDA_DIR="/opt/conda"

USER root

ADD fix-permissions /usr/local/bin/fix-permissions

RUN fix-permissions /home/$NB_USER

USER $NB_UID

RUN pip install -U pip && pip install geopandas overpass && \
    fix-permissions /home/$NB_USER

WORKDIR /tmp

RUN wget https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz && \
    tar xvfz v1.1.0.tar.gz && \
    cd /tmp/basemap-1.1.0/geos-3.3.3 && \
    ./configure --prefix=$GEOS_DIR && \
    make && \
    make install && \
    fix-permissions /home/$NB_USER

WORKDIR /tmp/basemap-1.1.0

RUN python setup.py install && \
    fix-permissions /home/$NB_USER

RUN pip install jupyter_contrib_nbextensions && \
    fix-permissions /home/$NB_USER

RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master && \
    fix-permissions /home/$NB_USER

RUN jupyter contrib nbextension install --user && \
    fix-permissions /home/$NB_USER

RUN pip install jupyter_nbextensions_configurator && \
    fix-permissions /home/$NB_USER

RUN jupyter nbextensions_configurator enable --user && \
    fix-permissions /home/$NB_USER

RUN rm -rf /tmp/v1.1.0.tar.gz && rm -rf /tmp/basemap-1.1.0

WORKDIR /home/$NB_USER
