# Docker

## Running

```sh
docker run -d \
  -h cassandra \
  -p 7000:7000 \
  --name cassandra \
  --restart always \
  cassandra:3.11.4
```

## Remove

```sh
docker rm -f cassandra
```
