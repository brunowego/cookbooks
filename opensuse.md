# openSUSE

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h opensuse \
  --name opensuse \
  docker.io/opensuse/leap:15.1 /bin/bash
```
