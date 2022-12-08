# Teleport Database Service

**WIP:** Currently not working as expected.

<!--
https://github.com/itsvrl/boilerplates/blob/stable/docker-compose/teleport/teleport-config/template.yml
https://github.com/gravitational/teleport/blob/master/rfd/0011-database-access.md
https://github.com/gravitational/teleport/pull/10458
https://github.com/gravitational/teleport/issues/5911
-->

![Teleport Diagram](/assets/images/teleport/diagram.png)

## Docs

- [Code Repository / Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/database-access/guides)
- [Database Access Configuration Reference](https://goteleport.com/docs/database-access/reference/configuration/)
- [Database Access GUI Clients](https://goteleport.com/docs/connect-your-client/gui-clients/)

## Example

### Dependencies

- [MySQL Server](/mysql/server.md#helm)
- [PostgreSQL Server](/postgresql/server.md#helm)

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
      resources:
        - labels:
            '*': '*'
      databases:
        - name: mysql
          description: Local database
          protocol: mysql
          uri: mysql.mysql-system.svc:3306
          tls:
            mode: insecure
          static_labels:
            env: local
          dynamic_labels:
          - name: hostname
            command: ['hostname']
            period: 1m0s
        - name: postgresql
          description: Local database
          protocol: postgres
          uri: postgresql.psql-system.svc:5432
          tls:
            mode: insecure
          static_labels:
            env: local
          dynamic_labels:
          - name: hostname
            command: ['hostname']
            period: 1m0s
```

```sh
kubectl rollout restart deployment teleport-cluster -n teleport-system
```

### Permissions

```sh
#
tsh login \
  --proxy "teleport.${DOMAIN}:443" \
  --auth local \
  --user admin

#
tctl users add johndoe --roles access
tctl users add dev --roles access

#
cat << EOF | tctl create -f
kind: role
version: v5
metadata:
  name: dba
spec:
  allow:
    db_labels:
      '*': '*'
    db_names: [mysql]
    db_users: [johndoe]
    rules:
      - resources: [db_server, db]
        verbs: [read, list]
EOF

cat << EOF | tctl create -f
kind: role
version: v5
metadata:
  name: db
spec:
  allow:
    app_labels:
      '*': '*'
    db_labels:
      '*': '*'
    db_names:
    - '*'
    db_users:
    - '*'
    kubernetes_labels:
      '*': '*'
  deny: {}
  options:
    cert_format: standard
    create_host_user: false
    desktop_clipboard: true
    desktop_directory_sharing: true
    enhanced_recording:
    - command
    - network
    forward_agent: false
    max_session_ttl: 30h0m0s
    pin_source_ip: false
    port_forwarding: true
    record_session:
      default: best_effort
      desktop: true
EOF

#
tctl get role/dba

#
tsh request create --resources '[{"cluster":"cluster-one","kind":"node","name":"d774a757-d0cc-4259-8022-61c8d63450fa"}]'
```

<!--
sre
-->

### Usage

```sh
#
tsh login \
  --proxy "teleport.${DOMAIN}:443" \
  --auth local \
  --user johndoe

#
tsh db ls --all

#
tsh db login --db-user johndoe mysql

#
tsh db env

#
tsh db config

#
tsh db connect --db-user dev mysql

#
tsh db logout mysql
```

<!--
#
tctl auth sign --format=openssh --host=teleport.192.168.64.16.nip.io --out=mysql --ttl=2160h
-->

<!-- ### Tips

#### Proxy

```sh
#
tsh proxy db \
  -d \
  -p 15432 \
  --tunnel \
  postgresql

#
tsh proxy db --db-user dev --db-name dev --tunnel postgresql
``` -->

<!-- ### Tips

####

```sh
#
tctl tokens add --type db

#
teleport db start \
  --token=?? \
  --auth-server=teleport.rawkode.sh:443 \
  --name=mongodb \
  --protocol=mongodb \
  --uri=mongodb://mongodb.rawkode.sh:27017
``` -->

### Issues

#### TBD

```log
ERROR 1105 (HY000): access to db denied. User does not have permissions. Confirm database user and name.
ERROR: exit status 1: '/usr/local/opt/mysql-client/bin/mysql' exited with the above error. Use 'tsh db ls' to see your available logins, or ask your Teleport administrator to grant you access.
See https://goteleport.com/docs/database-access/troubleshooting/#access-to-db-denied for more information.
```

TODO

#### TBD

```log
psql: error: connection to server at "localhost" (::1), port 15432 failed: Connection refused
	Is the server running on that host and accepting TCP/IP connections?
connection to server at "localhost" (127.0.0.1), port 15432 failed: access to db denied. User does not have permissions. Confirm database user and name.
```

TODO

#### TBD

```log
psql: error: connection to server at "teleport.<ip>.nip.io" (<ip>), port 443 failed: received invalid response to SSL negotiation: H
ERROR: exit status 2
```

TODO
