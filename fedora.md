# Fedora

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h fedora \
  --name fedora \
  docker.io/library/fedora:31 /bin/bash
```
