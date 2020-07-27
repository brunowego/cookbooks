# PHP Tidy

## Dependencies

- [LibTidy](/libtidy.md)

## Installation

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  tidy
```

## Verify

```sh
php -m | grep tidy
```

```sh
php -i | grep '^tidy$' -A 9
```

## Service

```sh
# FPM
phpbrew fpm restart
```
