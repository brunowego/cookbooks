# Zammad

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Runnings

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='zammad' \
  -e POSTGRES_PASSWORD='zammad' \
  -e POSTGRES_DB='zammad' \
  -v zammad-postgresql-data:/var/lib/postgresql/data \
  --name zammad-postgresql \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-postgresql-3.6.0-65

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h memcached \
  --name zammad-memcached \
  --network workbench \
  docker.io/library/memcached:1.6.9-alpine memcached -m 256M

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v zammad-elasticsearch-config:/usr/share/elasticsearch/config \
  -v zammad-elasticsearch-data:/usr/share/elasticsearch/data \
  -v zammad-elasticsearch-logs:/usr/share/elasticsearch/logs \
  --name zammad-elasticsearch \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-elasticsearch-3.6.0-65

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zammad-railsserver \
  -v zammad-data:/opt/zammad \
  --name zammad-railsserver \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-3.6.0-65 zammad-railsserver

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zammad-scheduler \
  -v zammad-data:/opt/zammad \
  --name zammad-scheduler \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-3.6.0-65 zammad-scheduler

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zammad-websocket \
  -v zammad-data:/opt/zammad \
  --name zammad-websocket \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-3.6.0-65 zammad-websocket

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zammad-init \
  -e POSTGRESQL_HOST='zammad-postgresql' \
  -e POSTGRESQL_DB='zammad' \
  -e POSTGRESQL_USER='zammad' \
  -e POSTGRESQL_PASS='zammad' \
  -e ELASTICSEARCH_HOST='zammad-elasticsearch' \
  -e ELASTICSEARCH_SSL_VERIFY='false' \
  -e MEMCACHED_HOST='zammad-memcached' \
  -e ZAMMAD_RAILSSERVER_HOST='zammad-railsserver' \
  -e ZAMMAD_WEBSOCKET_HOST='zammad-websocket' \
  -v zammad-data:/opt/zammad \
  --name zammad-init \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-3.6.0-65 zammad-init

# Known Issue: Initial database seed crashes with base64: invalid input #2727
# https://github.com/zammad/zammad/issues/2727

docker restart zammad-init

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zammad-backup \
  -e BACKUP_SLEEP='86400' \
  -e HOLD_DAYS='10' \
  -e POSTGRESQL_HOST='zammad-postgresql' \
  -e POSTGRESQL_DB='zammad' \
  -e POSTGRESQL_USER='zammad' \
  -e POSTGRESQL_PASSWORD='zammad' \
  -e ZAMMAD_RAILSSERVER_HOST='zammad-railsserver' \
  -v zammad-backup-tmp:/var/tmp/zammad \
  -v zammad-data:/opt/zammad \
  -v zammad-backup-data:/var/lib/postgresql/data \
  --entrypoint /usr/local/bin/backup.sh \
  --name zammad-backup \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-postgresql-3.6.0-65 zammad-backup

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -p 8080:80 \
  -v zammad-data:/opt/zammad \
  --name zammad-nginx \
  --network workbench \
  docker.io/zammad/zammad-docker-compose:zammad-3.6.0-65 zammad-nginx
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

### Remove

```sh
docker rm -f \
  zammad-postgresql \
  zammad-memcached \
  zammad-elasticsearch \
  zammad-railsserver \
  zammad-scheduler \
  zammad-websocket \
  zammad-init \
  zammad-backup \
  zammad-nginx

docker volume rm \
  zammad-postgresql-data \
  zammad-elasticsearch-config \
  zammad-elasticsearch-data \
  zammad-elasticsearch-logs \
  zammad-backup-tmp \
  zammad-backup-data \
  zammad-data
```
