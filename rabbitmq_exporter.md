# RabbitMQ Exporter for Prometheus

## Helm

TODO

<!--
https://github.com/helm/charts/tree/master/stable/prometheus-rabbitmq-exporter
-->

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
docker rm -f php-fpm_exporter php-fpm
```

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/hipages/php-fpm_exporter/releases/download/v1.0.0/php-fpm_exporter_1.0.0_darwin_amd64' \
  -o /usr/local/bin/php-fpm_exporter
```

```sh
chmod +x /usr/local/bin/php-fpm_exporter
```

### Commands

```sh
php-fpm_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: php-fpm
  static_configs:
  - targets:
    - localhost:9253
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

### Usage

#### Status

```sh
# PHPBrew
phpbrew fpm start

# Get
php-fpm_exporter get \
  --phpfpm.scrape-uri tcp://127.0.0.1:9000/status

# Server
php-fpm_exporter server \
  --phpfpm.scrape-uri tcp://127.0.0.1:9000/status

echo -e '[INFO]\thttp://127.0.0.1:9253/metrics'
```

- [Grafana - Kubernetes PHP-FPM](https://grafana.com/grafana/dashboards/4912)
