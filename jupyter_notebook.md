# Jupyter Notebook

## Installation

### Homebrew

```sh
brew install jupyter
```

## Docker

### Volume

```sh
docker volume create jupyter-data
```

### Running

```sh
docker run -d \
  -h jupyter \
  -v jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyter \
  --restart always \
  jupyter/scipy-notebook:latest jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888"
```

### Remove

```sh
docker rm -f jupyter
docker volume rm jupyter-data
```

## Commands

```sh
jupyter -h
```
