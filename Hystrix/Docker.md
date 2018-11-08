# Docker

## Running

```sh
docker run -d \
  -h hystrix-dashboard \
  -p 9002:9002 \
  --name hystrix-dashboard \
  --restart always \
  mlabouardy/hystrix-dashboard:latest
```

## Web UI

### Linux

```sh
xdg-open "http://$(docker-machine ip):9002/hystrix.stream"
```

### OS X

```sh
open "http://$(docker-machine ip):9002/hystrix.stream"
```
