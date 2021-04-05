# GSSAPI (Generic Security Services API)

## Library

### Dependencies

- [MIT Kerberos Development](/krb5-devel.md)

### Installation

#### YUM

```sh
yum check-update
sudo yum -y install cyrus-sasl-gssapi
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y cyrus-sasl-gssapi
```

### Commands

```sh
#
krb5-config --libs gssapi
```

### Issues

#### SASL Headers

```log
sasl/saslwrapper.h:22:23: fatal error: sasl/sasl.h: No such file or directory
```

```sh
# YUM
yum check-update
sudo yum -y install cyrus-sasl-devel
```

#### Wrong Prefix Path

```log
error: unknown type name ‘gss_key_value_set_desc’
```

```sh
#
krb5-config --all

$ Version:     Kerberos 5 release 1.16.3
$ Vendor:      Massachusetts Institute of Technology
$ Prefix:      /usr/lib/mit
$ Exec_prefix: /usr/lib/mit

#
sudo sed -ri '/prefix=/ s|/usr/lib/mit|/usr|' /usr/lib/mit/bin/krb5-config
```
