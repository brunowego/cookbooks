# LDAP

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install rh-php72-php-ldap
```

## Verify

```sh
php -m | grep ldap
```

```sh
php -i | grep ldap
```
