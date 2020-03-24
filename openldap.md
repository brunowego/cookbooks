# OpenLDAP

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/openldap#configuration)

### Install

```sh
kubectl create namespace openldap
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n openldap
```

```sh
helm install stable/openldap \
  -n openldap \
  --namespace openldap \
  --set image.tag=1.2.5 \
  --set env.LDAP_ORGANISATION='Example Inc.' \
  --set env.LDAP_DOMAIN=example.com
  # --set tls.enabled=true \
  # --set tls.secret=example.tls-secret
```

### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.389 openldap/openldap:389)
```

### Secret

```sh
kubectl get secret openldap \
  -o jsonpath='{.data.LDAP_ADMIN_PASSWORD}' \
  -n openldap | \
    base64 --decode; echo
```

### Logs

```sh
kubectl logs $(kubectl get pod -l 'app=openldap' -o jsonpath='{.items[0].metadata.name}' -n openldap) -n openldap -f
```

### Test

```sh
ldapsearch -x \
  -H ldap://openldap.openldap.svc.cluster.local \
  -b 'dc=example,dc=com' \
  -D 'cn=admin,dc=example,dc=com' \
  -w $(kubectl get secret openldap -o jsonpath='{.data.LDAP_ADMIN_PASSWORD}' -n openldap | base64 --decode; echo)
```

### Delete

```sh
helm delete openldap --purge
kubectl delete namespace openldap --grace-period=0 --force
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

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
  -v openldap-data:/var/lib/ldap \
  -v openldap-config:/etc/ldap/slapd.d \
  -v openldap-certs:/container/service/slapd/assets/certs \
  -p 389:389 \
  -p 636:636 \
  --name openldap \
  --network workbench \
  docker.io/osixia/openldap:1.2.5
```

### Logs

```sh
docker logs -f openldap
```

### Test

```sh
ldapsearch -x \
  -H "ldap://127.0.0.1" \
  -b 'dc=example,dc=com' \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin
```

### Remove

```sh
docker rm -f openldap
docker volume rm openldap-data openldap-config openldap-certs
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
  -H ldap://127.0.0.1 \
  -b 'dc=example,dc=com' \
  -D 'cn=admin,dc=example,dc=com' \
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
  -H ldap://127.0.0.1 \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin \
  << EOF
dn: ou=users,dc=example,dc=com
objectClass: organizationalUnit
objectClass: top
ou: users

dn: ou=groups,dc=example,dc=com
objectClass: organizationalUnit
objectClass: top
ou: groups

dn: ou=bind,dc=example,dc=com
objectclass: organizationalUnit
objectclass: top
ou: bind
EOF
```

##### Organizational Person

```sh
ldapadd -x \
  -H ldap://127.0.0.1 \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin \
  << EOF
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
userPassword: {SSHA}BYPf8cP725HiMRg9tOKlAFG0Wyl7Nelh
EOF
```

##### Group Of Unique Names

```sh
ldapadd -x \
  -H ldap://127.0.0.1 \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin \
  << EOF
dn: cn=developer,ou=groups,dc=example,dc=com
objectClass: groupOfUniqueNames
objectClass: top
cn: developer
uniqueMember: cn=John Doe,ou=users,dc=example,dc=com
EOF
```
