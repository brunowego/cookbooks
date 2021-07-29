# Node Exporter for Prometheus

## CLI

### Installation

#### Homebrew

```sh
brew install node_exporter
```

#### Darwin Binary

```sh
curl -L 'https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.darwin-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --wildcards --strip-components 1 'node_exporter*/node_exporter'
```

#### Linux Binary

```sh
curl -L 'https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz' | \
  sudo tar -xzC /usr/local/bin --wildcards --strip-components 1 'node_exporter*/node_exporter'
```

### Commands

```sh
node_exporter -h
```

### Service

```sh
# Homebrew
brew services start node_exporter

# Systemd
sudo tee /usr/lib/systemd/system/node_exporter.service << EOF
[Unit]
Description=Node Exporter

[Service]
ExecStart=/opt/node_exporter/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter
```

### Usage

#### Status

```sh
node_exporter \
  --web.listen-address=':9100'

echo -e '[INFO]\thttp://127.0.0.1:9100/metrics'
```

### Tips

#### Prometheus Scrapping

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: node
  static_configs:
  - targets:
    - localhost:9100
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

## Docker

### Associated

- [Prometheus Alertmanager](/prometheus/prometheus-alertmanager.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h node-exporter \
  -p 9100:9100 \
  --name node-exporter \
  --network workbench \
  docker.io/prom/node-exporter:v1.2.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9100/metrics'
```

### Remove

```sh
docker rm -f node-exporter
```
