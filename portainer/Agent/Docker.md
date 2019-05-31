# Docker

## Running

```sh
docker run -d \
  -h portainer-agent \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 9001:9001 \
  --name portainer_agent \
  --restart always \
  portainer/agent:latest
```
