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

kadmin.local:  addprinc -randkey host/kdc.example.com
kadmin.local:  ktadd host/kdc.example.com
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
ssh -v kdc.example.com
```
