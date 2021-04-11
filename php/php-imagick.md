# PHP ImageMagick

## Dependencies

- [ImageMagick](/imagemagick.md)

## Installation

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  imagick \
  -- \
    --with-imagick-dir=$(brew --prefix imagemagick)

# Linux
# TODO
```

## Verify

```sh
php -m | grep imagick
```

```sh
php -i | grep '^imagick$' -A 15
```

## Service

```sh
# FPM
phpbrew fpm restart
```
