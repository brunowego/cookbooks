# Backstage

<!--
TODO NEXT
-->

**Keywords:** Developer Portal, Software Catalog

## Links

- [Code Repository](https://github.com/backstage/backstage)
- [Main Website](https://backstage.io/)
- [Demo](https://demo.backstage.io/)

## Glossary

- Internal Developer Platform (IDP)

## References

- [Getting started with Backstage](https://github.com/spotify/backstage/blob/master/docs/getting-started/README.md)

## Helm

**WIP:** Currently not working as expected.

### Dependencies

- [PostgreSQL Client](/postgresql/client.md#cli)
- [PostgreSQL Server](/postgresql/server.md#helm)

```sh
#
kubectl port-forward \
  --address 0.0.0.0 \
  -n psql-system \
  svc/postgresql \
  5432:5432

#
PGPASSWORD='postgres' psql -h 127.0.0.1 -U postgres <<-EOSQL
CREATE USER backstage WITH PASSWORD 'backstage';
CREATE DATABASE backstage_plugin_catalog WITH OWNER backstage;
GRANT ALL PRIVILEGES ON DATABASE backstage_plugin_catalog TO backstage;
CREATE DATABASE backstage_plugin_auth WITH OWNER backstage;
GRANT ALL PRIVILEGES ON DATABASE backstage_plugin_auth TO backstage;
EOSQL

#
PGPASSWORD='backstage' psql \
  -h 127.0.0.1 \
  -U backstage \
  -d 'backstage_plugin_catalog' \
  -c 'SELECT version()'
```

### References

- [Values](https://github.com/deliveryhero/helm-charts/tree/master/stable/backstage#values)

### Repository

```sh
helm repo add deliveryhero 'https://charts.deliveryhero.io'
helm repo update
```

### Install

```sh
#
kubectl create ns backstage-system
# kubectl create ns catalog

#
helm search repo -l deliveryhero/backstage

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install backstage . \
  --namespace backstage-system \
  --version 0.1.12 \
  -f <(cat << EOF
appConfig:
  app:
    baseUrl: http://backstage.${DOMAIN}
    title: Backstage
  backend:
    baseUrl: http://backstage.${DOMAIN}
    cors:
      origin: http://backstage.${DOMAIN}
    database:
      client: pg
      connection:
        database: backstage_plugin_catalog
        host: postgresql.psql-system.svc.cluster.local
        user: backstage
        port: 5432
        password: backstage
  lighthouse:
    baseUrl: http://backstage.${DOMAIN}/lighthouse-api
  techdocs:
    storageUrl: http://backstage.${DOMAIN}/api/techdocs/static/docs
    requestUrl: http://backstage.${DOMAIN}/api/techdocs
EOF
)

#
kubectl get all -n backstage-system
```

### Status

```sh
kubectl rollout status deploy/backstage-backend \
  -n backstage-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=backstage' \
  -n backstage-system \
  -f
```

### Secret

```sh
kubectl get secret backstage-backend \
  -o jsonpath='{.data.admin-password}' \
  -n backstage-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall backstage \
  -n backstage-system

kubectl delete ns backstage-system \
  --grace-period=0 \
  --force
```
