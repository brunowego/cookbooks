# PHP LDAP

## Dependencies

- [OpenLDAP](/openldap.md)
- [phpize](/phpize.md)

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

# Linux
phpbrew -d ext install \
  --downloader=wget \
  ldap
```

### Dockerfile

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/php-apache-ldap -
FROM docker.io/library/php:7.3-apache

RUN apt update && \
    apt --no-install-recommends -y install libldap2-dev=2.4.47+dfsg-3+deb10u2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

EOF
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
