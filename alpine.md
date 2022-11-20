# Alpine Linux

## Links

- [Main Website](https://alpinelinux.org/)

## Related

- [Alpine Package Keeper (APK)](/apk.md)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# 3.x
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h alpine \
  --name alpine \
  --network workbench \
  docker.io/library/alpine:3.14 /bin/sh
```

## Kubectl

### Running

```sh
kubectl run -it --rm \
  --image docker.io/library/alpine:3.14 \
  --limits 'cpu=2,memory=2Gi' \
  --requests 'cpu=2,memory=2Gi' \
  --restart Never \
  centos \
  -- /bin/sh
```
