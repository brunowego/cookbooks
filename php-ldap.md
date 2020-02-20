# PHP LDAP

## Installation

### YUM

#### 7.x

```sh
yum check-update

# Repo: Software Collections
sudo yum -y install rh-php72-php-ldap
```

### PHPBrew

```sh
# Homebrew
phpbrew -d ext install \
  --downloader=wget \
  ldap \
  -- \
    --with-ldap=$(brew --prefix openldap)
```

## Verify

```sh
php -m | grep ldap
```

```sh
php -i | grep '^ldap$' -A 7
```

## Service

```sh
# PHPBrew
phpbrew fpm restart
```
