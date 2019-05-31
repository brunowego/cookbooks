# Docker

## Volume

```sh
docker volume create redis-data
```

## Running

```sh
docker run -d \
  -h redis \
  -e REDIS_PASSWORD=redis \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --restart always \
  redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

## Remove

```sh
docker rm -f redis
docker volume rm redis-data
```
