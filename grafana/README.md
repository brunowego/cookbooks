# Grafana

**Keyword:** Monitoring, Open Observability Platform

<!--
https://linkedin.com/learning/graphite-and-grafana-visualizing-application-performance/monitoring-and-visualizing-system-performance
https://linkedin.com/learning/kubernetes-monitoring-with-prometheus/prometheus-monitoring-to-prevent-outages
https://app.pluralsight.com/library/courses/monitoring-containerized-app-health-docker/table-of-contents
-->

## References

- [Druid Datasource](https://grafana.com/grafana/plugins/abhisant-druid-datasource)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e GF_INSTALL_PLUGINS='grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel' \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:9.5.2

# Using Google SSO
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e GF_AUTH_GOOGLE_ENABLED='true' \
  -e GF_AUTH_GOOGLE_CLIENT_ID='[client-id]' \
  -e GF_AUTH_GOOGLE_CLIENT_SECRET='[client-secret]' \
  -e GF_AUTH_GOOGLE_SCOPES='https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email' \
  -e GF_AUTH_GOOGLE_AUTH_URL='https://accounts.google.com/o/oauth2/auth' \
  -e GF_AUTH_GOOGLE_TOKEN_URL='https://accounts.google.com/o/oauth2/token' \
  -e GF_AUTH_GOOGLE_ALLOWED_DOMAINS='xyz.tld' \
  -e GF_AUTH_GOOGLE_ALLOW_SIGN_UP='true' \
  -e GF_INSTALL_PLUGINS='grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel' \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:9.5.2

# Using SMTP
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e GF_SMTP_ENABLED='true' \
  -e GF_SMTP_HOST='smtp.gmail.com:587' \
  -e GF_SMTP_USER='[email]' \
  -e GF_SMTP_PASSWORD='[password]' \
  -e GF_SMTP_FROM_ADDRESS='[xyz.tld]' \
  -e GF_SMTP_FROM_NAME='[From Name]' \
  -e GF_INSTALL_PLUGINS='grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel' \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:9.5.2
```

<!-- ```sh
docker cp [filename].json grafana:/etc/grafana/provisioning/dashboards
``` -->

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Shell

```sh
docker exec -it grafana /bin/bash
```

### Backup

```sh
#
docker cp ./grafana.db grafana:/var/lib/grafana/grafana.db

#
docker exec \
  -u 0 \
  -it grafana \
  chown grafana:root /var/lib/grafana/grafana.db

#
docker restart grafana
```

<!--
/etc/grafana/provisioning
-->

### Remove

```sh
docker rm -f grafana

docker volume rm grafana-config grafana-data
```

## Docker Compose

### Manifest

```yml
---
services:
  grafana:
    image: docker.io/grafana/grafana:9.5.2
    container_name: boilerplate-grafana
    volumes:
      - type: volume
        source: grafana-config
        target: /etc/grafana
      - type: volume
        source: grafana-data
        target: /var/lib/grafana
    environment:
      # GF_INSTALL_PLUGINS: grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel
      GF_AUTH_BASIC_ENABLED: false
      GF_AUTH_ANONYMOUS_ENABLED: true
    ports:
      - target: 3000
        published: $GRAFANA_PORT
        protocol: tcp
    restart: unless-stopped

volumes:
  grafana-config:
    driver: local
  grafana-data:
    driver: local
```

## Helm

### References

- [Configuration](https://github.com/grafana/helm-charts/tree/main/charts/grafana#configuration)

### Repository

```sh
helm repo add grafana 'https://grafana.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns grafana && kubens grafana
# kubectl create ns monitoring

#
helm search repo -l grafana/grafana

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install grafana grafana/grafana \
  --version 6.57.2 \
  -f <(cat << EOF
adminPassword: $(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)

ingress:
  enabled: true
  hosts:
    - grafana.${K8S_DOMAIN}
  ingressClassName: nginx

# plugins:
#   - grafana-piechart-panel
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/monitoring-grafana \
  8080:80
-->

### Status

```sh
kubectl rollout status deploy/grafana
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=grafana' \
  -f
```

### Secret

```sh
kubectl get secret grafana \
  -o jsonpath='{.data.admin-password}' | \
    base64 -d; echo
```

### Vertical Pod Autoscaler (VPA)

```sh
#
kubens grafana

#
kubectl get deploy

#
cat << EOF | kubectl apply -f -
---
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: grafana
spec:
  targetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: grafana
  resourcePolicy:
    containerPolicies:
      - containerName: '*'
        minAllowed:
          cpu: 10m
          memory: 50Mi
        maxAllowed:
          cpu: 1
          memory: 500Mi
        controlledResources: ["cpu", "memory"]
EOF

#
kubectl get vpa
kubectl describe vpa grafana
```

### Delete

```sh
helm uninstall grafana

kubectl delete ns grafana \
  --grace-period=0 \
  --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install grafana
```

#### YUM

```sh
yum check-update
sudo yum -y localinstall https://dl.grafana.com/oss/release/grafana-6.6.0-1.x86_64.rpm
```

#### DPKG

```sh
wget https://dl.grafana.com/oss/release/grafana_6.6.0_amd64.deb

sudo dpkg -i grafana_6.6.0_amd64.deb && \
  rm -f grafana_6.6.0_amd64.deb
```

#### Chocolatey

```sh
choco install -y grafana
```

### Service

```sh
# Homebrew
brew services start grafana

# Systemd
sudo systemctl enable --now grafana-server
```

### Commands

```sh
grafana-cli -h
grafana-server -h
```

### Usage

#### Install Plugin

```sh
#
grafana-cli --insecure plugins install <name>

#
service grafana-server restart
```
