# PHP Xdebug

## Dependencies

### YUM

#### 7.x

```sh
yum check-update

# Repo: Software Collections
sudo yum -y install rh-php72-php-devel
```

## Installation

### PECL

```sh
pecl install xdebug
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  xdebug
```

## Configuration

```sh
# Check
echo "$(locate xdebug.so)"

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

[xdebug]
zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so
EOF

#
sudo tee -a "$(php -i | grep -oE /.+/php.ini)" << EOF

xdebug.remote_autostart=on
xdebug.remote_enable=on
xdebug.remote_handler=dbgp
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000

xdebug.var_display_max_children=256
xdebug.var_display_max_data=1024
xdebug.var_display_max_depth=6
EOF
```

## Verify

```sh
# Module
php -m | grep xdebug

# Info
php -i | grep '^xdebug$' -A 76
```

## Service

```sh
# FPM
phpbrew fpm restart
```
