# Docker

## Volume

```sh
docker volume create cassandra-data
```

## Running

```sh
docker run -d \
  -h cassandra \
  -v cassandra-data:/var/lib/cassandra \
  -p 9042:9042 \
  --name cassandra \
  cassandra:3.11.4
```

## Remove

```sh
docker rm -f cassandra
```
