# PHP-FPM

## Dependencies

- php-gd
- php-mbstring
- php-mysqlnd
- php-xml

## Configuration

### YUM

```sh
sudo sed -i '/^user =/s/apache/www-data/' /etc/opt/rh/rh-php70/php-fpm.d/www.conf
sudo sed -i '/^group =/s/apache/www-data/' /etc/opt/rh/rh-php70/php-fpm.d/www.conf
```

### APT

```sh
sudo sed -i '/^user =/s/apache/www-data/' /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i '/^group =/s/apache/www-data/' /etc/php/7.0/fpm/pool.d/www.conf
```

## Persist

### YUM

```sh
sudo systemctl restart rh-php70-php-fpm
```

### APT

```sh
sudo systemctl restart php7.0-fpm
```

## Test

### Port

```sh
sudo lsof -i :9000
```

### Process

```sh
ps -ef | grep php-fpm
```
