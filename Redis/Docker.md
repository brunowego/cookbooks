# Docker

## Volume

```sh
docker volume create redis-data
```

## Running

```sh
docker run -d \
  -h redis \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  --restart always \
  redis:5.0.4-alpine3.9 redis-server --appendonly yes
```
