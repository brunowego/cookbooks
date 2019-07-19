# OpenLDAP

## Docker

### Volume

```sh
docker volume create openldap-data
docker volume create openldap-config
```

### Running

```sh
docker run -d \
  -h openldap \
  -e LDAP_ORGANISATION='Example Inc.' \
  -e LDAP_DOMAIN=example.org \
  -e LDAP_BASE_DN= \
  -e LDAP_ADMIN_PASSWORD=admin \
  -e LDAP_CONFIG_PASSWORD=config \
  -e LDAP_READONLY_USER=true \
  -e LDAP_READONLY_USER_USERNAME=readonly \
  -e LDAP_READONLY_USER_PASSWORD=readonly \
  -v openldap-data:/var/lib/ldap \
  -v openldap-config:/etc/ldap/slapd.d \
  -p 389:389 \
  -p 636:636 \
  --name openldap \
  --restart always \
  osixia/openldap:1.2.4
```

### Commands

```sh
docker exec -i openldap [command]
```

### Remove

```sh
docker rm -f openldap
docker volume rm openldap-data openldap-config
```

## CLI

### Installation

#### Homebrew

```sh
brew install openldap
```

### Commands

#### Search

```sh
ldapsearch -x \
  -H ldap://$(docker-machine ip) \
  -b 'dc=example,dc=org' \
  -D 'cn=admin,dc=example,dc=org' \
  -w admin
```

#### Password Utility

```sh
slappasswd -h {SSHA} -s johndoe
```

#### Add

##### Organizational Unit

```sh
ldapadd -x \
  -H ldap://$(docker-machine ip) \
  -D 'cn=admin,dc=example,dc=org' \
  -w admin \
  << EOF
dn: ou=users,dc=example,dc=org
objectClass: organizationalUnit
objectClass: top
ou: users

dn: ou=groups,dc=example,dc=org
objectClass: organizationalUnit
objectClass: top
ou: groups

dn: ou=bind,dc=example,dc=org
objectclass: organizationalUnit
objectclass: top
ou: bind
EOF
```

##### Organizational Person

```sh
ldapadd -x \
  -H ldap://$(docker-machine ip) \
  -D 'cn=admin,dc=example,dc=org' \
  -w admin \
  << EOF
dn: cn=John Doe,ou=users,dc=example,dc=org
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
email: johndoe@example.org
givenName: John Doe
loginShell: /bin/bash
userPassword: {SSHA}BYPf8cP725HiMRg9tOKlAFG0Wyl7Nelh
EOF
```

##### Group Of Unique Names

```sh
ldapadd -x \
  -H ldap://$(docker-machine ip) \
  -D 'cn=admin,dc=example,dc=org' \
  -w admin \
  << EOF
dn: cn=developer,ou=groups,dc=example,dc=org
objectClass: groupOfUniqueNames
objectClass: top
cn: developer
uniqueMember: cn=John Doe,ou=users,dc=example,dc=org
EOF
```
