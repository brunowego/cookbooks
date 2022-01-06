# Symfony Tests

## CLI

### Commands

```sh
./vendor/bin/simple-phpunit -h
```

### Running

```sh
#
./vendor/bin/simple-phpunit \
  --coverage-clover ./phpunit.coverage.xml \
  --log-junit ./phpunit.report.xml \
  --colors=always
```

### Issues

#### Missing Xdebug

```log
Error: No code coverage driver is available
```

Install [PHP Xdebug](/php/php-xdebug.md).

#### Xdebug Coverage Mode

```log
Code coverage needs to be enabled in php.ini by setting 'xdebug.mode' to 'coverage'
```

```sh
sed -i '/^xdebug.mode/ s/=debug/=coverage/g' $(php -i | grep -oE /.+/php.ini)
```
