# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install php-fpm
```

## Configuration

### YUM

```sh
sudo sed -i 's/^;pm\.status_path/pm.status_path/' /etc/php-fpm.d/www.conf
```

## Services

### YUM

```sh
sudo systemctl enable --now php-fpm
```
