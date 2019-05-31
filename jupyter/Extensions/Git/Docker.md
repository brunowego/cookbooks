# Docker

## Build

```sh
cat << EOF | docker build -t example/jupyterlab-git -
FROM jupyter/scipy-notebook:latest

ENV http_proxy=${http_proxy} \
    https_proxy=${https_proxy} \
    no_proxy=${no_proxy}

RUN jupyter labextension install @jupyterlab/git && \
    pip install jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git --sys-prefix

EOF
```

## Running

```sh
docker run -d \
  -h jupyterlab-git.example.local \
  -p 8888:8888 \
  --name example-jupyterlab-git \
  --restart always \
  example/jupyterlab-git jupyter lab --NotebookApp.token='' --NotebookApp.password=''
```

```sh
docker exec -i example-jupyterlab-git git init
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888"
```

## Remove

```sh
docker rm -f example-jupyterlab-git
```
