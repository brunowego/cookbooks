# n8n

<!--
https://github.com/8gears/n8n-helm-chart
-->

**Keywords:** Data Workflow, Low-code

## Links

- [Code Repository](https://github.com/n8n-io/n8n)
- [Main Website](https://n8n.io)

## App

### Installation

#### Zip File

- [macOS](https://downloads.n8n.io/file/n8n-downloads/n8n-mac.zip)
- [Windows](https://downloads.n8n.io/file/n8n-downloads/n8n-win.zip)

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
  -e POSTGRES_USER='n8n' \
  -e POSTGRES_PASSWORD='n8n' \
  -e POSTGRES_DB='n8n' \
  -v n8n-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name n8n-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h n8n \
  -e N8N_BASIC_AUTH_ACTIVE='true' \
  -e N8N_BASIC_AUTH_USER='admin' \
  -e N8N_BASIC_AUTH_PASSWORD='admin' \
  -e DB_TYPE='postgresdb' \
  -e DB_POSTGRESDB_HOST='n8n-postgres' \
  -e DB_POSTGRESDB_PORT='5432' \
  -e DB_POSTGRESDB_USER='n8n' \
  -e DB_POSTGRESDB_PASSWORD='n8n' \
  -e DB_POSTGRESDB_DATABASE='n8n' \
  -p 5678:5678 \
  --name n8n \
  --network workbench \
  docker.io/n8nio/n8n:0.210.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5678'
```

### Remove

```sh
docker rm -f n8n-postgres n8n

docker volume rm n8n-postgres-data
```

## Helm

### Dependencies

- Database
  - [PostgreSQL](/postgresql/server.md#helm) (local)

<!-- - Session
  - [Redis](/redis/cluster.md#helm) -->

### References

- [Configuration](https://github.com/8gears/n8n-helm-chart#configuration)

### Repository

```sh
helm repo add open-8gears 'https://8gears.container-registry.com/chartrepo/library'
helm repo update
```

### Install

```sh
#
kubectl create ns n8n-system
# kubectl create ns workflow

#
helm search repo -l open-8gears/n8n

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade n8n open-8gears/n8n \
  --namespace n8n-system \
  --version 0.8.0 \
  -f <(cat << EOF
n8n:
  encryption_key: S3cr3t_K#Key

config:
  database:
    type: postgresdb
    postgresdb:
      host: postgresql.psql-system.svc

secret:
  database:
    postgresdb:
      database: n8n
      user: n8n
      password: n8n

ingress:
  enabled: true
  hosts:
    - host: n8n.${DOMAIN}
      paths: ['/']
EOF
)

#
kubectl get all -n n8n-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=n8n' \
  -n n8n-system \
  -f
```

### Delete

```sh
helm uninstall n8n \
  -n n8n-system

kubectl delete ns n8n-system \
  --grace-period=0 \
  --force
```
