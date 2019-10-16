ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Pablo Mandiola <pmandiolab@gmail.com>"

# Install additional packages
RUN conda install --quiet --yes -c conda-forge \
    pandas-gbq \
    pandas-profiling \
    xgboost \
    'gdal=2.4.2' \
    geopandas \
    cartopy \
    graphviz \
    mrjob \
    spacy \
    gensim \
    feather-format \
    osmnx \
    folium \
    pylint && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda install --quiet --yes -c ankurankan \
    pgmpy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN pip install tweepy \
    pydotplus \
    textblob \
    gevent-websocket && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda install --quiet --yes -c h2oai h2o && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER