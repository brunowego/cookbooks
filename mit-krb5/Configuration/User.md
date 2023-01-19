# User

## Server

```sh
sudo kadmin.local

kadmin.local:  addprinc user1
kadmin.local:  exit
```

```sh
sudo useradd user1
```

```sh
sudo kadmin.local

kadmin.local:  addprinc -randkey host/kdc.domain.tld
kadmin.local:  ktadd host/kdc.domain.tld
kadmin.local:  exit
```

## Client

```sh
sudo useradd user1
sudo passwd user1
su - user1
```

```sh
kinit
klist
```

```sh
kdestroy
```

## Test

```sh
ssh -v kdc.domain.tld
```
