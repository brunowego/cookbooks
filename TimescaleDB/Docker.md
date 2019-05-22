# Docker

## Running

```sh
docker run -d \
  -h timescale \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  --name timescaledb \
  --restart always \
  timescale/timescaledb:latest
```

## Remove

```sh
docker rm -f timescaledb
```
