# Docker OS X

## Links

- [Code Repository](https://github.com/sickcodes/Docker-OSX)

## Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

## Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  --device /dev/kvm \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY="${DISPLAY:-:0.0}" \
  -e GENERATE_UNIQUE='true' \
  -e MASTER_PLIST_URL='https://raw.githubusercontent.com/sickcodes/osx-serial-generator/master/config-custom.plist' \
  -p 10022:10022 \
  --name big-sur \
  --network workbench \
  docker.io/sickcodes/docker-osx:big-sur
```
