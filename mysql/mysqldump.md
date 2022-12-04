# mysqldump

## CLI

### Dependencies

- [MySQL Client](/mysql/client.md)

### Commands

```sh
mysqldump --help
```

### Usage

```sh
# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  <db-name> \
  > /path/to/dump.sql

# Import
pv /path/to/dump.sql | \
  mysql \
    -h 127.0.0.1 \
    -P 3306 \
    -u <username> \
    -p'<password>' \
    <db-name>
```

### Tips

#### Export Only Data

```sh
#
mysqldump \
  -c \
  -t \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  <db-name> \
  -v \
  > "./dump-data-only-$(date -u '+%Y.%m.%d-%H%M').sql"

#
mysqldump \
  -c \
  -t \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  --ignore-table '<db-name>.<table-name>' \
  <db-name> \
  -v \
  > "./dump-data-only-$(date -u '+%Y.%m.%d-%H%M').sql"
```

<!--
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D <db-name> \
  -u root \
  -p'root' \
  -ve 'SHOW TABLES();'
-->
