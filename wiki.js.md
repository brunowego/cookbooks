# Wiki.js

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
  -v wiki-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER=wiki \
  -e POSTGRES_PASSWORD=wiki \
  -e POSTGRES_DB=wiki \
  -p 5432:5432 \
  --name wiki-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h wiki \
  -e DB_TYPE=postgres \
  -e DB_HOST=wiki-postgres \
  -e DB_PORT=5432 \
  -e DB_USER=wiki \
  -e DB_PASS=wiki \
  -e DB_NAME=wiki \
  -p 3000:3000 \
  --name wiki \
  --network workbench \
  docker.io/requarks/wiki:beta
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f wiki-postgres wiki
docker volume rm wiki-postgres-data
```
