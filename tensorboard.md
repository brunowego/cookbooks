# TensorBoard

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h tensorboard \
  -v tensorboard-logs:/logs \
  -p 6006:6006 \
  --name tensorboard \
  tensorflow/tensorflow:1.13.2-py3 tensorboard --logdir=/logs --host 0.0.0.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:6006'
```

### Remove

```sh
docker rm -f tensorboard
docker volume rm tensorboard-logs
```
