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
