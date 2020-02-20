# PHP Sockets

## Installation

### APK

```sh
apk add php7-sockets
```

## Verify

```sh
php -m | grep sockets
```

```sh
php -i | grep '^sockets$' -A 2
```

## Service

```sh
# FPM
phpbrew fpm restart
```
