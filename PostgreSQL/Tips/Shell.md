# Shell

```sh
#! /bin/sh
set -e

POSTGRES="env PGPASSWORD=${POSTGRES_PASSWORD} psql -U postgres"

echo 'Creating [scope]: [name]'

$POSTGRES <<-EOSQL
[sql]
EOSQL
```
