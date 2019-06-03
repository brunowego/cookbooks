# Alpine Linux

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h alpine \
  --name alpine \
  alpine:3.9 /bin/sh
```
