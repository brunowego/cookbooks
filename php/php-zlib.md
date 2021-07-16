# PHP Zlib

## Installation

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  zlib
```

## Verify

```sh
php -m | grep zlib
```

```sh
php -i | grep '^zlib$' -A 11
```

## Service

```sh
# FPM
phpbrew fpm restart
```
