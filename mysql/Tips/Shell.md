# Shell

```sh
#! /bin/sh
set -e

MYSQL="mysql -u root -p${MYSQL_ROOT_PASSWORD}"

echo 'Creating [scope]: [name]'

$MYSQL <<-EOSQL
[sql]
EOSQL
```
