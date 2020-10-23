# Portainer

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
  -h portainer \
  -v portainer-data:/data \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 9000:9000 \
  --name portainer \
  --network workbench \
  docker.io/portainer/portainer:1.24.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

| Login | Password |
| --- | --- |
| `admin` |  |

### Remove

```sh
docker rm -f portainer

docker volume rm portainer-data
```
