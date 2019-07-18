FROM unidata/python:latest
LABEL "Maintainer"="MrBiTs"
LABEL "e-mail"="mrbits.dcf@gmail.com"
LABEL "version"="0.0.2"

RUN pip install geopandas overpass

WORKDIR /tmp

ENV GEOS_DIR /home/jovyan/geos-3.3.3

RUN wget https://github.com/matplotlib/basemap/archive/v1.1.0.tar.gz && \
    tar xvfz v1.1.0.tar.gz && \
    cd /tmp/basemap-1.1.0/geos-3.3.3 && \
    ./configure --prefix=$GEOS_DIR && \
    make && \
    make install

WORKDIR /tmp/basemap-1.1.0

RUN python setup.py install

RUN conda install -y -c conda-forge rise && fix-permissions /home/$NB_USER
RUN pip install RISE && fix-permissions /home/$NB_USER

RUN pip install jupyter_contrib_nbextensions && fix-permissions /home/$NB_USER

RUN pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master && fix-permissions /home/$NB_USER
RUN jupyter contrib nbextension install --user && fix-permissions /home/$NB_USER

RUN pip install jupyter_nbextensions_configurator && fix-permissions /home/$NB_USER
RUN jupyter nbextensions_configurator enable --user && fix-permissions /home/$NB_USER
