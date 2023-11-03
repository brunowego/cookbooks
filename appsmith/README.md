# Appsmith

**Keywords:** Low-Code

## Links

- [Code Repository](https://github.com/appsmithorg/appsmith)
- [Main Website](https://appsmith.com)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

<!-- ```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v appsmith-redis-data:/data \
  -p 6379:6379 \
  --name appsmith-redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v appsmith-mongodb-data:/data/db \
  -v appsmith-mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='appsmith' \
  -p 27017:27017 \
  --name appsmith-mongodb \
  --network workbench \
  docker.io/library/mongo:4.4.6

-e APPSMITH_REDIS_URL='redis://appsmith-redis:6379' \
-e APPSMITH_MONGODB_URI='mongodb://appsmith-mongodb:27017/appsmith?retryWrites=true&authSource=admin&replicaSet=rs0' \
-e APPSMITH_MAIL_ENABLED='false' \
``` -->

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h appsmith \
  -v appsmith-stacks:/appsmith-stacks \
  -p 8080:80 \
  -p 8443:443 \
  -p 9001:9001 \
  --name appsmith \
  --network workbench \
  docker.io/appsmith/appsmith-ce:v1.8.15
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f appsmith

docker volume rm appsmith-stacks
```

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/main/bitnami/appsmith#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns appsmith-system
# kubectl create ns lowcode

#
helm search repo -l bitnami/appsmith

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install appsmith bitnami/appsmith \
  --namespace appsmith-system \
  --version 0.1.3 \
  -f <(cat << EOF
global:
  storageClass:
client:
  ingress:
    enabled: true
    hostname: appsmith.${K8S_DOMAIN}
    ingressClassName: nginx

  service:
    type: ClusterIP
EOF
)

#
kubectl get all -n appsmith-system
```

### Status

```sh
kubectl rollout status deployment/appsmith-backend \
  -n appsmith-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=backend,app.kubernetes.io/instance=appsmith' \
  -n appsmith-system \
  -f
```

### Secret

<!--
user
-->

```sh
kubectl get secret appsmith-backend \
  -o jsonpath='{.data.admin-password}' \
  -n appsmith-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall appsmith \
  -n appsmith-system

kubectl delete ns appsmith-system \
  --grace-period=0 \
  --force
```
