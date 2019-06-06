# BusyBox

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h busybox \
  --name busybox \
  busybox:1.30.1 /bin/sh
```
