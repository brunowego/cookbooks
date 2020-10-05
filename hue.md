# Hue

TODO

## Helm

### Repository

```sh
helm repo add gethue https://helm.gethue.com
helm repo update gethue
```

### Install

```sh
kubectl create namespace hue
```

```sh
helm install gethue/hue \
  -n hue \
  --namespace hue \
  --set ingress.enabled=true \
  --set ingress.hosts={hue.$(minikube ip).nip.io}
```

```sh
kubectl get secret hue \
  -o jsonpath='{.data.admin-password}' \
  -n hue | \
    base64 --decode; echo
```

### Delete

```sh
helm delete hue --purge
kubectl delete namespace hue --grace-period=0 --force
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
docker rm -f hue-postgres hue
docker volume rm hue-postgres-data
```
