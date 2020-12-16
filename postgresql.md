# PostgreSQL

<!--
https://www.linkedin.com/learning/postgresql-essential-training/manage-relational-data-with-postgresql
-->

## References

- [JDBC Driver - Connecting to the Database](https://jdbc.postgresql.org/documentation/head/connect.html)
- [Data Types](https://www.postgresql.org/docs/9.5/datatype.html#DATATYPE-TABLE)

## CLI

### Installation

#### Homebrew

```sh
brew install libpq
```

#### APT

```sh
sudo apt update

#
sudo apt -y install postgresql-server postgresql-contrib
```

#### Yum

```sh
yum check-update

#
sudo yum -y install postgresql-server postgresql-contrib
```

#### APK

```sh
sudo apk update

#
sudo apk add postgresql
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y postgresql
```

#### Chocolatey

```sh
choco install -y postgresql
```

### Configuration

```sh
# Darwin
brew link --force libpq
```

### Commands

```sh
initdb --help
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
sudo -u "$USER" dropuser [name]

# Database
## Create
sudo -u "$USER" createdb [database]

## Drop
sudo -u "$USER" dropdb [database]

# Queries
sudo -u "$USER" psql -c '[command]'

# Or, with Here document
sudo -u "$USER" psql <<-EOSQL
[sql]
EOSQL

#
PGPASSWORD="${POSTGRES_PASSWORD}" psql \
  -h [hostname] \
  -p 5432 \
  -U [username] \
  -d [db-name] \
  -c '\dt'

# SELECT version();

# Dump
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  > ddl.sql

## DDL
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --schema-only \
  > ddl.sql

## DML
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --data-only \
  --column-inserts \
  > dml.sql
```

### Tips

#### Health check

```sh
lsof -i :5432
```

<!-- ####

```sql
TRUNCATE public.[table] CASCADE;
``` -->

#### SSH Tunnel

```sh
ssh \
  -p [port] \
  -N \
  -L 5432:[hostname]:5432 \
  [username]@[hostname]

psql \
  -h 127.0.0.1 \
  -P 5432
```

### Issues

<!-- ####

```log
ERROR: permission denied for table [table-name]
```

```sh
# One table
psql -c "GRANT ALL PRIVILEGES ON TABLE [table-name] TO [user-name]"

# All tables of schema
psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA [schema-name] TO [user-name]"
``` -->

<!-- ####

```log
ERROR: permission denied for sequence [seq-name]
```

```sh
psql -c "GRANT USAGE, SELECT ON SEQUENCE [seq-name] TO [user-name]"

psql -c "GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA [schema-name] TO [user-name]"
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
