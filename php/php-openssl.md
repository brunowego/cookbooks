# PHP OpenSSL

## Dependencies

### YUM

#### 7.x

```sh
yum check-update

# Repo: Software Collections
sudo yum -y install rh-php72-php-devel
```

## Installation

### PHPBrew

```sh
phpbrew -d ext install \
  --downloader=wget \
  openssl
```

## Issues

### OpenSSL

```log
configure: error: Cannot find OpenSSL's <evp.h>
```

```sh
# Darwin
export PKG_CONFIG_PATH="$(brew --cellar openssl)/$(brew info --json openssl | jq -r '.[0].installed[0].version')/lib/pkgconfig:$PKG_CONFIG_PATH"
```

## Verify

```sh
# Module
php -m | grep openssl

# Info
php -i | grep '^openssl$' -A 9
```

<!-- ## Issues

### TBD

```log
PHP Warning:  Module 'openssl' already loaded in Unknown on line 0
```

```sh
phpbrew -d ext clean --purge openssl
``` -->
