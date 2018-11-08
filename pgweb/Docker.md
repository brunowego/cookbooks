# Docker

## Volume

```sh
docker volume create postgres-data
```

## Running

```sh
docker run -d \
  -h postgres \
  -e POSTGRES_PASSWORD=postgres \
  -v postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h pgweb \
  -e DATABASE_URL='postgres://postgres:postgres@postgres:5432/postgres?sslmode=disable' \
  -p 8081:8081 \
  --name pgweb \
  --restart always \
  --link postgres \
  sosedoff/pgweb:0.11.2
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8081"
```
