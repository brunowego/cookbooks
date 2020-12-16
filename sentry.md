# Sentry

## CLI

### Installation

#### Dependencies

- [Python 2](/python2.md)
- [PostgreSQL](/postgresql.md)
- [Redis](/redis.md)

#### PIP

```sh
pip install -U sentry
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

#### CORS

```sh
curl -iX GET "$SENTRY_DSN" | \
  grep -i 'Access-Control-Allow-Origin'

curl -iX OPTIONS "$SENTRY_DSN" | \
  grep -i 'Access-Control-Allow-Origin'
```

### Issues

<!-- ####

```log
Background workers haven't checked in recently. This is likely an issue with your configuration or the workers aren't running.
```

TODO -->

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/sentry#configuration)

### Install

```sh
kubectl create namespace sentry
```

```sh
helm install stable/sentry \
  -n sentry \
  --namespace sentry \
  --set user.email='admin@example.com' \
  --set service.type='ClusterIP' \
  --set ingress.enabled=true \
  --set ingress.hostname="sentry.$(minikube ip).nip.io"
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n sentry
```

```sh
helm upgrade sentry stable/sentry -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - sentry.$(minikube ip).nip.io
EOF
) <(helm get values sentry))
```

#### Remove

```sh
helm upgrade sentry stable/sentry -f <(yq d <(helm get values sentry) ingress.tls)

kubectl delete secret example.tls-secret -n sentry
```

### Status

```sh
kubectl rollout status deploy/sentry-web -n sentry
```

### Logs

```sh
kubectl logs -l 'app=sentry,role=web' -n sentry -f
kubectl logs -l 'app=sentry,role=worker' -n sentry -f
kubectl logs -l 'app=sentry,role=cron' -n sentry -f
```

### DNS

```sh
dig @10.96.0.10 sentry.sentry.svc.cluster.local +short
nslookup sentry.sentry.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "sentry.$(minikube ip).nip.io" +short
nslookup "sentry.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret sentry \
  -o jsonpath='{.data.user-password}' \
  -n sentry | \
    base64 --decode; echo
```

### Delete

```sh
helm delete sentry --purge
kubectl delete namespace sentry --grace-period=0 --force
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
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass $REDIS_PASSWORD'

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
  -e SENTRY_SERVER_EMAIL='noreply@example.com' \
  -e SENTRY_EMAIL_HOST='smtp.example.com' \
  -e SENTRY_EMAIL_PORT='587' \
  -e SENTRY_EMAIL_USER='noreply@example.com' \
  -e SENTRY_EMAIL_PASSWORD='Pa$$w0rd!' \
  -e SENTRY_EMAIL_USE_TLS='true' \
  -e SENTRY_SECRET_KEY='hbUaAougOvKIVOvF4v5cMUzYk1uzIi6C2Ch1SAabJT8xRmIuUEQ4AQWfVe7FiPZ10mAzDt4$' \
  -p 9000:9000 \
  --name sentry \
  --network workbench \
  docker.io/getsentry/sentry:20.11.1-py3
```

```sh
docker exec sentry sentry upgrade --noinput

docker exec sentry sentry createuser \
  --email='admin@example.com' \
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
docker-compose up -d

#
echo -e '[INFO]\thttp://127.0.0.1:9000'
```
