# Boundary Management

## Dependencies

- [direnv](/direnv.md)

## Credential

```sh
#
boundary scopes list -recursive

#
echo 'BOUNDARY_CREDENTIAL_SCOPE_ID=<p_id>' >> ./.envrc

boundary credential-stores create static \
  -description 'Scope for Local' \
  -name 'Local' \
  -scope-id "$BOUNDARY_CREDENTIAL_SCOPE_ID"

boundary credential-stores list -scope-id "$BOUNDARY_CREDENTIAL_SCOPE_ID"

#
echo 'BOUNDARY_CREDENTIAL_STORE_ID=<csst_id>' >> ./.envrc

boundary credentials list

PASSWORD='pass' boundary credentials create username-password \
  -credential-store-id "$BOUNDARY_CREDENTIAL_STORE_ID" \
  -description 'Password for PostgreSQL' \
  -name 'PostgreSQL' \
  -username 'user' \
  -password 'env://PASSWORD'
```

<!--
boundary credential-libraries list -credential-store-id "$BOUNDARY_CREDENTIAL_STORE_ID"
-->

## Target

```sh
#
boundary targets create tcp \
  -scope-id "$BOUNDARY_CREDENTIAL_SCOPE_ID" \
  -default-port=15432 \
  -session-connection-limit=-1 \
  -name 'PSQL DBA Target'

#
boundary targets update tcp \
  -id '<ttcp_id>' \
  -default-port 15432

#
boundary targets add-host-sets \
  -host-set '<hsst_id>' \
  -id '<ttcp_id>'

#
boundary targets add-credential-libraries \
  -id=ttcp_MugI59YN6b \
  -application-credential-library=clvlt_3zCNiY66lG
```

<!--
GKE Target
MySQL DBA Target
PSQL DBA Target
RPD Target
SSH AWS Target
SSH GCP Target
-->

<!-- ## Connect

```sh
#
boundary connect ssh \
  -target-id <target-id> \
  -username <username>

#
boundary connect postgres -target-id '<ttcp_id>' -username postgres
boundary connect postgres \
  -target-id <target-id> \
  -dbname <db-name>

#
boundary connect -target-name backend_server -target-scope-name core_infra
``` -->

<!--
Northwind ERP / Project for Northwind ERP
Production Support / Project for Production Support
-->

<!--
Grants
id=*,type=*,actions=*
-->

<!--
boundary database init -config
boundary groups list
boundary host-catalogs list
boundary host-sets list
boundary hosts list
boundary managed-groups list
boundary roles list
boundary server -config
boundary sessions list -recursive
boundary sessions cancel -id s_vaKCsqjT1p
boundary targets list -scope-id o_7NAS3dPsSo -recursive
boundary users list
boundary workers list
-->
