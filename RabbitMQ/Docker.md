# Docker

## Running

```sh
docker run -d \
  -h rabbitmq \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=admin \
  -p 5672:5672 \
  --name rabbitmq \
  --restart always \
  rabbitmq:3.7.14-alpine
```

## Remove

```sh
docker rm -f rabbitmq
```
