# Debian

## References

- [Debian CD](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)
- [](https://pkgs.org/)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h debian \
  --name debian \
  docker.io/library/debian:9.9-slim /bin/bash
```
