# Neural Autonomic Transport System (NATS)

## Links

- [Main Website](https://nats.io)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nats \
  -p 4222:4222 \
  -p 6222:6222 \
  -p 8222:8222 \
  --name nats \
  --network workbench \
  docker.io/library/nats:2.9.14-alpine
```

### Remove

```sh
docker rm -f nats
```
