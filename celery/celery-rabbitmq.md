# Celery with RabbitMQ Broker

## Docker

### Dependencies

- [RabbitMQ](/rabbitmq.md#docker)

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
