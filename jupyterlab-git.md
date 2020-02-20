# JupyterLab Git

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/jupyterlab-git -
FROM docker.io/jupyter/scipy-notebook:d4cbf2f80a2a

RUN jupyter labextension install @jupyterlab/git --no-build && \
    pip install jupyterlab-git==0.5.0 && \
    jupyter serverextension enable --sys-prefix --py jupyterlab_git

RUN git init

EOF
```

### Running

```sh
docker run -d \
  -h jupyterlab-git \
  -v jupyterlab-git-data:/home/jovyan/work \
  -p 8888:8888 \
  --name jupyterlab-git \
  example/jupyterlab-git:latest jupyter lab --NotebookApp.token='' --NotebookApp.password=''
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

### Remove

```sh
docker rm -f jupyterlab-git
docker volume rm jupyterlab-git-data
```
