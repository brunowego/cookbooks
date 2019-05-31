# Docker

## Volume

```sh
docker volume create jupyterlab-data
```

## Running

```sh
docker run -d \
  -h jupyterlab \
  -v jupyterlab-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyterlab \
  --restart always \
  jupyter/scipy-notebook:latest jupyter lab --NotebookApp.token='' --NotebookApp.password=''
```

## Remove

```sh
docker rm -f jupyterlab
docker volume rm jupyterlab-data
```
