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

### Darwin

```sh
# WARNING: This approach is not recommended. Do it at your own risk. You have been warned.
sudo chmod o+w -R /opt
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

## Composer

```json
{
    // ...
    "autoload": {
        // ...
        "files": ["/opt/PDFNetWrappers-master/PDFNetC/Lib/PDFNetPHP.php"]
    },
    // ...
}
```

## Verify

```sh
#
php -r 'var_dump(extension_loaded("PDFNetPHP"));'

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
