# Sentry

<!--
https://blog.sentry.io/2018/07/17/source-code-fetching

https://www.figma.com/file/NFOla85HaxGxbg6O1AdSWw/Color-System?t=XmKOcZHKw09kUquB-0

- operations
- desktop
- web-frontend
-->

**Keyword:** Error Tracking, Unexpected Error Tracking

## Links

- [Code Repository](https://github.com/getsentry/sentry)
- [Main Website](https://sentry.io)
- [Status Page](https://status.sentry.io)
- Develop
  - [Troubleshooting](https://develop.sentry.dev/self-hosted/troubleshooting/)
  - [Environment](https://develop.sentry.dev/environment/)
  - [Storybook](https://storybook.sentry.dev)

## Glossary

- Data Source Name (DSN)

## CLI

### Installation

#### Dependencies

- [Python 2](/python2.md)
- [PostgreSQL](/postgresql/server.md)
- [Redis](/redis.md)

#### pip

```sh
pip3 install -U sentry
```

### Commands

```sh
sentry --help
```

### Configuration

```sh
sentry init
```

### Running

```sh
# Create PostgreSQL database.
psql \
  -h 127.0.0.1 \
  -U postgres \
  -c 'CREATE DATABASE sentry'

# Set in Sentry config file the password for Redis.
yq w -i ~/.sentry/config.yml '"redis.clusters".default.hosts[0].password' redis

# Set in Sentry python config the password for PostgreSQL
sed -i "/PASSWORD/ s/''/'postgres'/" ~/.sentry/sentry.conf.py

# Run migrations
sentry upgrade

# Running
nohup sentry run web &
nohup sentry run cron &
nohup sentry run worker &

echo -e '[INFO]\thttp://127.0.0.1:9000'

# Stop
pkill uwsgi
```

### Tips

#### Cleanup

```sh
#
kubectl exec -it \
  $(kubectl get pod -l 'app=sentry,role=web' -o jsonpath='{.items[0].metadata.name}' -n sentry) \
  -n sentry \
  -- sentry cleanup --help

#
kubectl exec -it \
  $(kubectl get pod -l 'app=sentry,role=web' -o jsonpath='{.items[0].metadata.name}' -n sentry) \
  -n sentry \
  -- sentry cleanup \
    --days 30 \
    --project '<project>'
```

#### CORS

```sh
curl -iX GET "$SENTRY_DSN" | \
  grep -i 'Access-Control-Allow-Origin'

curl -iX OPTIONS "$SENTRY_DSN" | \
  grep -i 'Access-Control-Allow-Origin'
```

## Helm

### References

- [Configuration](https://github.com/sentry-kubernetes/charts/tree/develop/sentry#configuration)

### Repository

```sh
helm repo add sentry 'https://sentry-kubernetes.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns sentry
# kubectl create ns tracking

#
kubens sentry

#
helm search repo -l sentry/sentry

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install sentry sentry/sentry \
  --version 17.8.0 \
  -f <(cat << EOF
user:
  create: false

sentry:
  worker:
    replicas: 1

nginx:
  enabled: false

hooks:
  activeDeadlineSeconds: 1200

ingress:
  enabled: true
  ingressClassName: nginx
  hostname: sentry.${K8S_DOMAIN}

clickhouse:
  clickhouse:
    replicas: 1

zookeeper:
  replicaCount: 1

kafka:
  replicaCount: 1

redis:
  replica:
    replicaCount: 1

rabbitmq:
  replicaCount: 1
EOF
) \
  --timeout 15m \
  --wait
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/sentry-web \
  9000:9000

kubectl port-forward \
  --address 0.0.0.0 \
  svc/sentry-sentry-postgresql \
  5432:5432
-->

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade sentry sentry/sentry \
  -f <(yq m <(cat << EOF
metrics:
  enabled: true
  serviceMonitor:
    enabled: true
    additionalLabels:
      release: prometheus-stack
EOF
) <(helm get values sentry))
```

### Status

```sh
kubectl rollout status deploy/sentry-web
```

### Logs

```sh
kubectl logs \
  -l 'app=sentry,role=web' \
  -f

kubectl logs \
  -l 'app=sentry,role=worker' \
  -f

kubectl logs \
  -l 'app=sentry,role=cron' \
  -f

kubectl logs \
  -l 'app=sentry,role=snuba-api' \
  -f

kubectl logs \
  -l 'app.kubernetes.io/component=kafka' \
  -f
```

### Ingress

```sh
#
echo -e "[INFO]\thttp://sentry.${K8S_DOMAIN}"
```

### Secrets

```sh
kubectl get secret sentry-sentry-postgresql \
  -o jsonpath='{.data.postgresql-password}' | \
    base64 -d; echo
```

### Tips

### Create User Auth Token

1. [Auth Tokens](https://sentry.io/settings/account/api/auth-tokens)
2. Create New User Auth Token
   - General -> Name: `local` <!-- pre-prod -->
   - Permissions -> Project: `Read & Write`, Release: `Admin`, Issue & Event: `Read & Write`

<!--
event:read, event:write, project:read, project:releases, project:write
-->

#### Create User

```sh
kubectl exec -it \
  $(kubectl get pod -l 'release=sentry,role=web' -o jsonpath='{.items[0].metadata.name}') \
  -- \
    sentry createuser \
      --email='bruno.batista@xyz.tld' \
      --password='Pa$$w0rd!' \
      --no-input \
      --superuser
```

### Issues

#### Kafka Offset Out of Range

```log
Exception: KafkaError{code=OFFSET_OUT_OF_RANGE,val=1,str="Broker: Offset out of range"}
```

```sh
#
kubectl exec -it sentry-kafka-0 -- /bin/bash

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --list
```

##### Snuba Consumers

```sh
#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-consumers \
  --describe

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-consumers \
  --topic events \
  --reset-offsets \
  --to-latest \
  --dry-run

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-consumers \
  --topic events \
  --reset-offsets \
  --to-latest \
  --execute
```

###### Active Consumers Stop

```sh
#
kubectl scale deployment sentry-snuba-consumer \
  --replicas 0

#
kubectl scale deployment sentry-ingest-consumer \
  --replicas 0

#
kubectl scale deployment sentry-sessions-consumer \
  --replicas 0

#
kubectl scale deployment sentry-snuba-outcomes-consumer \
  --replicas 0
```

##### Snuba Post Processor

```sh
#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-post-processor \
  --describe

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-post-processor \
  --topic events \
  --reset-offsets \
  --to-latest \
  --dry-run

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group snuba-post-processor \
  --topic events \
  --reset-offsets \
  --to-latest \
  --execute
```

###### Active Consumers Stop 1

```sh
#
kubectl scale deployment sentry-post-process-forward \
  --replicas 0 \
  -n sentry
```

###### Transactions Group

```sh
#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group transactions_group \
  --describe

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group transactions_group \
  --topic events \
  --reset-offsets \
  --to-latest \
  --dry-run

#
/opt/bitnami/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server sentry-kafka-0:9092 \
  --group transactions_group \
  --topic events \
  --reset-offsets \
  --to-latest \
  --execute
```

###### Active Consumers Stop 2

```sh
#
kubectl scale deployment sentry-snuba-transactions-consumer \
  --replicas 0 \
  -n sentry
```

#### Active Consumers

```log
Error: Assignments can only be reset if the group 'snuba-consumers' is inactive, but the current state is Stable.
```

Need stop current consumers before continue.

#### Remote Offset

```log
[INFO] sentry.eventstream.kafka.state: Remote offset for events/0 has moved backwards (current: 20840879, previous: 20841164)
```

TODO

<!-- ####

```log
Background workers haven't checked in recently. This is likely an issue with your configuration or the workers aren't running.
```

TODO -->

#### Redis Infinite Terminating

```sh
#
kubectl delete pod sentry-sentry-redis-master-0 \
  --grace-period=0 \
  --force \
  -n sentry

#
kubectl delete pod sentry-sentry-redis-slave-0 \
  --grace-period=0 \
  --force \
  -n sentry
```

### Delete

```sh
helm uninstall sentry

kubectl delete ns sentry \
  --grace-period=0 \
  --force
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
  -h postgresql \
  -e POSTGRES_USER='sentry' \
  -e POSTGRES_PASSWORD='sentry' \
  -e POSTGRES_DB='sentry' \
  -v sentry-postgresql-data:/var/lib/postgresql/data \
  --name sentry-postgres \
  --network workbench \
  docker.io/library/postgres:9.6-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='sentry' \
  -v sentry-redis-data:/data \
  --name sentry-redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --requirepass $REDIS_PASSWORD'

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h memcached \
  --name sentry-memcached \
  --network workbench \
  docker.io/library/memcached:1.6-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sentry \
  -v sentry-data:/data \
  -e SENTRY_POSTGRES_HOST='sentry-postgres' \
  -e SENTRY_POSTGRES_PORT='5432' \
  -e SENTRY_DB_NAME='sentry' \
  -e SENTRY_DB_USER='sentry' \
  -e SENTRY_DB_PASSWORD='sentry' \
  -e SENTRY_REDIS_HOST='sentry-redis' \
  -e SENTRY_REDIS_PORT='6379' \
  -e SENTRY_REDIS_PASSWORD='sentry' \
  -e SENTRY_REDIS_DB='0' \
  -e SENTRY_MEMCACHED_HOST='sentry-memcached' \
  -e SENTRY_MEMCACHED_PORT='11211' \
  -e SENTRY_SERVER_EMAIL='noreply@xyz.tld' \
  -e SENTRY_EMAIL_HOST='smtp.xyz.tld' \
  -e SENTRY_EMAIL_PORT='587' \
  -e SENTRY_EMAIL_USER='noreply@xyz.tld' \
  -e SENTRY_EMAIL_PASSWORD='Pa$$w0rd!' \
  -e SENTRY_EMAIL_USE_TLS='true' \
  -e SENTRY_SECRET_KEY='hbUaAougOvKIVOvF4v5cMUzYk1uzIi6C2Ch1SAabJT8xRmIuUEQ4AQWfVe7FiPZ10mAzDt4$' \
  -p 9000:9000 \
  --name sentry \
  --network workbench \
  docker.io/getsentry/sentry:23.1.0
```

```sh
docker exec sentry sentry upgrade --noinput

docker exec sentry sentry createuser \
  --email='admin@xyz.tld' \
  --password='Pa$$w0rd!' \
  --no-input \
  --superuser
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cron \
  -v sentry-cron-data:/data \
  -e SENTRY_REDIS_HOST='sentry-redis' \
  -e SENTRY_REDIS_PORT='6379' \
  -e SENTRY_REDIS_PASSWORD='sentry' \
  -e SENTRY_REDIS_DB='0' \
  -e SENTRY_SECRET_KEY='hbUaAougOvKIVOvF4v5cMUzYk1uzIi6C2Ch1SAabJT8xRmIuUEQ4AQWfVe7FiPZ10mAzDt4$' \
  --name sentry-cron \
  --network workbench \
  docker.io/getsentry/sentry:20.11.1-py3 run cron

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h worker \
  -v sentry-worker-data:/data \
  -e SENTRY_POSTGRES_HOST='sentry-postgres' \
  -e SENTRY_POSTGRES_PORT='5432' \
  -e SENTRY_DB_NAME='sentry' \
  -e SENTRY_DB_USER='sentry' \
  -e SENTRY_DB_PASSWORD='sentry' \
  -e SENTRY_REDIS_HOST='sentry-redis' \
  -e SENTRY_REDIS_PORT='6379' \
  -e SENTRY_REDIS_PASSWORD='sentry' \
  -e SENTRY_REDIS_DB='0' \
  -e SENTRY_SECRET_KEY='hbUaAougOvKIVOvF4v5cMUzYk1uzIi6C2Ch1SAabJT8xRmIuUEQ4AQWfVe7FiPZ10mAzDt4$' \
  --name sentry-worker \
  --network workbench \
  docker.io/getsentry/sentry:20.11.1-py3 run worker
```

```sh
docker run kafka kafka-topics --list --bootstrap-server kafka:9092
docker run kafka kafka-topics --create --topic ingest-attachments --bootstrap-server kafka:9092
docker run kafka kafka-topics --create --topic ingest-transactions --bootstrap-server kafka:9092
docker run kafka kafka-topics --create --topic ingest-events --bootstrap-server kafka:9092

docker run snuba-api snuba bootstrap --no-migrate --force
docker run snuba-api snuba migrations migrate --force
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

### Remove

```sh
docker rm -f sentry sentry-cron sentry-worker sentry-postgres sentry-redis sentry-memcached

docker volume rm sentry-data sentry-cron-data sentry-worker-data sentry-redis-data sentry-postgresql-data
```

## Docker Compose

### Running

```sh
#
git clone https://github.com/getsentry/onpremise.git onpremise && cd "$_"

#
./install.sh

#
docker compose up -d

#
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

<!-- ## AWS

### Issues

#### TBD

```sh
kubectl describe pod sentry-sentry-redis-master-0

tag:kubernetes.io/created-for/pvc/name : redis-data-sentry-sentry-redis-master-0

kubectl describe pod sentry-sentry-redis-slave-0

kubectl describe pod sentry-sentry-redis-slave-1
``` -->
