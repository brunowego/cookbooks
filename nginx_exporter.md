# NGINX Exporter for Prometheus

## Docker

TODO

## CLI

### Installation

#### Linux Binary

```sh
curl -L 'https://github.com/nginxinc/nginx-prometheus-exporter/releases/download/v0.5.0/nginx-prometheus-exporter-0.5.0-linux-amd64.tar.gz' | \
  sudo tar -xzC /usr/local/bin
```

### Commands

```sh
nginx-prometheus-exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: nginx
  static_configs:
  - targets:
    - localhost:9113
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
node_exporter \
  --web.listen-address=':9113'

echo -e '[INFO]\thttp://127.0.0.1:9113/metrics'
```
