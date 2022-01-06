# PHP Sodium

<!--
libsodium-dev
-->

## Links

- [Main Website](https://php.net/manual/en/book.sodium.php)

<!-- ## Dependencies

- [Argon2](/argon2.md) -->

## Installation

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  libsodium
```

## Verify

```sh
#
php -m | grep libsodium

#
php -i | grep '^libsodium$' -A 5
```

## Issues

### Unable to Load

```log
PHP Warning: PHP Startup: Unable to load dynamic library 'libsodium.so'
```

```sh
phpbrew -d ext disable libsodium
```
