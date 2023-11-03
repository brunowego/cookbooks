# Discourse

## Links

- [Code Repository](https://github.com/discourse/discourse)
- [Main Website](https://discourse.org)

## Who Uses

- [Customers](https://discourse.org/customers)
- More
  - [HashiCorp](https://discuss.hashicorp.com)

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
  -h redis \
  -v discourse-redis-data:/data \
  --name discourse-redis \
  --network workbench \
  docker.io/library/redis:5.0.4-alpine3.9 redis-server

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='discourse' \
  -e POSTGRES_PASSWORD='discourse' \
  -e POSTGRES_DB='discourse' \
  -v discourse-postgres-data:/var/lib/postgresql/data \
  --name discourse-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h discourse \
  -v discourse-data:/bitnami \
  -e DISCOURSE_HOSTNAME='discourse.localhost' \
  -e POSTGRESQL_ROOT_USER='discourse' \
  -e POSTGRESQL_ROOT_PASSWORD='discourse' \
  -e POSTGRESQL_HOST='discourse-postgres' \
  -e DISCOURSE_POSTGRESQL_USERNAME='discourse' \
  -e DISCOURSE_POSTGRESQL_PASSWORD='discourse' \
  -e DISCOURSE_POSTGRESQL_NAME='discourse' \
  -e REDIS_HOST='discourse-redis' \
  -p 80:3000 \
  --name discourse \
  --network workbench \
  docker.io/bitnami/discourse:2.6.4
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login  | Password |
| ------ | -------- |
| `user` | `admin`  |

### Remove

```sh
docker rm -f \
  discourse \
  discourse-postgres \
  discourse-redis

docker volume rm \
  discourse-data \
  discourse-postgres-data \
  discourse-redis-data
```

## Helm

**WIP:** Currently not working as expected.

### References

- [Parameters](https://github.com/bitnami/charts/tree/main/bitnami/discourse#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns discourse-system
# kubectl create ns forum

#
helm search repo -l bitnami/discourse

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade discourse bitnami/discourse \
  --namespace discourse-system \
  --version 9.0.4 \
  -f <(cat << EOF
ingress:
  enabled: true
  ingressClassName: nginx
  hostname: discourse.${K8S_DOMAIN}
EOF
)

#
kubectl get all -n discourse-system
```

### Status

```sh
kubectl rollout status deployment/discourse \
  -n discourse-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=discourse,app.kubernetes.io/name=discourse' \
  -c discourse \
  -n discourse-system \
  -f
```

### Secret

<!--
username: user
-->

```sh
kubectl get secret discourse-discourse \
  -o jsonpath='{.data.discourse-password}' \
  -n discourse-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall discourse \
  -n discourse-system

kubectl delete ns discourse-system \
  --grace-period=0 \
  --force
```
