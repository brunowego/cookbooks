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
#
php -m | grep 'Zend OPcache'

#
php -i | grep '^Zend OPcache$' -A 41
```
