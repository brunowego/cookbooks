# Docker

## Running

```sh
docker run -d \
  -h portainer \
  -v /opt/portainer/data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -p 9000:9000 \
  --name portainer \
  --restart always \
  portainer/portainer:latest
```
