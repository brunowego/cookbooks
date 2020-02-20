# Docker

## Volume

```sh
docker volume create tensorflow-notebooks
```

## Running

```sh
docker run -d \
  -h tensorflow-py3-jupyter \
  -v tensorflow-notebooks:/tf/notebooks \
  -p 8888:8888 \
  --name tensorflow-py3-jupyter \
  tensorflow/tensorflow:1.13.1-py3-jupyter bash -c 'source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token="" --NotebookApp.password=""'
```

## Remove

```sh
docker rm -f tensorflow
docker volume rm tensorflow-notebooks
```
