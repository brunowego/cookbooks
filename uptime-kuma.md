# Uptime Kuma

<!--
https://artifacthub.io/packages/helm/djjudas21/uptime-kuma
-->

**Keywords:** Status Page

## Links

- [Code Repository](https://github.com/louislam/uptime-kuma)
- [Main Website](https://uptime.kuma.pet)

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
  -h uptime-kuma \
  -v uptime-kuma-data:/app/data \
  -p 3001:3001 \
  --name uptime-kuma \
  --network workbench \
  docker.io/louislam/uptime-kuma:1
```
