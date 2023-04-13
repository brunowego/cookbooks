# PostgreSQL Client

<!--
https://linkedin.com/learning/postgresql-essential-training/manage-relational-data-with-postgresql
-->

## References

- [JDBC Driver - Connecting to the Database](https://jdbc.postgresql.org/documentation/head/connect.html)
- [Data Types](https://www.postgresql.org/docs/9.5/datatype.html#DATATYPE-TABLE)

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h psql \
  --name psql \
  --entrypoint /usr/local/bin/psql \
  docker.io/library/postgres:11.2-alpine --help
```

## Kubernetes

### Running

```sh
#
kubectl create ns testing

#
kubens testing

#
kubectl run --rm -it \
  psql \
  --image docker.io/library/postgres:11.2-alpine \
  -l 'app=psql' \
  --command \
  -- /bin/sh -c 'tail -f /dev/null'

#
kubectl exec -it psql -- /bin/bash

#
psql \
  -h localhost \
  -p 5432 \
  -U postgres
```

## CLI

### Installation

#### Homebrew

```sh
brew install libpq
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install postgresql-contrib
```

#### YUM

```sh
yum check-update
sudo yum -y install postgresql-contrib
```

#### APK

```sh
sudo apk update
sudo apk add postgresql-client
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y postgresql-contrib
```

### Configuration

```sh
# Darwin
brew link --force libpq
```

### Commands

```sh
# Linux (openSUSE)/Darwin
initdb --help

# Linux/Darwin
createdb --help
psql --help
```

### Defaults

```sh
# Homebrew
createdb \
  -E utf8 \
  -O "$USER" \
  -h 127.0.0.1 \
  -p 5432 \
  "$USER"

sudo -u "$USER" createuser 'postgres'
psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"
```

### Usage

```sh
# User
## Create
sudo -u "$USER" createuser --interactive

## Drop
sudo -u "$USER" dropuser <name>

# Database
## Create
sudo -u "$USER" createdb <database>

## Drop
sudo -u "$USER" dropdb <database>

# Queries
sudo -u "$USER" psql -c '<command>'

# Or, with Here document
sudo -u "$USER" psql <<-EOSQL
<sql>
EOSQL

#
PGPASSWORD="${POSTGRES_PASSWORD}" psql \
  -h <hostname> \
  -p 5432 \
  -U <username> \
  -d <db-name> \
  -c '\dt'

# SELECT version();

# Dump
pg_dump \
  -d <db-name> \
  -h 127.0.0.1 \
  -U postgres \
  -n public \
  > ./dump.sql

## DDL
pg_dump \
  -d <db-name> \
  -h 127.0.0.1 \
  -U postgres \
  -n public \
  --schema-only \
  > ./dump-ddl.sql

## DML
pg_dump \
  -d <db-name> \
  -h 127.0.0.1 \
  -U postgres \
  -n public \
  --data-only \
  --column-inserts \
  > ./dump-dml.sql

# Import
psql \
  -d <db-name> \
  -h 127.0.0.1 \
  -U postgres \
  < ./dump.sql
```

### Tips

#### Shell

```sh
#! /bin/sh
set -e

POSTGRES="PGPASSWORD=${POSTGRES_PASSWORD} psql -U postgres"

echo 'Creating <scope>: <name>'

$POSTGRES <<-EOSQL
<sql>
EOSQL
```

#### Latin1

```sql
sudo vim /var/lib/locales/supported.d/local

en_US.ISO-8859-1 ISO-8859-1

sudo dpkg-reconfigure locales

createdb -E LATIN1 --template template0 --locale en_US.ISO-8859-1 trial

sudo -u postgres createuser -s $USER
```

Show encoding and set UTF8.

```sql
show client_encoding;
SET client_encoding = 'UTF8';
```

Access PostgreSQL

```sql
su postgres

/usr/lib/postgresql/9.1/bin/initdb --pgdata=/var/lib/postgresql/9.1/main/ --encoding=LATIN1 --locale=C --username=postgres -W

sudo -u postgres psql template1

CREATE DATABASE nome_do_banco ENCODING 'ISO-8859-1' LC_CTYPE 'pt_BR.ISO-8859-1' TEMPLATE template0;

\q
```

#### Convert DB encoding to UTF8

```sh
# Export database
postgres pg_dump --encoding utf8 main -f main.sql

# Create a new database
createdb -E utf8 newMmain

# Import SQL file
psql -f main.sql -d newMain
```

#### Health check

```sh
lsof -i :5432
```

#### Truncate

```sql
TRUNCATE public."<table>" CASCADE;
```

#### SSH Tunnel

```sh
ssh \
  -p <port> \
  -N \
  -L 5432:<hostname>:5432 \
  <username>@<hostname>

psql \
  -h 127.0.0.1 \
  -P 5432
```

### Issues

<!-- ####

```log
ERROR: permission denied for table <table-name>
```

```sh
# One table
psql -c "GRANT ALL PRIVILEGES ON TABLE <table-name> TO <user-name>"

# All tables of schema
psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA <schema-name> TO <user-name>"
``` -->

<!-- ####

```log
ERROR: permission denied for sequence <seq-name>
```

```sh
psql -c "GRANT USAGE, SELECT ON SEQUENCE <seq-name> TO <user-name>"

psql -c "GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA <schema-name> TO <user-name>"
``` -->

### Logs

```sh
# Homebrew
tail -f /usr/local/var/log/postgres.log

# Linux
sudo tail -f /var/lib/pgsql/initdb.log
sudo tail -f /var/lib/pgsql/data/pg_log/postgresql-Thu.log
```

### Uninstall

```sh
# Homebrew
brew services stop postgresql

brew uninstall postgres

rm -fR /usr/local/var/postgres

rm /usr/local/var/log/postgres.log
```
