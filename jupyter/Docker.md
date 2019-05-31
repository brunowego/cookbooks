# Docker

## Volume

```sh
docker volume create jupyter-data
```

## Running

```sh
docker run -d \
  -h jupyter \
  -v jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyter \
  --restart always \
  jupyter/scipy-notebook:latest jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
```

## Remove

```sh
docker rm -f jupyter
docker volume rm jupyter-data
```
