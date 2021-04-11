# PHP PostgreSQL

## Dependencies

- [PostgreSQL](/postgresql.md)

## Installation

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  pgsql
```

## Verify

```sh
php -m | grep pgsql
```

```sh
php -i | grep -i pgsql
# php -i | grep '^pgsql$' -A 6
```

## Service

```sh
# FPM
phpbrew fpm restart
```
