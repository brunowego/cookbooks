# Snapcraft

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h snapcraft \
  --name snapcraft \
  docker.io/snapcore/snapcraft:stable /bin/bash
```

### Remove

```sh
docker rm -f snapcraft
```
