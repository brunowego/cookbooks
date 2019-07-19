# OpenJDK

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h openjdk \
  --name openjdk \
  openjdk:8-jre-slim /bin/bash
```
