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
#
php -m | grep tidy

#
php -i | grep '^tidy$' -A 9
```
