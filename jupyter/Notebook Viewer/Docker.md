# Notebook Viewer

## Volume

```sh
docker volume create example-jupyter-data
```

## Running

```sh
docker run -d \
  -h jupyter.example.local \
  -v example-jupyter-data:/home/jovyan/work \
  -p 8888:8888 \
  --name example-jupyter \
  --restart always \
  jupyter/scipy-notebook:latest jupyter notebook --NotebookApp.token='' --NotebookApp.password=''
```

```sh
docker run -d \
  -h nbviewer.example.local \
  -v example-jupyter-data:/notebooks \
  -p 8080:8080 \
  --name example-nbviewer \
  --restart always \
  jupyter/nbviewer:latest python -m nbviewer --port=8080 --localfiles='/notebooks'
```

## Remove

```sh
docker rm -f example-jupyter example-nbviewer
docker volume rm example-jupyter-data
```
