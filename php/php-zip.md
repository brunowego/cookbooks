# PHP Zip

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
#
php -m | grep zip

#
php -i | grep '^zip$' -A 5
```

<!-- ## Issues

### TBD

```log
PHP Warning:  Module 'zip' already loaded in Unknown on line 0
```

```sh
phpbrew -d ext clean --purge zip
``` -->
