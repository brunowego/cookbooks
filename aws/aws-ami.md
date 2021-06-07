# Amazon Machine Image (AMI)

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
  -h amazonlinux \
  --name amazonlinux \
  --network workbench \
  docker.io/library/amazonlinux:2 /bin/bash
```
