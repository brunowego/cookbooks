# Centrifugo

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h centrifugo \
  -e CENTRIFUGO_SECRET=secret \
  -e CENTRIFUGO_ADMIN_PASSWORD=admin \
  -e CENTRIFUGO_ADMIN_SECRET=secret \
  -v centrifugo-config:/centrifugo \
  -p 8000:8000 \
  --name centrifugo \
  --ulimit nofile=65536:65536 \
  centrifugo/centrifugo:v2.2 centrifugo --admin -c /centrifugo/config.json
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

### Remove

```sh
docker rm -f centrifugo
docker volume rm centrifugo-config
```

## Installation

### Homebrew

```sh
brew install centrifugal/centrifugo/centrifugo
```
