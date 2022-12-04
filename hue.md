# Hue

## Alternatives

- [Apache Zeppelin](/apache/zeppelin.md)

## Helm

### Repository

```sh
helm repo add gethue https://helm.gethue.com
helm repo update
```

### Install

```sh
kubectl create ns hue
```

```sh
helm install hue gethue/hue \
  --namespace hue \
  --set ingress.enabled=true \
  --set ingress.hosts={hue.${DOMAIN}}
```

```sh
kubectl get secret hue \
  -o jsonpath='{.data.admin-password}' \
  -n hue | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall hue -n hue
kubectl delete ns hue --grace-period=0 --force
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
  -h postgres \
  -e POSTGRES_USER='hue' \
  -e POSTGRES_PASSWORD='hue' \
  -e POSTGRES_DB='hue' \
  -v hue-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name hue-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  -h hue \
  -p 8888:8888 \
  --name hue \
  docker.io/gethue/hue:4.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

### Remove

```sh
docker rm -f \
  hue-postgres \
  hue

docker volume rm hue-postgres-data
```
