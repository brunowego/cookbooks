# Celery with Redis Broker

## Docker

### Dependencies

- [Redis](/redis.md#docker)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h celery \
  --name celery \
  --network workbench \
  docker.io/library/celery:4.0
```

### Remove

```sh
docker rm -f celery
```
