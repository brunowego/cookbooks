# PHP ZIP

## Installation

### APT

```sh
sudo apt update
sudo apt -y install php-zip
```

### YUM

```sh
yum check-update
sudo yum -y install php-pecl-zip
```

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  zip
```

## Verify

```sh
php -m | grep zip
```

```sh
php -i | grep '^zip$' -A 5
```

## Service

```sh
# FPM
phpbrew fpm restart
```
