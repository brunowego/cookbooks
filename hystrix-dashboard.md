# Hystrix Dashboard

## References

- [Hystrix](/hystrix.md)

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
  -h hystrix-dashboard \
  -p 9002:9002 \
  --name hystrix-dashboard \
  --network workbench \
  docker.io/mlabouardy/hystrix-dashboard:latest
```

```sh
xdg-open 'http://127.0.0.1:9002/hystrix.stream' || open 'http://127.0.0.1:9002/hystrix.stream' || echo -e '[INFO]\thttp://127.0.0.1:9002/hystrix.stream'
```

### Remove

```sh
docker rm -f hystrix-dashboard
```
