# PHP Rapid Development Kafka (a.k.a rdkafka)

## Dependencies

**For PECL**

- [PHP Extension and Application Repository (PEAR)](/pear.md)
- [PHP Development Library (a.k.a php-dev)](/php/php-dev.md)
- [Library Rapid Development Kafka (a.k.a librdkafka)](/librdkafka.md)

## Installation

### PECL

```sh
#
pecl install rdkafka

#
echo 'extension=rdkafka.so' >> "$(php -i | grep -oE /.+/php.ini)"
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

## Issues

<!-- ###

```log
PHP Warning:  Module 'xml' already loaded in Unknown on line 0
```

TODO -->

<!-- ### Unavailable Releases

```log
No releases available for package "pecl.php.net/rdkafka"
install failed
```

TODO -->

### Channel Update

```log
WARNING: channel "pecl.php.net" has updated its protocols, use "pecl channel-update pecl.php.net" to update
```

```sh
pecl channel-update pecl.php.net
```

### Missing PHP Development Library

```log
running: phpize
Can't find PHP headers in /usr/include/php
The php-devel package is required for use of this command.
ERROR: `phpize' failed
```

Just install [PHP Development Library](/php/php-dev.md)

### Missing Library Rapid Development Kafka (a.k.a librdkafka)

```log
checking for librdkafka/rdkafka.h" in default path... not found
configure: error: Please reinstall the rdkafka distribution
```

Just install [Library Rapid Development Kafka (a.k.a librdkafka)](/librdkafka.md)
