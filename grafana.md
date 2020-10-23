# Grafana

## References

- [Druid Datasource](https://grafana.com/grafana/plugins/abhisant-druid-datasource)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/grafana#configuration)

### Install

```sh
kubectl create namespace grafana
```

```sh
helm install stable/grafana \
  -n grafana \
  --namespace grafana \
  --set ingress.enabled=true \
  --set ingress.hosts={grafana.$(minikube ip).nip.io}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n grafana
```

```sh
helm upgrade grafana stable/grafana -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - grafana.$(minikube ip).nip.io
EOF
) <(helm get values grafana))
```

#### Remove

```sh
helm upgrade grafana stable/grafana -f <(yq d <(helm get values grafana) ingress.tls)

kubectl delete secret example.tls-secret -n grafana
```

### Status

```sh
kubectl rollout status deploy/grafana -n grafana
```

### Logs

```sh
kubectl logs -l 'app=grafana' -n grafana -f
```

### DNS

```sh
dig @10.96.0.10 grafana.grafana.svc.cluster.local +short
nslookup grafana.grafana.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "grafana.$(minikube ip).nip.io" +short
nslookup "grafana.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret grafana \
  -o jsonpath='{.data.admin-password}' \
  -n grafana | \
    base64 --decode; echo
```

### Delete

```sh
helm delete grafana --purge
kubectl delete namespace grafana --grace-period=0 --force
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

#### 5.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e GF_INSTALL_PLUGINS='grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel' \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:5.4.5
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

#### 6.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e GF_INSTALL_PLUGINS='grafana-clock-panel, grafana-simple-json-datasource, grafana-piechart-panel' \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:6.6.0
```

<!-- ```sh
docker cp [filename].json grafana:/etc/grafana/provisioning/dashboards
``` -->

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Shell

```sh
docker exec -it grafana /bin/bash
```

### Remove

```sh
docker rm -f grafana

docker volume rm grafana-config grafana-data
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
sudo dpkg -i grafana_6.6.0_amd64.deb && rm -f grafana_6.6.0_amd64.deb
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
grafana-cli --insecure plugins install [name]

#
service grafana-server restart
```
