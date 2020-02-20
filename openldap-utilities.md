# OpenLDAP Client Utilities

## References

- [Debian Wiki](https://wiki.debian.org/LDAP/LDAPUtils)

## Installation

### APT

```sh
sudo apt update
sudo apt -y install ldap-utils
```

### YUM

```sh
yum check-update
sudo yum -y install openldap-clients
```

### APK

```sh
sudo apk update
sudo apk add openldap-clients
```

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/openldap-clients -
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache openldap-clients

EOF
```

### Running

```sh
docker run -t --rm \
  --name openldap-clients \
  example/openldap-clients:latest ldapsearch -h
```

## Commands

```sh
ldapadd
ldapcompare
ldapdelete
ldapexop
ldapmodify
ldapmodrdn
ldappasswd
ldapsearch
ldapurl
ldapwhoami
```
