# Zipkin

## References

- [Quickstart](https://zipkin.io/pages/quickstart.html)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zipkin \
  -p 9411:9411 \
  --name zipkin \
  docker.io/openzipkin/zipkin:2.19.1
```

```sh
xdg-open 'http://127.0.0.1:9411' || open 'http://127.0.0.1:9411' || echo -e '[INFO]\thttp://127.0.0.1:9411'
```

### Remove

```sh
docker rm -f zipkin
```
