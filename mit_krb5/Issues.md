# Issues

## Cannot locate default realm

```sh
sudo sed -i '/\[libdefaults\]/a \ default_realm = [EXAMPLE.COM]' /etc/krb5.conf
```

## Invalid UID in persistent keyring name

```log
kadmin.local: Invalid UID in persistent keyring name while opening default credentials cache
kinit: Unknown credential cache type while getting default ccache
```

```sh
sudo sed -ri 's/^ default_ccache_name = (.*)/# default_ccache_name = \1/g' /etc/krb5.conf
# sudo sed -ri 's/^ default_ccache_name = .*/# &/g' /etc/krb5.conf
```

## Cannot determine realm for host

```log
kinit: Cannot determine realm for host (principal [username]/[FQDN]@[REALM])
```

Edit file `/etc/krb5.conf` or another one in `/etc/krb5.conf.d` folder and add/change:

```conf
[domain_realm]
 .example.com = EXAMPLE.COM
 example.com = EXAMPLE.COM
```

## Keytab contains no suitable keys for host

```log
kinit: Keytab contains no suitable keys for [username]/[FQDN]@[REALM] while getting initial credentials
```

```sh
klist -kte /etc/security/keytabs/[name].keytab
```

```sh
kinit -kt /etc/security/keytabs/[name].keytab [username]/[FQDN]@[REALM]
```

## No worthy mechs found

```log
%2|1549369705.508|LIBSASL|rdkafka#consumer-1| [thrd:sasl_plaintext://kafka:9092/boots]: sasl_plaintext://kafka:9092/bootstrap: No worthy mechs found
```

### YUM

```sh
sudo yum -y install cyrus-sasl-gssapi
```

## Included profile directory

```log
klist: Included profile directory could not be read while initializing krb5
```

```sh
sudo mkdir -p /etc/krb5.conf.d
```

## Can't get Kerberos realm

```sh
kinit -kt /etc/security/keytabs/[name].keytab [username]/_HOST@[REALM]
```
