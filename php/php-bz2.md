# PHP Bzip2

## References

- [PECL Package](https://pecl.php.net/package/bz2)

## Dependencies

- [bzip2](/bzip2.md)

## Installation

### PECL

```sh
pecl install bz2
```

### APT

```sh
sudo apt update
sudo apt -y install php-bz2
```

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  bz2 \
  -- \
    --with-bz2=$(brew --prefix bzip2)
```

### Source Code

```sh
#
cd /path/to/src/php/version

./configure \
  # [...]
  --with-bz2
```

## Verify

```sh
php -m | grep bz2
```

```sh
php -i | grep '^bz2$' -A 5
```

## Service

```sh
# FPM
phpbrew fpm restart
```
