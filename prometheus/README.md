# Prometheus

<!--
https://linkedin.com/learning/kubernetes-monitoring-with-prometheus/prometheus-monitoring-to-prevent-outages
https://github.com/jacksontj/promxy
-->

**Keywords:** Metrics, Alerting, Monitoring System

## Links

- [Org. Repository](https://github.com/prometheus)
- [Main Website](https://prometheus.io)
- [Service Discovery (SD)](https://github.com/prometheus/prometheus/tree/main/discovery)

## Docs

- [Metric types](https://prometheus.io/docs/concepts/metric_types/)
- [Integrations](https://prometheus.io/docs/operating/integrations/)
- [Template Examples](https://prometheus.io/docs/prometheus/latest/configuration/template_examples/)
- [Awesome Prometheus Alerts](https://awesome-prometheus-alerts.grep.to/rules.html)

## Tools

- [Routing tree editor](https://prometheus.io/webtools/alerting/routing-tree-editor/)

## Plugins

- [Mozilla Firefox - Prometheus Formatter](https://addons.mozilla.org/en-US/firefox/addon/prometheus-formatter/)

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

### Install

```sh
#
kubectl create ns prometheus
# kubectl create ns metrics

#
kubens prometheus

#
helm search repo -l prometheus-community/prometheus

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install prometheus prometheus-community/prometheus \
  --version 15.18.0 \
  -f <(cat << EOF
alertmanager:
  ingress:
    enabled: false
    ingressClassName: nginx
    hosts:
      - alertmanager.${K8S_DOMAIN}

server:
  ingress:
    enabled: false
    ingressClassName: nginx
    hosts:
      - prometheus.${K8S_DOMAIN}

pushgateway:
  ingress:
    enabled: false
    ingressClassName: nginx
    hosts:
      - pushgateway.${K8S_DOMAIN}
EOF
)
```

#### Remove

```sh
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) alertmanager.ingress.tls)
helm upgrade prometheus stable/prometheus -f <(yq d <(helm get values prometheus) server.ingress.tls)

kubectl delete secret prometheus.tls-secret
```

### Status

```sh
kubectl rollout status deploy/prometheus-server
```

### Logs

```sh
kubectl logs \
  -l 'app=prometheus,component=server' \
  -c prometheus-server \
  -f
```

### Issues

#### TBD

```log
Error: INSTALLATION FAILED: rendered manifests contain a resource that already exists. Unable to continue with install: ClusterRole "prometheus-kube-state-metrics" in namespace "" exists and cannot be imported into the current release: invalid ownership metadata; annotation validation error: key "meta.helm.sh/release-namespace" must equal "metrics": current value is "lens-metrics"
```

```sh
#
kubectl delete clusterrole prometheus-kube-state-metrics
kubectl delete clusterrolebinding prometheus-kube-state-metrics
```

### Delete

```sh
#
helm uninstall prometheus

#
kubectl delete ns prometheus \
  --grace-period=0 \
  --force
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
