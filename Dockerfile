FROM unidata/python:latest
LABEL "Maintainer"="MrBiTs"
LABEL "e-mail"="mrbits.dcf@gmail.com"
LABEL "version"="0.0.2"

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

USER $NB_UID

ADD fix-permissions /usr/local/bin/fix-permissions

RUN pip install geopandas overpass && fix-permissions /home/$NB_USER

WORKDIR /tmp

ENV GEOS_DIR=/home/jovyan/geos-3.3.3 \
    CONDA_DIR=/opt/conda

RUN wget https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz && \
    tar xvfz v1.1.0.tar.gz && \
    cd /tmp/basemap-1.1.0/geos-3.3.3 && \
    ./configure --prefix=$GEOS_DIR && \
    make && \
    make install && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

WORKDIR /tmp/basemap-1.1.0

RUN python setup.py install && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN conda install -y -c conda-forge rise && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN pip install RISE && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN pip install jupyter_contrib_nbextensions && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN jupyter contrib nbextension install --user && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN pip install jupyter_nbextensions_configurator && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR

RUN jupyter nbextensions_configurator enable --user && \
    fix-permissions /home/$NB_USER && \
    fix-permissions $CONDA_DIR
