# Docker

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
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h pgweb.local \
  -e DATABASE_URL='postgres://postgres:postgres@pgweb-postgres:5432/postgres?sslmode=disable' \
  -p 8081:8081 \
  --name pgweb \
  --restart always \
  --link pgweb-postgres \
  sosedoff/pgweb:0.11.2
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8081"
```

## Remove

```sh
docker rm -f pgweb-postgres pgweb
docker volume rm pgweb-postgres-data
```
