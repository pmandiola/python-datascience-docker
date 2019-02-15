ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Pablo Mandiola <pmandiolab@gmail.com>"

# Install additional packages
RUN conda install --quiet --yes -c conda-forge \
    'gdal=2.4.0' \
    'geopandas=0.4.0' && \
    pip install tweepy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
