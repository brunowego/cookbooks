# vaultwarden

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h vaultwarden \
  -v vaultwarden-data:/data \
  -e WEBSOCKET_ENABLED='true' \
  -p 8080:80 \
  -p 3012:3012 \
  --name vaultwarden \
  --network workbench \
  docker.io/vaultwarden/server:1.21.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f vaultwarden

docker volume rm vaultwarden-data
```
