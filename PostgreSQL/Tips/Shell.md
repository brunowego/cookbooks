# Shell

```sh
#! /bin/bash
set -e

POSTGRES="psql -U ${POSTGRES_USER}"

echo 'Creating [scope]: [name]'

$POSTGRES <<-EOSQL
[sql]
EOSQL
```
