# Commands

## User

### Create

```sh
sudo -u $USER createuser --interactive
```

### Drop

```sh
sudo -u $USER dropuser [name]
```

## Database

### Create

```sh
sudo -u $USER createdb [database]
```

### Drop

```sh
sudo -u $USER dropdb [database]
```

## Command

```sh
sudo -u $USER psql -c '[command]'
```

##

```sh
sudo -u $USER psql <<-EOSQL
[sql]
EOSQL
```

## Dump

### DDL

```sh
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --schema-only \
  > ddl.sql
```

### DML

```sh
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --data-only \
  --column-inserts \
  > dml.sql
```
