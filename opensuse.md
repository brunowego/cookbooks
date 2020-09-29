# openSUSE

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
  -h opensuse \
  --name opensuse \
  --network workbench \
  docker.io/opensuse/leap:15.1 /bin/bash
```
