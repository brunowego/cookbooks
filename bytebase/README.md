# Bytebase

**Keywords:** DaC

## Links

- [Code Repository](https://github.com/bytebase/bytebase)
- [Main Website](https://bytebase.com)
- [Demo](https://demo.bytebase.com)

## Articles

- [The Database as Code Landscape and why you don’t need an army of DBA](https://medium.com/@bytebase/the-database-as-code-landscape-14c09ee74732)

## CLI

### Commands

```sh
bytebase -h
```

### Usage

```sh
#
bytebase \
  --data /var/opt/bytebase \
  --demo default \
  --external-url http://127.0.0.1:8080 \
  --port 8080
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
  -h bytebase \
  -v bytebase-data:/var/opt/bytebase \
  -p 8080:8080 \
  --init \
  --restart always \
  --name bytebase \
  --network workbench \
  docker.io/bytebase/bytebase:2.0.0 --data /var/opt/bytebase --external-url http://127.0.0.1:8080 --port 8080
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f bytebase

docker volume rm bytebase-data
```

## Helm

**WIP:** Currently not working as expected.

### Dependencies

- [PostgreSQL](/postgresql/server.md#helm)

### References

- [Parameters](https://github.com/bytebase/bytebase/tree/main/helm-charts/bytebase#parameters)

### Repository

```sh
helm repo add bytebase 'https://bytebase.github.io/bytebase'
helm repo update
```

### Install

```sh
#
kubectl create ns bytebase
# kubectl create ns migrations

#
kubens bytebase

#
helm search repo -l bytebase/bytebase

#
helm upgrade postgresql bitnami/postgresql \
  --version 12.1.3 \
  -n postgresql \
  -f <(cat << EOF
auth:
  postgresPassword: postgres
  username: bytebase
  password: bytebase
  database: bytebase
EOF
)

#
helm install bytebase bytebase/bytebase \
  --version 1.0.3 \
  -f <(cat << EOF
bytebase:
  option:
    pg: postgresql://bytebase:bytebase@postgresql.postgresql.svc:5432/bytebase
EOF
)

#
kubectl patch svc bytebase-entrypoint -p '{"spec":{"type":"ClusterIP"}}'
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/bytebase-entrypoint \
  8080:8080
-->

### Status

```sh
kubectl rollout status statefulset/bytebase
```

### Logs

```sh
kubectl logs \
  -l 'app=bytebase' \
  -f
```

### Delete

```sh
helm uninstall bytebase

kubectl delete ns bytebase \
  --grace-period=0 \
  --force
```

## Issues

### TBD

```log
slow query log is not enabled: failed to execute query "SELECT count(*) FROM pg_stat_statements limit 10;": ERROR: relation "pg_stat_statements" does not exist (SQLSTATE 42P01);
```

<!-- https://www.bytebase.com/docs/slow-query/enable-pg-stat-statements-for-postgresql/ -->

TODO
