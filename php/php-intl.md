# PHP Internationalization Functions

## Dependencies

- [International Components for Unicode](/icu.md)
- [GCC, the GNU Compiler Collection (gcc)](/gcc.md)

## Installation

<!-- ### PECL

```sh
pecl install intl
``` -->

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  intl \
  -- \
    --with-icu-dir=$(brew --prefix icu4c@58.1)
```

## Verify

```sh
php -m | grep intl
```

```sh
php -i | grep -i intl
# php -i | grep '^intl$' -A 9
```

## Service

```sh
# FPM
phpbrew fpm restart
```
