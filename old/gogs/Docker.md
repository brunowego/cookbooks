# Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

## Volume

```sh
docker volume create gogs-postgres-data
docker volume create gogs-data
```

## Running

```sh
docker run -d \
  -h postgres.gogs.local \
  -e POSTGRES_DB=gogs \
  -e POSTGRES_USER=gogs \
  -e POSTGRES_PASSWORD=gogs \
  -v gogs-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name gogs-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  -h gogs \
  -v gogs-data:/data \
  -p 2222:22 \
  -p 8080:3000 \
  --name gogs \
  --network workbench \
  docker.io/gogs/gogs:0.11.86
```

## Remove

```sh
docker rm -f gogs-postgres gogs
docker volume rm gogs-postgres-data gogs-data
```
