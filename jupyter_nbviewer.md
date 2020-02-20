# Jupyter Notebook Viewer

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jupyter \
  -v example-jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name example-jupyter \
  jupyter/scipy-notebook:d4cbf2f80a2a jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nbviewer \
  -v example-jupyter-data:/notebooks \
  -p 8080:8080 \
  --name example-nbviewer \
  jupyter/nbviewer:latest python -m nbviewer --port=8080 --localfiles='/notebooks'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f example-jupyter example-nbviewer
docker volume rm example-jupyter-data
```
