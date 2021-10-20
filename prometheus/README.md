# Prometheus

<!--
https://linkedin.com/learning/kubernetes-monitoring-with-prometheus/prometheus-monitoring-to-prevent-outages
https://github.com/jacksontj/promxy
-->

## Guides

- [Metric types](https://prometheus.io/docs/concepts/metric_types/)
- [Service Discovery (SD)](https://github.com/prometheus/prometheus/tree/main/discovery)
- [Integrations](https://prometheus.io/docs/operating/integrations/)
- [Template Examples](https://prometheus.io/docs/prometheus/latest/configuration/template_examples/)

## Plugins

- [Mozilla Firefox - Prometheus Formatter](https://addons.mozilla.org/en-US/firefox/addon/prometheus-formatter/)

## Links

- [Awesome Prometheus Alerts](https://awesome-prometheus-alerts.grep.to/rules.html)
- [Routing tree editor](https://prometheus.io/webtools/alerting/routing-tree-editor/)

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
  -h prometheus \
  -v prometheus-data:/prometheus \
  -p 9090:9090 \
  --name prometheus \
  --network workbench \
  docker.io/prom/prometheus:v2.28.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9090'
```

### Remove

```sh
docker rm -f prometheus

docker volume rm prometheus-data
```

## Helm

### References

- [Chart Repository](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus)

### Repository

```sh
helm repo add prometheus-community 'https://prometheus-community.github.io/helm-charts'
helm repo update
```

### Dependencies

- Assuming there is already a `monitoring-system` namespace.

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
helm install prometheus prometheus-community/prometheus \
  --namespace monitoring-system \
  --version 14.9.2 \
  -f <(cat << EOF
alertmanager:
  ingress:
    enabled: true
    hosts:
    - alertmanager.${INGRESS_HOST}.nip.io
  # resources:
  #   limits:
  #     cpu: 10m
  #     memory: 32Mi
  #   requests:
  #     cpu: 10m
  #     memory: 32Mi

nodeExporter:
  resources:
    requests:
      cpu: 100m
      memory: 30Mi
    limits:
      cpu: 150m
      memory: 50Mi

server:
  ingress:
    enabled: true
    hosts:
    - prometheus.${INGRESS_HOST}.nip.io
  # resources:
  #   limits:
  #     cpu: 500m
  #     memory: 512Mi
  #   requests:
  #     cpu: 500m
  #     memory: 512Mi

pushgateway:
  ingress:
    enabled: true
    hosts:
    - pushgateway.${INGRESS_HOST}.nip.io
  # resources:
  #   limits:
  #     cpu: 10m
  #     memory: 32Mi
  #   requests:
  #     cpu: 10m
  #     memory: 32Mi
EOF
)
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n monitoring-system
```

```sh
helm upgrade prometheus stable/prometheus -f <(yq m <(cat << EOF
alertmanager:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - alertmanager.${INGRESS_HOST}.nip.io

server:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - prometheus.${INGRESS_HOST}.nip.io
EOF
) <(helm get values prometheus))
```

#### Remove

```sh
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) alertmanager.ingress.tls)
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) server.ingress.tls)

kubectl delete secret example.tls-secret \
  -n monitoring-system
```

### Status

```sh
kubectl rollout status deploy/prometheus-server \
  -n monitoring-system
```

### Logs

```sh
kubectl logs \
  -l 'app=prometheus,component=server' \
  -c prometheus-server \
  -n monitoring-system \
  -f
```

### Delete

```sh
helm uninstall prometheus \
  -n monitoring-system
```

## CLI

### Installation

#### Homebrew

```sh
brew install prometheus
```

#### Linux

```sh
curl -L 'https://github.com/prometheus/prometheus/releases/download/v2.10.0/prometheus-2.10.0.linux-amd64.tar.gz' | \
  sudo tar -xzC /opt && \
    sudo ln -s /opt/prometheus-2.6.1.linux-amd64 /opt/prometheus
```

#### Chocolatey

```sh
choco install -y prometheus
```

### Configuration

```sh
## Darwin
# /usr/local/etc/prometheus.yml

# Linux
sudo useradd -Mrs /sbin/nologin prometheus
sudo usermod -aG prometheus "$USER" && sudo su - "$USER"
```

### Environment

```sh
# Linux
sudo mkdir -p /etc/prometheus
sudo cp /opt/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
sudo chown -R prometheus: /etc/prometheus
sudo chmod -R 775 /etc/prometheus
sudo install -dm 775 -o prometheus -g prometheus /var/lib/prometheus
```

### Service

```sh
# Linux
sudo tee /usr/lib/systemd/system/prometheus.service << EOF
[Unit]
Description=Prometheus Monitoring System
Documentation=https://prometheus.io/docs/introduction/overview/
After=network.target

[Service]
Type=simple
User=prometheus
Group=prometheus
WorkingDirectory=/opt/prometheus
ExecStart=/opt/prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
# Homebrew
brew services start prometheus

# Systemd
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9090'
```
