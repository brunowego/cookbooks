# PHP Redis

## Installation

### PECL

```sh
pecl install redis
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  redis
```

## Configuration

```sh
# Check
echo "$(locate redis.so)"

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

[redis]
extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/redis.so
EOF
```

## Verify

```sh
php -m | grep redis
```

```sh
php -i | grep '^redis$' -A 36
```

## Service

```sh
# FPM
phpbrew fpm restart
```
