# Memcached

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h memcached \
  -p 11211:11211 \
  --name memcached \
  --network workbench \
  docker.io/library/memcached:1.6-alpine
```

```sh
nmap -p 11211 127.0.0.1
```

### Remove

```sh
docker rm -f memcached
```
