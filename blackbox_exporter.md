# Blackbox Exporter for Prometheus

## Helm

<!--
https://github.com/helm/charts/tree/master/stable/prometheus-blackbox-exporter
-->

TODO

## Docker

TODO

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Darwin Binary

```sh
curl -L 'https://github.com/prometheus/blackbox_exporter/releases/download/v0.16.0/blackbox_exporter-0.16.0.darwin-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --wildcards --strip-components 1 'blackbox_exporter*/blackbox_exporter'
```

### Commands

```sh
blackbox_exporter -h
```

### Configuration

## Configuration

```sh
sudo tee /etc/blackbox.yml << EOF
modules:
  http_2xx:
    prober: http
    http:

  http_post_2xx:
    prober: http
    http:
      method: POST

  tcp_connect:
    prober: tcp

  pop3s_banner:
    prober: tcp
    tcp:
      query_response:
      - expect: "^+OK"
      tls: true
      tls_config:
        insecure_skip_verify: false

  ssh_banner:
    prober: tcp
    tcp:
      query_response:
      - expect: "^SSH-2.0-"

  irc_banner:
    prober: tcp
    tcp:
      query_response:
      - send: "NICK prober"
      - send: "USER prober prober prober :prober"
      - expect: "PING :([^ ]+)"
        send: "PONG ${1}"
      - expect: "^:[^ ]+ 001"

  icmp:
    prober: icmp

  dns:
    prober: dns
    timeout: 5s
    dns:
       query_name: ${domain}
EOF
```

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
blackbox_exporter \
  --config.file="$HOME/.my.cnf" \
  --web.listen-address=':9115'

echo -e '[INFO]\thttp://127.0.0.1:9115/metrics'
```
