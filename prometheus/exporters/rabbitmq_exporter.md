# RabbitMQ Exporter for Prometheus

<!--
https://github.com/helm/charts/tree/master/stable/prometheus-rabbitmq-exporter
-->

## Links

- [Code Repository](https://github.com/kbudde/rabbitmq_exporter)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  --name rabbitmq \
  docker.io/library/rabbitmq:3.8.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq_exporter \
  -e RABBIT_URL='http://127.0.0.1:15672' \
  -e RABBIT_USER='guest' \
  -e RABBIT_PASSWORD='guest' \
  -p 9253:9253 \
  --name rabbitmq_exporter \
  docker.io/kbudde/rabbitmq-exporter:v0.29.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9253/metrics'
```

### Remove

```sh
docker rm -f \
  rabbitmq \
  rabbitmq_exporter
```
