# Keycloak Metrics SPI

## Links

- [Code Repository](https://github.com/aerogear/keycloak-metrics-spi)

## Utils

- Grafana Dashboards
  - [Keycloak Metrics](https://grafana.com/grafana/dashboards/10441)

## Dockerfile

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/keycloak-metrics -
FROM quay.io/keycloak/keycloak:20.0.2

RUN ( \
      cd /opt/jboss/keycloak/standalone/deployments && \
      curl -LOs 'https://github.com/aerogear/keycloak-metrics-spi/releases/download/2.4.0/keycloak-metrics-spi-2.4.0.jar' && \
      chmod +x ./keycloak-metrics-spi-2.4.0.jar && \
      touch ./keycloak-metrics-spi-2.4.0.jar.dodeploy \
    )
EOF
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
  -e DB_VENDOR='postgres' \
  -e DB_ADDR='keycloak-postgres' \
  -e DB_DATABASE='keycloak' \
  -e DB_SCHEMA='public' \
  -e DB_USER='keycloak' \
  -e DB_PASSWORD='keycloak' \
  -e KEYCLOAK_USER='admin' \
  -e KEYCLOAK_PASSWORD='admin' \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  example/keycloak-metrics:latest \
    -Dkeycloak.profile.feature.upload_scripts=enabled
```

> Wait! This process take a while.

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:8080/auth/realms/master/metrics'
```

### Enable Metrics-listener Event

```sh
# Create session
docker exec -i keycloak /opt/jboss/keycloak/bin/kcadm.sh config credentials \
  --server 'http://0.0.0.0:8080/auth' \
  --realm master \
  --user admin \
  --password admin

# Update
docker exec -i keycloak /opt/jboss/keycloak/bin/kcadm.sh update events/config \
  -s 'eventsEnabled=true' \
  -s 'adminEventsEnabled=true' \
  -s 'eventsListeners+=metrics-listener'

# Destroy session
docker exec -i keycloak rm -f /opt/jboss/.keycloak/kcadm.config

#
docker restart keycloak
```

### Remove

```sh
docker rm -f \
  keycloak-postgres \
  keycloak

docker volume rm \
  keycloak-postgres-data
```
