# Kong

**Keywords:** API Gateway

<!--
curl https://raw.githubusercontent.com/Kong/kong/master/kong.conf.default -o kong.conf.default
-->

## Links

- [Code Repository](https://github.com/Kong/kong)
- [Main Website](https://konghq.com)
- [Plugin Hub](https://docs.konghq.com/hub/)

## CLI

### Links

- Docs
  - [CLI Reference](https://docs.konghq.com/gateway/latest/reference/cli/)
  - [Configuration Reference for Kong Gateway](https://docs.konghq.com/gateway/latest/reference/configuration/)

### Installation

#### Homebrew

**WIP:** Currently not working as expected.

```sh
brew unlink md5sha1sum

brew tap kong/kong
brew install kong
```

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
  docker.io/library/kong:3.1.1-alpine
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
  docker.io/library/kong:3.1.1-alpine kong start
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
kubectl create ns kong-system
# kubectl create ns api-gateway

#
helm search repo -l kong/kong

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install kong kong/kong \
  --namespace kong-system \
  --version 2.13.1 \
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
  # portal_api_url: http://kong-kong-admin.kong-system.svc.cluster.local:8001
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
kubectl get all -n kong-system
```

### Status

```sh
kubectl rollout status deployment/kong-kong \
  -n kong-system
```

<!-- ### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=kong' \
  -n kong-system \
  -f
``` -->

### Delete

```sh
helm uninstall kong \
  -n kong-system

kubectl delete ns kong-system \
  --grace-period=0 \
  --force
```
