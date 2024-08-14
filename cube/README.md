# Cube

<!--
https://github.com/erxes/erxes
https://github.com/coopcycle/coopcycle-web

https://github.com/uidu-org/uidu-cube

https://github.com/seb7887/ecommerce-platform/tree/main
-->

**Keywords:** Metrics API, Semantic Layer, React Chart

## Links

- [Code Repository](https://github.com/cube-js/cube)
  - [Packages](https://github.com/cube-js/cube/tree/master/packages)
- [Main Website](https://cube.dev)
- [Learn](https://cube.dev/learn)
- [Docs](https://cube.dev/docs)
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
  docker.io/cubejs/cube:v0.33
```

### Remove

```sh
docker rm -f cube

docker volume rm cube-config
```

## Docker Compose

### Manifest

```yml
---
services:
  # ...

  cube:
    image: docker.io/cubejs/cube:v0.33
    volumes:
      - type: volume
        source: cube-config
        target: /cube/conf
    environment:
      CUBEJS_DB_TYPE:
      CUBEJS_DB_HOST:
      CUBEJS_DB_PORT:
      CUBEJS_DB_NAME:
      CUBEJS_DB_USER:
      CUBEJS_DB_PASS:
      CUBEJS_REDIS_URL:
      CUBEJS_API_SECRET:
      CUBEJS_DEV_MODE:
    ports:
      - target: 4000
        published: $CUBEJS_PORT
        protocol: tcp
    restart: unless-stopped
    depends_on:
      - redis
      - postgres

volumes:
  cube-config:
    driver: local
```
