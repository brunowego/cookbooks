# PHP Advanced Message Queuing Protocol (AMQP)

## Dependencies

### Homebrew

```sh
brew install rabbitmq-c
```

## Installation

### PECL

```sh
pecl install amqp
```

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  amqp \
  -- \
    --with-librabbitmq-dir=$(brew --prefix rabbitmq-c)

# Linux
# TODO
```

## Verify

```sh
#
php -m | grep amqp

#
php -i | grep '^amqp$' -A 34
```
