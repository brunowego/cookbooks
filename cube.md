# Cube

## Links

- [Code Repository](https://github.com/cube-js/cube)
- [Main Website](https://cube.dev)

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
  -h cube \
  -v cube-config:/cube/conf \
  -e CUBEJS_DEV_MODE='true' \
  -p 4000:4000 \
  --name cube \
  --network workbench \
  docker.io/cubejs/cube:v0.32
```

### Remove

```sh
docker rm -f cube

docker volume rm cube-config
```
