# JupyterLab

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jupyterlab \
  -v jupyterlab-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyterlab \
  docker.io/jupyter/scipy-notebook:42f4c82a07ff jupyter lab \
    --NotebookApp.token='' \
    --NotebookApp.password=''
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

### Remove

```sh
docker rm -f jupyterlab

docker volume rm jupyterlab-data
```

## CLI

### Installation

```sh
pip install -U jupyterlab
```

### Commands

```sh
jupyter lab --help-all
```

```sh
jupyter labextension --help-all
```

#### Usage

```sh
# Running
jupyter lab \
  --NotebookApp.token='' \
  --NotebookApp.password=''
```
