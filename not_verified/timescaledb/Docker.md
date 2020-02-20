# Docker

## Running

```sh
docker run -d \
  -h timescale \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  --name timescaledb \
  timescale/timescaledb:latest
```

## Remove

```sh
docker rm -f timescaledb
```
