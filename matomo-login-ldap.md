# Matomo Login LDAP

## Dependencies

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h openldap \
  -e LDAP_ORGANISATION='Example Inc.' \
  -e LDAP_DOMAIN='example.com' \
  -e LDAP_ADMIN_PASSWORD='admin' \
  -e LDAP_CONFIG_PASSWORD='config' \
  -e LDAP_READONLY_USER='true' \
  -e LDAP_READONLY_USER_USERNAME='readonly' \
  -e LDAP_READONLY_USER_PASSWORD='readonly' \
  -e LDAP_TLS_VERIFY_CLIENT='try' \
  -v matomo-openldap-data:/var/lib/ldap \
  -v matomo-openldap-config:/etc/ldap/slapd.d \
  -v matomo-openldap-certs:/container/service/slapd/assets/certs \
  -p 389:389 \
  -p 636:636 \
  --name matomo-openldap \
  --network workbench \
  docker.io/osixia/openldap:1.2.5
```

```sh
docker exec -i matomo-openldap /bin/bash << EOSHELL
ldapadd -x \
  -H ldap://127.0.0.1 \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin \
  << EOF
dn: ou=users,dc=example,dc=com
objectClass: organizationalUnit
objectClass: top
ou: users

dn: cn=John Doe,ou=users,dc=example,dc=com
objectClass: extensibleObject
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
objectClass: posixAccount
objectClass: top
cn: John Doe
gidNumber: 100
homeDirectory: /home/johndoe
sn: John Doe
uid: johndoe
uidNumber: 20001
email: jdoe@example.com
givenName: John Doe
loginShell: /bin/bash
userPassword: $(slappasswd -h {SSHA} -s johndoe)
EOF
EOSHELL
```

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/bash
```

```sh
MATOMO_PLUGIN_VERSION="$(curl -s https://api.github.com/repos/matomo-org/plugin-LoginLdap/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/matomo-org/plugin-LoginLdap/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-LoginLdap-${MATOMO_PLUGIN_VERSION}/LoginLdap/"
```

## State

```sh
#
./console plugin:activate LoginLdap

#
./console plugin:deactivate LoginLdap
```

## Configuration

```sh
./console config:set \
  'LoginLdap.servers[]="server"' \
  'LoginLdap_server.hostname="matomo-openldap"' \
  'LoginLdap_server.port=389' \
  'LoginLdap_server.base_dn="dc=example,dc=com"' \
  'LoginLdap_server.admin_user="cn=admin,dc=example,dc=com"' \
  'LoginLdap_server.admin_pass="admin"'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| johndoe | johndoe |

## Remove

```sh
docker rm -f matomo-openldap
docker volume rm matomo-openldap-data matomo-openldap-config matomo-openldap-certs
```
