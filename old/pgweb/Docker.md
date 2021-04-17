# Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

## Volume

```sh
docker volume create pgweb-postgres-data
```

## Running

```sh
docker run -d \
  -h postgres.pgweb.local \
  -e POSTGRES_PASSWORD=postgres \
  -v pgweb-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name pgweb-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  -h pgweb.local \
  -e DATABASE_URL='postgres://postgres:postgres@pgweb-postgres:5432/postgres?sslmode=disable' \
  -p 8081:8081 \
  --name pgweb \
  --network workbench \
  docker.io/sosedoff/pgweb:0.11.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8081'
```

## Remove

```sh
docker rm -f pgweb-postgres pgweb
docker volume rm pgweb-postgres-data
```
