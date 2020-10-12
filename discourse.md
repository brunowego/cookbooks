# Discourse

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
  -h redis \
  -v discourse-redis-data:/data \
  --name discourse-redis \
  --network workbench \
  docker.io/library/redis:5.0.4-alpine3.9 redis-server --appendonly yes
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='discourse' \
  -e POSTGRES_PASSWORD='discourse' \
  -e POSTGRES_DB='discourse' \
  -v discourse-postgres-data:/var/lib/postgresql/data \
  --name discourse-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h discourse \
  -v discourse-data:/bitnami \
  -e DISCOURSE_HOSTNAME='discourse.localhost' \
  -e POSTGRESQL_ROOT_USER='discourse' \
  -e POSTGRESQL_ROOT_PASSWORD='discourse' \
  -e POSTGRESQL_HOST='discourse-postgres' \
  -e DISCOURSE_POSTGRESQL_USERNAME='discourse' \
  -e DISCOURSE_POSTGRESQL_PASSWORD='discourse' \
  -e DISCOURSE_POSTGRESQL_NAME='discourse' \
  -e REDIS_HOST='discourse-redis' \
  -p 80:3000 \
  --name discourse \
  --network workbench \
  docker.io/bitnami/discourse:2.5.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| user | admin |

### Remove

```sh
docker rm -f discourse discourse-postgres discourse-redis

docker volume rm discourse-data discourse-postgres-data discourse-redis-data
```