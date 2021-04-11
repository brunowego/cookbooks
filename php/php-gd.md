# PHP GD

<!-- ## References

- [PECL Package](https://pecl.php.net/package/gd) -->

## Dependencies

- [GD](/gd.md)
- [zlib](/zlib.md)

## Installation

<!-- ### PECL

```sh
pecl install gd
``` -->

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  gd \
  -- \
    --with-zlib-dir=$(brew --prefix zlib) \
    --with-jpeg-dir=$(brew --prefix libjpeg) \
    --with-png-dir=$(brew --prefix libpng) \
    --with-freetype-dir=$(brew --prefix freetype) \
    --with-webp-dir==$(brew --prefix webp)

# Linux
phpbrew -d ext install \
  --downloader=wget \
  gd \
  -- \
    --with-freetype-dir=/usr/include/freetype2
```

## Verify

```sh
php -m | grep gd
```

```sh
php -i | grep '^gd$' -A 15
```

## Service

```sh
# FPM
phpbrew fpm restart
```
