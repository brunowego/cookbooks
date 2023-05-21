# Kong Gateway

<!--
curl https://raw.githubusercontent.com/Kong/kong/master/kong.conf.default -o kong.conf.default
-->

**Keywords:** API Gateway

## Links

- [Docs](https://docs.konghq.com/gateway/latest/)

## CLI

### Links

- Docs
  - [CLI Reference](https://docs.konghq.com/gateway/latest/reference/cli/)
  - [Configuration Reference for Kong Gateway](https://docs.konghq.com/gateway/latest/reference/configuration/)

<!-- ### Commands -->

<!-- ### Usage

```sh
#

``` -->

<!--
kong prepare
kong migrations up
kong config init
kong reload
kong start --conf /path/to/kong.conf
kong start
kong restart
kong stop
kong check <path/to/kong.conf>
-->

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
  -h postgres \
  -e POSTGRES_USER='kong' \
  -e POSTGRES_PASSWORD='kong' \
  -e POSTGRES_DB='kong' \
  -v kong-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name kong-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

#
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -e KONG_PG_HOST='kong-postgres' \
  -e KONG_PG_USER='kong' \
  -e KONG_PG_PASSWORD='kong' \
  -e KONG_PG_DATABASE='kong' \
  --name kong-migrations \
  --network workbench \
  docker.io/library/kong:3.1.1-alpine kong migrations bootstrap

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kong \
  -e KONG_PG_HOST='kong-postgres' \
  -e KONG_PG_USER='kong' \
  -e KONG_PG_PASSWORD='kong' \
  -e KONG_PG_DATABASE='kong' \
  -e KONG_ADMIN_LISTEN='0.0.0.0:8001' \
  -p 8000:8000 \
  -p 8001:8001 \
  -p 8443:8443 \
  -p 8444:8444 \
  --name kong \
  --network workbench \
  docker.io/library/kong:3.2.2-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8001/services'
```

### Remove

```sh
docker rm -f kong-postgres kong

docker volume rm kong-postgres-data
```

## Docker (DB-less)

### Links

- Docs
  - [DB-less and Declarative Configuration](https://docs.konghq.com/gateway/latest/production/deployment-topologies/db-less-and-declarative-config/)

```sh
#
cat << EOF > ./kong.yml
---
_format_version: '3.0'
_transform: true

services:
  - name: my-service
    url: https://example.com
    plugins:
      - name: key-auth
    routes:
      - name: my-route
        paths:
          - /

consumers:
  - username: my-user
    keyauth_credentials:
      - key: my-key
EOF

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kong \
  -e KONG_DATABASE='off' \
  -e KONG_DECLARATIVE_CONFIG='/usr/local/kong/declarative/kong.yml' \
  -e KONG_PROXY_LISTEN='0.0.0.0:8000' \
  -e KONG_PROXY_LISTEN_SSL='0.0.0.0:8443' \
  -e KONG_ADMIN_LISTEN='0.0.0.0:8001' \
  -e KONG_PROXY_ACCESS_LOG='/dev/stdout' \
  -e KONG_PROXY_ERROR_LOG='/dev/stderr' \
  -e KONG_ADMIN_ACCESS_LOG='/dev/stdout' \
  -e KONG_ADMIN_ERROR_LOG='/dev/stderr' \
  -e KONG_LOG_LEVEL='debug' \
  -v "$PWD"/kong.yml:/usr/local/kong/declarative/kong.yml \
  -p 8000:8000 \
  -p 8001:8001 \
  -p 8443:8443 \
  --name kong \
  --network workbench \
  docker.io/library/kong:3.2.2-alpine kong start
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8001/services'
```

## Docker Compose

### Manifest

```yml
---
version: '3'

x-kong: &kong
  image: docker.io/library/kong:3.2.2-alpine
  environment: &kong-environment
    KONG_PG_HOST: kong-postgres
    KONG_PG_USER: kong
    KONG_PG_PASSWORD: kong
    KONG_PG_DATABASE: kong
    KONG_ADMIN_LISTEN: 0.0.0.0:8001

services:
  kong-postgres:
    image: docker.io/library/postgres:15.1-alpine
    volumes:
      - type: volume
        source: kong-postgresql-data
        target: /var/lib/postgresql/data
    environment:
      POSTGRES_USER: kong
      POSTGRES_PASSWORD: kong
      POSTGRES_DB: kong
    restart: unless-stopped

  kong-migrations:
    <<: *kong
    command: kong migrations bootstrap
    restart: on-failure
    depends_on:
      - kong-postgres

  kong-migrations-up:
    <<: *kong
    command: kong migrations up && kong migrations finish
    restart: on-failure
    depends_on:
      - kong-migrations

  kong:
    <<: *kong
    ports:
      - target: 8001
        published: $KONG_PORT
        protocol: tcp
    restart: unless-stopped
    depends_on:
      - kong-postgres
      - kong-migrations-up

volumes:
  kong-postgresql-data:
    driver: local
```

## Helm

**WIP:** Currently not working as expected.

<!--
https://github.com/sigreen/install-kong-gw-azr-aks/blob/main/values/values-dns.yml
-->

### References

- [Configuration](https://github.com/Kong/charts/tree/main/charts/kong#configuration)

### Repository

```sh
helm repo add kong 'https://charts.konghq.com'
helm repo update
```

### Install

```sh
#
kubectl create ns kong
# kubectl create ns api-gateway

#
kubens kong

#
helm search repo -l kong/kong

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install kong kong/kong \
  --version 2.21.0 \
  -f <(cat << EOF
env:
  database: postgres
  pg_password: kong
  # pg_host: postgres-postgresql
  # pg_port: 5432
  # pg_database: postgres
  # pg_user: kong
  # pg_password:
  #   valueFrom:
  #     secretKeyRef:
  #       name: postgres-postgresql
  #       key: postgres-password
  # proxy_url: http://localhost:8000
  # admin_gui_url: http://manager.localhost:8000
  # admin_api_uri: http://api.manager.localhost:8000
  # admin_session_conf:
  #   valueFrom:
  #     secretKeyRef:
  #       name: kong-session-config
  #       key: admin_gui_session_conf
  # portal: on
  # portal_auth: basic-auth
  # portal_auto_approve: on
  # portal_gui_host: portal.localhost:8000
  # portal_api_url: http://kong-kong-admin.kong.svc.cluster.local:8001
  # portal_gui_protocol: http
  # portal_session_conf:
  #   valueFrom:
  #     secretKeyRef:
  #       name: kong-session-config
  #       key: portal_session_conf
  # enforce_rbac: on
  # password:
  #   valueFrom:
  #     secretKeyRef:
  #       name: kong-enterprise-superuser-password
  #       key: password

# ingressController:

postgresql:
  enabled: true
  auth:
    postgresPassword: root
    database: kong
    username: kong
    password: kong

admin:
  enabled: true
  http:
    enabled: true
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: api.manager.kong.${DOMAIN}

proxy:
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: kong.${DOMAIN}

manager:
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: manager.kong.${DOMAIN}

portal:
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: portal.kong.${DOMAIN}

portalapi:
  ingress:
    enabled: true
    ingressClassName: kong
    hostname: api.portal.kong.${DOMAIN}
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status deployment/kong-kong
```

<!-- ### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=kong' \
  -f
``` -->

### Delete

```sh
helm uninstall kong

kubectl delete ns kong \
  --grace-period=0 \
  --force
```

## Issues

### Inaccessible Host

```log
An invalid response was received from the upstream server
```

```sh
#
curl -I http://127.0.0.1:8000
```

Try change in `url` everything from `127.0.0.1` to `host.docker.internal`.
