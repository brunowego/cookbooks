# Ghost

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
  -h ghost \
  -v ghost-content:/var/lib/ghost/content \
  -p 2368:2368 \
  --name ghost \
  --network workbench \
  docker.io/library/ghost:3.18-alpine
```

> Wait! This process take a while.

```sh
docker logs -f ghost | sed '/Ghost is running in production.../ q'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:2368'

# Admin
echo -e '[INFO]\thttp://127.0.0.1:2368/ghost'
```

### Remove

```sh
docker rm -f ghost

docker volume rm ghost-content
```
