# Debian

## References

- [Debian CD](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)
- [Packages Search for Linux and Unix](https://pkgs.org/)

## Docker

### Running

```sh
# 10.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h debian \
  --name debian \
  docker.io/library/debian:10.9-slim /bin/bash

# 9.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h debian \
  --name debian \
  docker.io/library/debian:9.9-slim /bin/bash
```
