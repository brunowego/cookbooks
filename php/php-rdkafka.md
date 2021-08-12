# PHP Rapid Development Kafka (a.k.a rdkafka)

## Installation

### PECL

```sh
pecl install rdkafka
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  rdkafka
```

## Verify

```sh
php -m | grep rdkafka
```

```sh
php -i | grep '^rdkafka$' -A 6
```

## Service

```sh
# FPM
phpbrew fpm restart
```
