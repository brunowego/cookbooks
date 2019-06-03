# CentOS

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h centos \
  --name centos \
  centos:7 /bin/bash
```
