# Kali Linux

## Links

- [Main Website](https://kali.org/)

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
  -h kali \
  --name kali \
  --network workbench \
  docker.io/kalilinux/kali:amd64 /bin/bash
```
