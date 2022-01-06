# PHP Exchangeable image information (Exif)

## Installation

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  exif
```

## Verify

```sh
#
php -m | grep exif

#
php -i | grep '^exif$' -A 6
```
