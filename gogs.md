# Gogs

**Keywords:** Self-Hosted Git Service

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
  -e POSTGRES_DB='gogs' \
  -e POSTGRES_USER='gogs' \
  -e POSTGRES_PASSWORD='gogs' \
  -v gogs-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name gogs-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h gogs \
  -v gogs-data:/data \
  -p 2222:22 \
  -p 3000:3000 \
  --name gogs \
  --network workbench \
  docker.io/gogs/gogs:0.12.3
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f gogs-postgres gogs

docker volume rm gogs-postgres-data gogs-data
```
