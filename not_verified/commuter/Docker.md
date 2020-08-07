# Docker

## Volume

```sh
docker volume create example-jupyter-data
```

## Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/commuter -
FROM docker.io/node:10.14-alpine

ENV COMMUTER_LOCAL_STORAGE_BASEDIRECTORY /notebooks

RUN npm i @nteract/commuter@5.8.0 -g

EXPOSE 4000

CMD ["/usr/local/bin/commuter"]

EOF
```

## Running

```sh
docker run -d \
  -h jupyter \
  -v example-jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name example-jupyter \
  jupyter/scipy-notebook:d4cbf2f80a2a jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
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
docker run -d \
  -h commuter \
  -v example-jupyter-data:/notebooks \
  -p 4000:4000 \
  --name example-commuter \
  example/commuter:latest
```

## Remove

```sh
docker rm -f example-jupyter
docker volume rm example-jupyter-data
```
