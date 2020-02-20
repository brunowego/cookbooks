# PHP libmaxminddb

## Dependencies

- [libmaxminddb](/libmaxminddb.md)

## Installation

### Build & Install

```sh
git clone https://github.com/maxmind/MaxMind-DB-Reader-php
( cd ./MaxMind-DB-Reader-php/ext && phpize && ./configure && make && sudo make install ) && rm -fR ./MaxMind-DB-Reader-php
```

## Configuration

```sh
# Check
echo "$(locate maxminddb.so)"

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

[maxminddb]
extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/maxminddb.so
EOF
```

## Verify

```sh
# Module
php -m | grep maxminddb

# Info
php -i | grep '^maxminddb$' -A 4
```

## Service

```sh
# FPM
phpbrew fpm restart
```
