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
php -m | grep exif
```

```sh
php -i | grep '^exif$' -A 6
```

## Service

```sh
# FPM
phpbrew fpm restart
```
