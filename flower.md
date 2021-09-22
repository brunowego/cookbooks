# Flower

## Links

- [Code Repository](https://github.com/mher/flower/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# RabbitMQ
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq \
  -v rabbitmq-data:/var/lib/rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  --name rabbitmq \
  --network workbench \
  docker.io/library/rabbitmq:3.8.2-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h flower \
  -e CELERY_BROKER_URL='amqp://admin:admin@rabbitmq:5672' \
  -e CELERY_RESULT_BACKEND='rpc://admin:admin@rabbitmq:5672' \
  -e CELERY_RESULT_PERSISTENT='true' \
  -e CELERY_RESULT_EXCHANGE='celery_results' \
  -e CELERY_SEND_EVENTS='true' \
  -e FLOWER_PORT='5555' \
  -p 5555:5555 \
  --name flower \
  --network workbench \
  docker.io/mher/flower:0.9.7

# Redis
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='admin' \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --network workbench \
  --entrypoint /bin/sh \
  docker.io/library/redis:5.0.5-alpine3.9 -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h flower \
  -e CELERY_BROKER_URL='redis://:admin@redis:6379/0' \
  -e CELERY_RESULT_BACKEND='redis://:admin@redis:6379/0' \
  -e CELERY_RESULT_PERSISTENT='true' \
  -e CELERY_RESULT_EXCHANGE='celery_results' \
  -e CELERY_SEND_EVENTS='true' \
  -e FLOWER_PORT='5555' \
  -p 5555:5555 \
  --name flower \
  --network workbench \
  docker.io/mher/flower:0.9.7
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5555'
```

### Remove

```sh
# RabbitMQ
docker rm -f rabbitmq flower

# Redis
docker rm -f redis flower
```
