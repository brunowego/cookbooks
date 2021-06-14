# Lightweight Directory Access Protocol (LDAP)

<!--
https://stackoverflow.com/questions/11269564/ldap-vs-relational-database
-->

## Tools

- [slapcat](/slapcat.md)

## Related

- [OpenLDAP](/openldap.md)

## References

- Port 389 and 636 (SSL)

## Tips

### TCP State

```sh
nmap -p 389,636 [hostname]
```

### SSH Tunnel

```sh
ssh \
  -p [port] \
  -N \
  -L 3389:[hostname]:389 \
  [username]@[hostname]

ldapsearch -x \
  -H 'ldap://127.0.0.1:3389' \
  -b 'dc=example,dc=com' \
  -D 'cn=admin,dc=example,dc=com' \
  -w admin
```
