# Debian

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h debian \
  --name debian \
  debian:9.9-slim /bin/bash
```
