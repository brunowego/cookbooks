# Hystrix Dashboard

## Docker

### Running

```sh
docker run -d \
  -h hystrix-dashboard \
  -p 9002:9002 \
  --name hystrix-dashboard \
  mlabouardy/hystrix-dashboard:latest
```

```sh
xdg-open 'http://127.0.0.1:9002/hystrix.stream' || open 'http://127.0.0.1:9002/hystrix.stream' || echo -e '[INFO]\thttp://127.0.0.1:9002/hystrix.stream'
```

### Remove

```sh
docker rm -f hystrix-dashboard
```
