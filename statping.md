# Statping

**Keywords:** Status page

## References

- [Code Repository](https://github.com/statping/statping)
- [Main Website](https://statping.com/)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L "https://github.com/statping/statping/releases/download/$(curl -s https://api.github.com/repos/statping/statping/releases/latest | grep tag_name | cut -d '"' -f 4)/statping-darwin-amd64.tar.gz" | \
    tar -xzC /usr/local/bin
```

#### Linux Binary

```sh
sudo curl \
  -L "https://github.com/statping/statping/releases/download/$(curl -s https://api.github.com/repos/statping/statping/releases/latest | grep tag_name | cut -d '"' -f 4)/statping-linux-amd64.tar.gz" | \
    sudo tar -xzC /usr/local/bin
```

### Commands

```sh
statping -h
```

### Configuration

```sh
cat << EOF > ./config.yml
connection: sqlite3
language: en
allow_reports: true
location: $PWD
sqlfile: $PWD/statping.db
disable_http: false
demo_mode: false
disable_logs: false
use_assets: false
sample_data: false
use_cdn: false
disable_colors: false
EOF
```

### Running

```sh
statping -c ./config.yml
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'

# Dashboard
echo -e '[INFO]\thttp://127.0.0.1:8080/login'
```

```sh
# Stop
pkill statping
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='statping' \
  -e POSTGRES_PASSWORD='statping' \
  -e POSTGRES_DB='statping' \
  -v statping-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name statping-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h statping \
  -e DB_CONN='postgres' \
  -e DB_HOST='statping-postgres' \
  -e DB_USER='statping' \
  -e DB_PASS='statping' \
  -e DB_DATABASE='statping' \
  -v statping-data:/app \
  -p 8080:8080 \
  --name statping \
  --network workbench \
  docker.io/hunterlong/statping:v0.90.74
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'

# Dashboard
echo -e '[INFO]\thttp://127.0.0.1:8080/login'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Remove

```sh
docker rm -f statping-postgres statping

docker volume rm statping-postgres-data statping-data
```

## Helm

### References

- [Values](https://github.com/statping/charts/tree/main/charts/statping#values)

### Repository

```sh
helm repo add statping 'https://statping.github.io/charts'
helm repo update
```

### Dependencies

- Assuming there is already a `monitoring` stack (namespace).

### Install

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install statping statping/statping \
  --namespace monitoring \
  --version 0.1.14 \
  -f <(cat << EOF
ingress:
  enabled: true
  hostname: statping.${DOMAIN}
persistence:
  storageClassName: $(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}')
EOF
)
```

> Wait! This process take a while.

### Status

```sh
kubectl rollout status deploy/statping \
  -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=statping' \
  -n monitoring \
  -f
```

### Delete

```sh
helm uninstall statping \
  -n monitoring
```
