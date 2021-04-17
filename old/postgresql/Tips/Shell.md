# Shell

```sh
#! /bin/sh
set -e

POSTGRES="PGPASSWORD=${POSTGRES_PASSWORD} psql -U postgres"

echo 'Creating [scope]: [name]'

$POSTGRES <<-EOSQL
[sql]
EOSQL
```
