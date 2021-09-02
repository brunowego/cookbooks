# PHP PDFNetPHP

## Links

- [Code Repository](https://github.com/PDFTron/PDFNetWrappers/tree/master/PDFNetPHP)

## Dependencies

### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install \
  curl \
  cmake \
  g++ \
  swig \
  php-dev
```

## Installation

### Unix-like

```sh
#
curl -L 'https://github.com/PDFTron/PDFNetWrappers/archive/master.tar.gz' | \
  tar -xzC /opt

#
curl -L 'http://www.pdftron.com/downloads/PDFNetC64.tar.gz' | \
  tar -xzC /opt/PDFNetWrappers-master/PDFNetC --strip-components 1

#
( cd /opt/PDFNetWrappers-master && cmake -D BUILD_PDFNetPHP=ON ./ && make && make install )

#
echo 'extension=PDFNetPHP.so' >> "$(php -i | grep -oE /.+/php.ini)"
```

## Verify

```sh
#
php -m | grep PDFNetPHP

#
php -i | grep '^PDFNetPHP$' -A 1
```

## Service

```sh
# FPM
phpbrew fpm restart
```
