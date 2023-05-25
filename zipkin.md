# Zipkin

**Keywords:** Distributed Tracing System

## Links

- [Main Website](https://zipkin.io)

## References

- [Quickstart](https://zipkin.io/pages/quickstart.html)

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
  -h zipkin \
  -p 9411:9411 \
  --name zipkin \
  --network workbench \
  docker.io/openzipkin/zipkin:2.19.1
```

```sh
xdg-open 'http://127.0.0.1:9411' || open 'http://127.0.0.1:9411' || echo -e '[INFO]\thttp://127.0.0.1:9411'
```

### Remove

```sh
docker rm -f zipkin
```
