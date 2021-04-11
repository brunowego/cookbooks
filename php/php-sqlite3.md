# PHP SQLite 3

## Installation

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  sqlite3
```

## Verify

```sh
php -m | grep sqlite3
```

```sh
php -i | grep -i sqlite3
# php -i | grep '^sqlite3$' -A 2
```

## Service

```sh
# FPM
phpbrew fpm restart
```
