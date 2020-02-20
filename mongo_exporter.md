# Mongo Exporter for Prometheus

## Docker

TODO

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
- job_name: mongo
  static_configs:
  - targets:
    - localhost:9204
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
