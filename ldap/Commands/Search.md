# Search

```sh
ldapsearch -h
```

```sh
ldapsearch -x -b "uid=username,ou=people,dc=example,dc=com"
```

```sh
ldapsearch -h [host] -p [port] -b [base DN] -D [bind DN] -w [password]
```

```sh
ldapsearch -h 127.0.0.1 -p 389 -b "dc=example,dc=com" -D "cn=admin,dc=example,dc=com" -w 'Pa$$w0rd!'
```

```sh
ldapsearch -x -LLL -h [host] -D [user] -w [password] -b [base DN] -s sub "([filter])" [attribute list]
```

```sh
ldapsearch -x -LLL -h 127.0.0.1 -D "cn=admin,dc=example,dc=com" -w 'Pa$$w0rd!' -b "dc=example,dc=com" -s sub "(objectClass=person)" givenName
```
