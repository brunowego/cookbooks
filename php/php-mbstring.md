# PHP mbstring

## Installation

### APT

```sh
sudo apt update
sudo apt -y install php-mbstring
```

### YUM

```sh
yum check-update
sudo yum -y install php-mbstring
```

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  mbstring
```

## Verify

```sh
php -m | grep mbstring
```

```sh
php -i | grep '^mbstring$' -A 6
```

## Service

```sh
# FPM
phpbrew fpm restart
```
