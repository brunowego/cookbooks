# Cachet

**Keywords**: Status page

<!--
https://github.com/CastawayLabs/cachet-monitor
https://github.com/mtakaki/cachet-url-monitor
https://github.com/mtakaki/cachet-mysql-monitor
-->

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
  -v cachet-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='cachet' \
  -e POSTGRES_PASSWORD='cachet' \
  -e POSTGRES_DB='cachet' \
  -p 5432:5432 \
  --name cachet-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cachet \
  -v cachet-data:/var/www/html \
  -e DB_DRIVER=pgsql \
  -e DB_HOST=cachet-postgres \
  -e DB_PORT=5432 \
  -e DB_DATABASE=cachet \
  -e DB_USERNAME=cachet \
  -e DB_PASSWORD=cachet \
  -e APP_KEY='base64:9yh4xfdnr3v97K1h1PivuIZq2w4RpivWc00fVkUX2VI=' \
  -p 8000:8000 \
  --name cachet \
  --network workbench \
  docker.io/cachethq/docker:2.3.15
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

### Remove

```sh
docker rm -f cachet-postgres cachet
docker volume rm cachet-postgres-data cachet-data
```
