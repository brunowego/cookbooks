# HAProxy Exporter for Prometheus

## Docker

TODO

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Darwin Binary

```sh
curl -L 'https://github.com/prometheus/haproxy_exporter/releases/download/v0.10.0/haproxy_exporter-0.10.0.darwin-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --wildcards --strip-components 1 'haproxy_exporter*/haproxy_exporter'
```

### Commands

```sh
haproxy_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: haproxy
  static_configs:
  - targets:
    - localhost:9101
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
haproxy_exporter \
  --web.listen-address=':9101' \
  --config.my-cnf="$HOME/.my.cnf"

echo -e '[INFO]\thttp://127.0.0.1:9101/metrics'
```
