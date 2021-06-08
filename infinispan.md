# Infinispan

<!--
https://keycloak.discourse.group/t/keycloak-with-centralized-cache-store/1846
-->

## Guides

- [Get Started](https://infinispan.org/get-started/)

## Podman

```sh
podman run \
  -it \
  -p 11222:11222 \
  -e USER='admin' \
  -e PASS='password' \
  --net host \
  quay.io/infinispan/server:12.1
```

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
  -h infinispan \
  -e USER='admin' \
  -e PASS='Pa$$w0rd!' \
  -p 11222:11222 \
  --name infinispan \
  --network workbench \
  quay.io/infinispan/server:12.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:11222'
```

### Remove

```sh
docker rm -f infinispan
```
