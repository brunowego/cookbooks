# Docker

## Running

```sh
docker run -d \
  -h consul \
  -e CONSUL_BIND_INTERFACE=eth0 \
  -p 8500:8500/tcp \
  --name consul \
  --restart always \
  consul:1.4.4 agent -bootstrap-expect=1 -client=0.0.0.0 -server -ui
```

## Web UI

### Linux

```sh
xdg-open "http://$(docker-machine ip):8500"
```

### OS X

```sh
open "http://$(docker-machine ip):8500"
```
