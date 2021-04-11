# PHP OPcache

## Installation

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  opcache
```

## Verify

```sh
php -m | grep 'Zend OPcache'
```

```sh
php -i | grep '^Zend OPcache$' -A 41
```

## Service

```sh
# FPM
phpbrew fpm restart
```
