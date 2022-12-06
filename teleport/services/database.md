# Teleport Database Service

<!--
https://github.com/itsvrl/boilerplates/blob/stable/docker-compose/teleport/teleport-config/template.yml
https://github.com/gravitational/teleport/blob/master/rfd/0011-database-access.md
-->

## Docs

- [Code Repository / Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/database-access/guides)
- [Database Access Configuration Reference](https://goteleport.com/docs/database-access/reference/configuration/)

## Example

### Dependencies

- [PostgreSQL Server](/postgresql/postgresql-server.md#helm)

### Configuration

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
kubectl edit configmap teleport-cluster -n teleport-system
```

```yml
---
# ...
data:
  teleport.yaml: |
    # ...
    db_service:
      enabled: true
      databases:
        - name: postgresql
          # description:
          protocol: postgres
          uri: postgresql.psql-system.svc:5432
          static_labels:
            env: local
```

```sh
#
export POD_NAME=$(kubectl get po -l app=teleport-cluster -o jsonpath='{.items[0].metadata.name}' -n teleport-system)

kubectl delete pod "$POD_NAME" -n teleport-system
```

### Usage

```sh
#
tctl users ls

#
tsh login \
  --proxy "teleport.${DOMAIN}:443" \
  --user admin \
  --auth local

#
tsh db ls

#
tsh db login \
  --db-user dev \
  --db-name dev \
  postgresql

#
tsh db connect \
  --db-user dev \
  --db-name dev \
  postgresql

#
tsh proxy db \
  -d \
  -p 15432 \
  --tunnel \
  postgresql

#
tsh logout
```

### Issues

#### TBD

```log
psql: error: connection to server at "localhost" (::1), port 15432 failed: Connection refused
	Is the server running on that host and accepting TCP/IP connections?
connection to server at "localhost" (127.0.0.1), port 15432 failed: access to db denied. User does not have permissions. Confirm database user and name.
```

```sh
#
tctl users ls

#
tctl users update \
  --set-db-users '*' \
  --set-db-names '*' \
  admin
```

#### TBD

```log
psql: error: connection to server at "teleport.<ip>.nip.io" (<ip>), port 443 failed: received invalid response to SSL negotiation: H
ERROR: exit status 2
```

TODO
