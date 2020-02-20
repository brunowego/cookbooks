# Docker

## Running

```sh
docker run -it --rm \
  --network host \
  --name vtctlclient \
  docker.io/vitess/vtctlclient:latest /usr/bin/vtctlclient -server 127.0.0.1:15999 help
```

## Remove

```sh
docker rm -f vtctlclient
```
