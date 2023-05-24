# n8n

<!--
https://github.com/search?l=JSON&o=desc&q=filename%3A.json+%22pinData%22+%22+connections%22+%22versionId%22+%22nodes%22&s=indexed&type=Code
-->

<!--
https://github.com/jrCleber/n8n-codechat-wapi
-->

<!--
https://github.com/kazitcin/n8n/tree/main/workflows

https://github.com/GustavoFLuz/n8n-workflow-backup/tree/main/workflows
https://github.com/TheBoatyMcBoatFace/reinhardt-backups/tree/main/workflows
https://github.com/besteetorn/n8n-backups/tree/main/workflows
-->

<!--
https://autotic.com.br/curso-intensivo-de-n8n/
https://promovaweb.com/n8n/courses/n8n99-setup-avancado-e-configuracoes-do-n8n/lesson/3fcf3536-db20-478a-886e-65e24d8700cb
https://autotic.com.br/curso-intensivo-de-n8n/
-->

**Keywords:** Data Workflow, Low-code, BPM, iPaaS

## Links

- [Code Repository](https://github.com/n8n-io/n8n)
- [Main Website](https://n8n.io)
- [Integrations](https://n8n.io/integrations/)
- Docs
  - [API](https://docs.n8n.io/api/)
  - [API Reference](https://docs.n8n.io/api/api-reference/)

## App

### Installation

#### Zip File

- [macOS](https://downloads.n8n.io/file/n8n-downloads/n8n-mac.zip)
- [Windows](https://downloads.n8n.io/file/n8n-downloads/n8n-win.zip)

## CLI

### Commands

```sh
npx n8n -h
```

<!-- ### Usage

```sh
#
n8n start --tunnel
``` -->

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
  docker.io/n8nio/n8n:0.215.1
```

<!--
https://hub.docker.com/r/n8nio/n8n
-->

```sh
echo -e '[INFO]\thttp://127.0.0.1:5678'
```

### Remove

```sh
docker rm -f n8n-postgres n8n

docker volume rm n8n-postgres-data
```

## Docker Compose

### Links

- [Server setups](https://docs.n8n.io/hosting/installation/server-setups/docker-compose/)

### Usage

```sh
#
cd ./n8n

#
docker compose config

#
docker compose up

#
docker compose down
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
  encryption_key: S3cr3t_K@Key

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

<!--
NODE_ENV: production
GENERIC_TIMEZONE: America/Sao_Paulo

N8N_SMTP_HOST=smtp.gmail.com
N8N_SMTP_PORT=587
N8N_SMTP_SSL='false'
N8N_SMTP_USER=
N8N_SMTP_PASS=
N8N_SMTP_SENDER=no-reply@xyz.tld

N8N_EDITOR_BASE_URL: https://n8n.xyz.tld
-->

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=n8n' \
  -n n8n-system \
  -f
```

### Issues

#### Disable SMTP SSL

```log
There is a problem with your SMTP setup! 140548125915520:error:1408F10B:SSL routines:ssl3_get_record:wrong version number:../deps/openssl/openssl/ssl/record/ssl3_record.c:331:
```

<!--
https://github.com/n8n-io/n8n/issues/3297
-->

Set `N8N_SMTP_SSL` to `false`.

### Delete

```sh
helm uninstall n8n \
  -n n8n-system

kubectl delete ns n8n-system \
  --grace-period=0 \
  --force
```

## Issues

### TBD

```log
NodeOperationError: Forbidden - perhaps check your credentials? (item 0)
```

TODO

<!--
https://console.cloud.google.com/apis/library/gmail.googleapis.com?project=budibase-375113
-->

### TBD

```log
NodeOperationError: Precondition check failed. (item 0)
```

TODO
