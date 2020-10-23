# Portainer Agent

## Docker

### Dependencies

- [Portainer](/portainer.md)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h portainer-agent \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 9001:9001 \
  --name portainer-agent \
  --network workbench \
  docker.io/portainer/agent:2.0.0
```

### Remove

```sh
docker rm -f portainer-agent
```
