# Kong

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/kong#configuration)

### Install

```sh
kubectl create namespace kong
```

```sh
helm install stable/kong \
  -n kong \
  --namespace kong \
  --set admin.useTLS=false \
  --set admin.type='ClusterIP' \
  --set admin.ingress.enabled=true \
  --set admin.ingress.hosts={kong.$(minikube ip).nip.io} \
  --set proxy.tls.enabled=false \
  --set proxy.type='ClusterIP' \
  --set proxy.ingress.enabled=true \
  --set serviceMonitor.enabled=true
```

### Status

```sh
kubectl rollout status deploy/kong-kong -n kong
```

### Logs

```sh
kubectl logs -l 'app=kong,component=app' -n kong -f
```

### DNS

```sh
dig @10.96.0.10 kong-kong-proxy.kong.svc.cluster.local +short
nslookup kong-kong-proxy.kong.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "kong.$(minikube ip).nip.io" +short
nslookup "kong.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret kong-postgresql \
  -o jsonpath='{.data.postgresql-password}' \
  -n kong | \
    base64 --decode; echo
```

### Delete

```sh
helm delete kong --purge
kubectl delete namespace kong --grace-period=0 --force
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
  -e POSTGRES_USER=kong \
  -e POSTGRES_PASSWORD=kong \
  -e POSTGRES_DB=kong \
  -v kong-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name kong-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -e KONG_PG_HOST=kong-postgres \
  -e KONG_PG_USER=kong \
  -e KONG_PG_PASSWORD=kong \
  -e KONG_PG_DATABASE=kong \
  --name kong-migrations \
  --network workbench \
  docker.io/library/kong:1.1.2-alpine kong migrations bootstrap
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kong \
  -e KONG_PG_HOST=kong-postgres \
  -e KONG_PG_USER=kong \
  -e KONG_PG_PASSWORD=kong \
  -e KONG_PG_DATABASE=kong \
  -e KONG_ADMIN_LISTEN=0.0.0.0:8001 \
  -p 8000:8000 \
  -p 8001:8001 \
  -p 8443:8443 \
  -p 8444:8444 \
  --name kong \
  --network workbench \
  docker.io/library/kong:1.1.2-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8001'
```

### Remove

```sh
docker rm -f kong-postgres kong
docker volume rm kong-postgres-data
```
