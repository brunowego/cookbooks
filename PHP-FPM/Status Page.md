# Status Page

## Configuration

### YUN

```sh
sudo sed -i 's/^;pm\.status_path/pm.status_path/' /etc/opt/rh/rh-php70/php-fpm.d/www.conf
sudo sed -i 's/^;ping.path/ping.path/' /etc/opt/rh/rh-php70/php-fpm.d/www.conf
```

### APT

```sh
sudo sed -i 's/^;pm\.status_path/pm.status_path/' /etc/php/7.0/fpm/pool.d/www.conf
sudo sed -i 's/^;ping.path/ping.path/' /etc/php/7.0/fpm/pool.d/www.conf
```

## Service

### YUM

```sh
sudo systemctl restart rh-php70-php-fpm
```

### APT

```sh
sudo systemctl restart php7.0-fpm
```
