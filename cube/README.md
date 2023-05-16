# Cube

**Keywords:** Metrics API, Semantic Layer

## Links

- [Code Repository](https://github.com/cube-js/cube)
- [Main Website](https://cube.dev)
- Blog
  - [Open source Looker alternative with Cube and Apache Superset](https://cube.dev/blog/open-source-looker-alternative)

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
  -p 15432:15432 \
  --name cube \
  --network workbench \
  docker.io/cubejs/cube:v0.32
```

### Remove

```sh
docker rm -f cube

docker volume rm cube-config
```
