# Docker

## Volume

```sh
docker volume create portainer-data
```

## Running

```sh
docker run -d \
  -h portainer \
  -v portainer-data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 9000:9000 \
  --name portainer \
  --restart always \
  portainer/portainer:latest
```

## Remove

```sh
docker rm -f portainer
docker volume rm portainer-data
```
