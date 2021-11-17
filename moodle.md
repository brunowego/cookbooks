# Moodle

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
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='moodle' \
  -e MYSQL_PASSWORD='moodle' \
  -e MYSQL_DATABASE='moodle' \
  -v moodle-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name moodle-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h moodle \
  -e MOODLE_DATABASE_TYPE='mysqli' \
  -e MOODLE_DATABASE_HOST='moodle-mysql' \
  -e MOODLE_DATABASE_NAME='moodle' \
  -e MOODLE_DATABASE_USER='moodle' \
  -e MOODLE_DATABASE_PASSWORD='moodle' \
  -e ALLOW_EMPTY_PASSWORD='yes' \
  -p 8080:8080 \
  --name moodle \
  --network workbench \
  docker.io/bitnami/moodle:3.9.1
```

> Wait! This process take a while.

```sh
docker logs -f moodle | sed '/** Moodle setup finished! **/ q'
```

```sh
# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f moodle-mysql moodle
docker volume rm moodle-mysql-data
```

## Helm

### References

- [Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/moodle)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns moodle

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install moodle bitnami/moodle \
  --namespace moodle \
  --version 11.2.1 \
  -f <(cat << EOF
replicaCount: 1

ingress:
  enabled: true
  hostname: moodle.$DOMAIN
EOF
)
```

### Status

```sh
kubectl rollout status deploy/moodle \
  -n moodle
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=moodle' \
  -n moodle \
  -f
```

### Secret

```sh
kubectl get secret moodle \
  -o jsonpath='{.data.wordpress-password}' \
  -n moodle | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall moodle \
  -n moodle

kubectl delete ns moodle \
  --grace-period=0 \
  --force
```
