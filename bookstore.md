# Docker

## Volume

```sh
docker volume create example-minio-data
docker volume create example-jupyter-data
```

## Build

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/jupyter-bookstore -
FROM docker.io/jupyter/scipy-notebook:1e374527e15a

USER root

RUN pip install -q --no-cache-dir bookstore===2.2.1

USER $NB_USER

EOF
```

## Running

```sh
docker run -d \
  -h minio \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v example-minio-data:/data \
  -p 9000:9000 \
  --name example-minio \
  minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
docker run -i --rm \
  -e MINIO_BUCKET_NAME=examples \
  --entrypoint /bin/sh \
  minio/mc:RELEASE.2019-05-23T01-33-27Z << 'EOSHELL'
mc config host add local http://example-minio:9000 AKIAIOSFODNN7EXAMPLE wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
mc rm -r --force local/${MINIO_BUCKET_NAME} || true
mc mb local/${MINIO_BUCKET_NAME}
mc policy download local/${MINIO_BUCKET_NAME}
EOSHELL
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

```sh
docker run -d \
  -h jupyter \
  -e NB_USER=jovyan \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -e MINIO_ENDPOINT_URL='http://example-minio:9000' \
  -e MINIO_BUCKET_NAME=examples \
  -v example-jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name example-jupyter \
  example/jupyter-bookstore:latest jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
```

```sh
docker exec -i example-jupyter /bin/sh << \EOSHELL
cat << \EOF > /home/${NB_USER}/.jupyter/jupyter_notebook_config.py
from bookstore import BookstoreContentsArchiver
import os

c = get_config()

c.NotebookApp.contents_manager_class = BookstoreContentsArchiver

c.BookstoreSettings.workspace_prefix = '/workspace/' + os.environ['NB_USER']
c.BookstoreSettings.published_prefix = '/published/' + os.environ['NB_USER']

c.BookstoreSettings.s3_endpoint_url = os.environ['MINIO_ENDPOINT_URL']
c.BookstoreSettings.s3_bucket = os.environ['MINIO_BUCKET_NAME']

c.BookstoreSettings.s3_access_key_id = os.environ['MINIO_ACCESS_KEY']
c.BookstoreSettings.s3_secret_access_key = os.environ['MINIO_SECRET_KEY']

EOF
EOSHELL
```

```sh
docker exec -i example-jupyter jupyter serverextension enable --py bookstore
```

```sh
docker restart example-jupyter
```

```sh
docker exec -i example-jupyter /bin/sh << EOSHELL
cat << EOF > /home/jovyan/work/Index.ipynb
{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "# Welcome to Jupyter!"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "This repo contains an introduction to [Jupyter](https://jupyter.org) and [IPython](https://ipython.org).\n",
    "\n",
    "Outline of some basics:\n",
    "\n",
    "* [Notebook Basics](../examples/Notebook/Notebook%20Basics.ipynb)\n",
    "* [IPython - beyond plain python](../examples/IPython%20Kernel/Beyond%20Plain%20Python.ipynb)\n",
    "* [Markdown Cells](../examples/Notebook/Working%20With%20Markdown%20Cells.ipynb)\n",
    "* [Rich Display System](../examples/IPython%20Kernel/Rich%20Output.ipynb)\n",
    "* [Custom Display logic](../examples/IPython%20Kernel/Custom%20Display%20Logic.ipynb)\n",
    "* [Running a Secure Public Notebook Server](../examples/Notebook/Running%20the%20Notebook%20Server.ipynb#Securing-the-notebook-server)\n",
    "* [How Jupyter works](../examples/Notebook/Multiple%20Languages%2C%20Frontends.ipynb) to run code in different languages."
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "You can also get this tutorial and run it on your laptop:\n",
    "\n",
    "    git clone https://github.com/ipython/ipython-in-depth\n",
    "\n",
    "Install IPython and Jupyter:\n",
    "\n",
    "with [conda](https://www.anaconda.com/download):\n",
    "\n",
    "    conda install ipython jupyter\n",
    "\n",
    "with pip:\n",
    "\n",
    "    # first, always upgrade pip!\n",
    "    pip install --upgrade pip\n",
    "    pip install --upgrade ipython jupyter\n",
    "\n",
    "Start the notebook in the tutorial directory:\n",
    "\n",
    "    cd ipython-in-depth\n",
    "    jupyter notebook"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.6.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
EOF
EOSHELL
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f example-minio example-jupyter
docker volume rm example-minio-data example-jupyter-data
```
