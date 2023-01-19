# Budibase

**Keywords:** Low-Code

## Links

- [Code Repository](https://github.com/Budibase/budibase)
- [Main Website](https://budibase.com)
- Docs
  - [SSO with Google](https://docs.budibase.com/docs/sso-with-google)

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
  -h minio \
  -e MINIO_ROOT_USER='budibase' \
  -e MINIO_ROOT_PASSWORD='budibase' \
  -v budibase-minio-data:/data \
  -p 9000:9000 \
  -p 9001:9001 \
  --name budibase-minio \
  --network workbench \
  docker.io/minio/minio:RELEASE.2023-01-02T09-40-09Z server /data --console-address ':9001'

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -e REDIS_PASSWORD='budibase' \
  -v budibase-redis-data:/data \
  -p 6379:6379 \
  --name budibase-redis \
  --network workbench \
  --entrypoint /bin/sh \
  docker.io/library/redis:7.0.7 -c 'redis-server --requirepass ${REDIS_PASSWORD}'

#
docker run -d \
  -h couchdb \
  -v budibase-couchdb-data:/opt/couchdb/data \
  -e COUCHDB_USER='budibase' \
  -e COUCHDB_PASSWORD='budibase' \
  -p 5984:5984 \
  --name budibase-couchdb \
  --network workbench \
  docker.io/apache/couchdb:3.3.0

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h budibase \
  -v budibase-data:/data \
  -v budibase-data-couchdb:/opt/couchdb/data \
  -e SELF_HOSTED='1' \
  -e MINIO_ROOT_USER='budibase' \
  -e MINIO_ROOT_PASSWORD='budibase' \
  -e MINIO_URL='http://budibase-minio:9000' \
  -e REDIS_PASSWORD='budibase' \
  -e REDIS_URL='budibase-redis:6379' \
  -e COUCHDB_USER='budibase' \
  -e COUCHDB_PASSWORD='budibase' \
  -e COUCH_DB_URL='http://budibase:budibase@budibase-couchdb:5984' \
  -e JWT_SECRET='S3cr3t_K#Key' \
  -e INTERNAL_API_KEY='S3cr3t_K#Key' \
  -e ENABLE_ANALYTICS='true' \
  -e BB_ADMIN_USER_EMAIL='johndoe@domain.tld' \
  -e BB_ADMIN_USER_PASSWORD='Pa$$w0rd!' \
  -p 8080:80 \
  -p 8443:443 \
  -p 9100:9100 \
  --name budibase \
  --network workbench \
  docker.io/budibase/budibase:v2.2.9
```

<!--
SENTRY_DSN:
-->

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Logs

```sh
docker logs -f budibase
```

### Remove

```sh
docker rm -f \
  budibase-minio \
  budibase-redis \
  budibase-couchdb \
  budibase

docker volume rm \
  budibase-minio-data \
  budibase-redis-data \
  budibase-couchdb-data \
  budibase-data \
  budibase-data-couchdb
```

## Docker Compose

```sh
#
export COMPOSE_DOCKER_CLI_BUILD=0

#
docker compose config

#
docker compose up
docker compose down
```

## Helm

### References

- [Chart Repository](https://github.com/Budibase/budibase/tree/develop/charts/budibase)

### Repository

```sh
helm repo add budibase 'https://budibase.github.io/budibase'
helm repo update
```

### Install

```sh
#
kubectl create ns budibase
# kubectl create ns lowcode

#
kubens budibase

#
helm search repo -l budibase/budibase

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade budibase budibase/budibase \
--version 0.2.11 \
  -f <(cat << EOF
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: budibase.${DOMAIN}
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: proxy-service
              port:
                number: 10000
EOF
)

#
kubectl get all
```

<!-- ```sh
kubectl port-forward \
  --address 0.0.0.0 \
  service/proxy-service \
  10000:10000 \
  -n budibase
``` -->

### Status

```sh
kubectl rollout status deployment/proxy-service \
  -n budibase
```

### Logs

```sh
#
kubectl logs \
  -l 'com.budibase.service=app' \
  -n budibase \
  -f

#
kubectl logs \
  -l 'app.kubernetes.io/name=budibase-proxy' \
  -n budibase \
  -f
```

### Issues

#### TBD

```log
│ Error: Ingress.extensions "budibase-budibase" is invalid: annotations.kubernetes.io/ingress.class: Invalid value: "nginx": can not be set when the class field is also set
```

TODO

#### TBD

```log
2023/01/03 16:57:40 [error] 25#25: recv() failed (111: Connection refused) while resolving, resolver: 127.0.0.11:53
```

TODO

### Delete

```sh
helm uninstall budibase \
  -n budibase

kubectl delete ns budibase \
  --grace-period=0 \
  --force
```
