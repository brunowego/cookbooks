# OpenLDAP

```sh
git clone https://github.com/dinkel/docker-openldap.git
cd docker-openldap
git remote add dokku dokku@ip:docker-openldap
git push dokku master
```

```sh
dokku config:set openldap SLAPD_PASSWORD=admin \
SLAPD_DOMAIN=ldap.example.com

dokku config openldap

dokku bind:create openldap 389
```

```ini
Host: ldap.example.com
Base DN: dc=ldap,dc=example,dc=com

User DN: cn=admin,dc=ldap,dc=example,dc=com
Password: admin
```

## OpenLDAP and phpLDAPadmin

```sh
git clone https://github.com/fanday/openldap.git
cd openldap.git
git remote add dokku dokku@ip:openldap
git push dokku master
```

```sh
dokku bind:create openldap 389
```
