# KrakenD

<!--
https://github.com/bessam-haj-salem/kiabi_microservices/blob/master/krakend.json
https://github.com/bero-semifir/Microservice-Nest/blob/main/config/krakend.json
-->

**Keywords:** API Gateway

## Links

- [Code Repository](https://github.com/krakendio/krakend-ce)
- [Main Website](https://krakend.io)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h krakend \
  -v krakend-config:/etc/krakend \
  -p 8080:8080 \
  --name krakend \
  --network workbench \
  docker.io/devopsfaith/krakend:2.2.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f krakend

docker volume rm krakend-config
```
