# Xdebug

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install rh-php72-php-devel
```

## Installation

```sh
pecl update-channels
pecl install xdebug
```

## Configuration

### Homebrew

```sh
sudo tee -a /usr/local/Cellar/php/7.3.4_1/.bottle/etc/php/7.3/php.ini << EOF

[xdebug]
zend_extension=/usr/local/Cellar/php/7.3.4_1/pecl/20180731/xdebug.so

xdebug.var_display_max_children=256
xdebug.var_display_max_data=1024
xdebug.var_display_max_depth=6
EOF
```

```sh
sudo tee -a /usr/local/Cellar/php/7.3.4_1/.bottle/etc/php/7.3/php.ini << EOF

xdebug.remote_enable=on
xdebug.remote_handler=dbgp
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
EOF
```

### YUM

```sh
sudo tee -a /etc/opt/rh/rh-php72/php.ini << EOF

[xdebug]
zend_extension=/opt/rh/rh-php72/root/usr/lib64/php/modules/xdebug.so

xdebug.var_display_max_children=256
xdebug.var_display_max_data=1024
xdebug.var_display_max_depth=6
EOF
```

```sh
sudo tee -a /etc/opt/rh/rh-php72/php.ini << EOF

xdebug.remote_enable=on
xdebug.remote_handler=dbgp
xdebug.remote_host=127.0.0.1
xdebug.remote_port=9000
EOF
```

## Verify

```sh
php -m | grep xdebug
```

```sh
php -i | grep xdebug
```
