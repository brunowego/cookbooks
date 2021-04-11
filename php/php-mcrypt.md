# PHP Mcrypt

## Dependencies

- [Mcrypt](/mcrypt.md)

## Installation

### PECL

```sh
pecl install mcrypt
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  mcrypt \
  -- \
    --with-icu-dir=$(brew --prefix libmcrypt)
```

## Configuration

```sh
# Check
echo "$(locate mcrypt.so)"

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

[mcrypt]
extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/mcrypt.so
EOF
```

## Verify

```sh
php -m | grep mcrypt
```

```sh
php -i | grep '^mcrypt$' -A 11
```

## Service

```sh
# FPM
phpbrew fpm restart
```
