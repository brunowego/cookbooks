# Docker

## Volume

```sh
docker volume create tensorboard-logs
```

## Running

```sh
docker run -d \
  -h tensorboard \
  -v tensorboard-logs:/logs \
  -p 6006:6006 \
  --name tensorboard \
  --restart always \
  tensorflow/tensorflow:1.13.1-py3 tensorboard --logdir=/logs --host 0.0.0.0
```

## Remove

```sh
docker rm -f tensorboard
docker volume rm tensorboard-logs
```
