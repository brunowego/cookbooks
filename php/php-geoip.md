# PHP GeoIP

## References

- [PECL Package](https://pecl.php.net/package/geoip)

## Dependencies

- [GeoIP](/geoip.md)

## Installation

### PECL

```sh
pecl install geoip
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  geoip \
  -- \
    --with-geoip=$(brew --prefix geoip)
```

### Build & Install

```sh
# cURL
curl https://pecl.php.net/get/geoip-1.1.1.tgz | tar -xz

# GNU Wget
wget -O - https://pecl.php.net/get/geoip-1.1.1.tgz | tar -xz

( cd geoip-1.1.1 && phpize && ./configure && make && sudo make install ) && rm -fR geoip-1.1.1
```

## Configuration

```sh
# Check
echo "$(locate geoip.so)"

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

[geoip]
extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/geoip.so
EOF
```

## Verify

```sh
php -m | grep geoip
```

```sh
php -i | grep '^geoip$' -A 7
```

## Service

```sh
# FPM
phpbrew fpm restart
```

## Disable

```sh
# PHPBrew
phpbrew -d ext disable geoip
```
