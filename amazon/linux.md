# Amazon Linux 2

## Links

- [Main Website](https://aws.amazon.com/amazon-linux-2/)

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
  docker.io/library/amazonlinux:2022.0.20221207.4-with-sources /bin/bash
```
