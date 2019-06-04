# JupyterLab Git

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/jupyterlab-git -
FROM jupyter/scipy-notebook:latest

RUN jupyter labextension install @jupyterlab/git && \
    pip install jupyterlab-git && \
    jupyter serverextension enable --py jupyterlab_git --sys-prefix

RUN git init

EOF
```

### Running

```sh
docker run -d \
  -h jupyterlab-git.example.local \
  -p 8888:8888 \
  --name example-jupyterlab-git \
  --restart always \
  example/jupyterlab-git jupyter lab --NotebookApp.token='' --NotebookApp.password=''
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888"
```

### Remove

```sh
docker rm -f example-jupyterlab-git
```
