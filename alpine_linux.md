# Alpine Linux

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h alpine \
  --name alpine \
  --network workbench \
  docker.io/library/alpine:3.9 /bin/sh
```
