# Keycloak.X

**Keywords:** Identity Provider (IdP), Access Management

## Links

- [Docs](https://www.keycloak.org/2020/12/first-keycloak-x-release.adoc)
- [Proxy Mode](https://github.com/keycloak/keycloak-community/blob/master/design/keycloak.x/configuration.md#proxy-mode)

## Utils

- Grafana Dashboards
  - [KeyCloak X MicroProfile Metrics](https://grafana.com/grafana/dashboards/14390)

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
  -e POSTGRES_USER='keycloak' \
  -e POSTGRES_PASSWORD='keycloak' \
  -e POSTGRES_DB='keycloak' \
  -v keycloak-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name keycloak-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak \
  -e KEYCLOAK_ADMIN='admin' \
  -e KEYCLOAK_ADMIN_PASSWORD='admin' \
  -p 8080:8080 \
  --name keycloak \
  --network workbench \
  quay.io/keycloak/keycloak-x:15.0.1 \
    --auto-config \
    --proxy=edge \
    --db=postgres \
    -Dkc.db.url.host=keycloak-postgres \
    --db-username=keycloak \
    --db-password=keycloak \
    --metrics-enabled=true
```

<!--
cat << EOF > /opt/jboss/keycloak/conf/keycloak.properties
http.enabled = true
cluster = local
db = h2-mem
db.username = sa
db.password = keycloak
metrics.enabled = true
EOF
-->

> Wait! This process take a while.

```sh
#
echo -e '[INFO]\thttp://0.0.0.0:8080'
```

### Remove

```sh
docker rm -f \
  keycloak-postgres \
  keycloak

docker volume rm \
  keycloak-postgres-data
```
