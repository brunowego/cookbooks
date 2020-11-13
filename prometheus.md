# Prometheus

<!--
https://www.linkedin.com/learning/kubernetes-monitoring-with-prometheus/prometheus-monitoring-to-prevent-outages
-->

## References

- [Metric types](https://prometheus.io/docs/concepts/metric_types/)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/prometheus#configuration)

### Install

```sh
kubectl create namespace monitoring
```

```sh
helm install stable/prometheus \
  -n prometheus \
  --namespace monitoring \
  --set alertmanager.enabled=true \
  --set alertmanager.ingress.enabled=true \
  --set alertmanager.ingress.hosts={alertmanager.$(minikube ip).nip.io} \
  --set server.ingress.enabled=true \
  --set server.ingress.hosts={prometheus.$(minikube ip).nip.io}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n monitoring
```

```sh
helm upgrade prometheus stable/prometheus -f <(yq m <(cat << EOF
alertmanager:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - alertmanager.$(minikube ip).nip.io

server:
  ingress:
    tls:
      - secretName: example.tls-secret
        hosts:
          - prometheus.$(minikube ip).nip.io
EOF
) <(helm get values prometheus))
```

#### Remove

```sh
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) alertmanager.ingress.tls)
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) server.ingress.tls)

kubectl delete secret example.tls-secret -n monitoring
```

### Status

```sh
kubectl rollout status deploy/prometheus-server -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'app=prometheus,component=server' \
  -c prometheus-server \
  -n monitoring \
  -f
```

### DNS

```sh
dig @10.96.0.10 prometheus-server.monitoring.svc.cluster.local +short
nslookup prometheus-server.monitoring.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "prometheus.$(minikube ip).nip.io" +short
nslookup "prometheus.$(minikube ip).nip.io" 10.96.0.10
```

### Delete

```sh
helm delete prometheus --purge
kubectl delete namespace monitoring --grace-period=0 --force
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

## Docker

### Associated

- [Prometheus Alertmanager](/prometheus-alertmanager.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

#### 1.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h prometheus \
  -v prometheus-data:/prometheus \
  -p 9090:9090 \
  --name prometheus \
  --network workbench \
  docker.io/prom/prometheus:v1.8.2
```

```sh
docker exec -i prometheus /bin/sh << EOSHELL
cat << EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
- job_name: prometheus
  static_configs:
  - targets:
    - localhost:9090

EOF
EOSHELL
```

```sh
docker restart prometheus
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9090'
```

#### 2.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h prometheus \
  -v prometheus-data:/prometheus \
  -p 9090:9090 \
  --name prometheus \
  --network workbench \
  docker.io/prom/prometheus:v2.15.2
```

```sh
docker exec -i prometheus /bin/sh << EOSHELL
cat << EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
- job_name: prometheus
  static_configs:
  - targets:
    - localhost:9090

EOF
EOSHELL
```

```sh
docker restart prometheus
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9090'
```

### Remove

```sh
docker rm -f prometheus

docker volume rm prometheus-data
```
