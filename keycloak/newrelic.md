# Keycloak New Relic

## Dockerfile

```sh
cat << \EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/keycloak-newrelic -
FROM docker.io/kubeless/unzip:latest AS build-agents

ENV NEW_RELIC_AGENT_VERSION current

RUN curl -sO "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/${NEW_RELIC_AGENT_VERSION}/newrelic-java.zip" && \
      unzip ./newrelic-java.zip


FROM quay.io/keycloak/keycloak:20.0.2

ENV JAVA_OPTS '-javaagent:/opt/jboss/newrelic/newrelic.jar'

COPY --from=build-agents /newrelic /opt/jboss/newrelic
EOF
```

<!--
LOG4J_MESSAGE_FACTORY=com.newrelic.logging.log4j2.NewRelicMessageFactory
-Djboss.modules.system.pkgs=org.jboss.byteman,com.newrelic
-->

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
  -e NEW_RELIC_APP_NAME='Keycloak' \
  -e NEW_RELIC_LICENSE_KEY='[license-key]' \
  -e NEW_RELIC_LOG='stdout' \
  -e NEW_RELIC_LOG_LEVEL='info' \
  -e NEW_RELIC_ENVIRONMENT='development' \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  example/keycloak-newrelic:latest \
    -Dkeycloak.profile.feature.upload_scripts=enabled
```

**Environments:** `development`, `test`, `staging` and `production`.

<!--
-e NEW_RELIC_DISTRIBUTED_TRACING_ENABLED='true' \
-->

> Wait! This process take a while.

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:8080'

#
echo -e '[INFO]\thttp://127.0.0.1:8080/auth/admin/'
```

### Remove

```sh
docker rm -f \
  keycloak-postgres \
  keycloak

docker volume rm \
  keycloak-postgres-data
```
