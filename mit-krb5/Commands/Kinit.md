# Kinit

## Initialize

```sh
kinit -kt /etc/security/keytabs/[name].keytab [username]/[FQDN]@[REALM]
```

> Pre-pend with `KRB5_CONFIG=[/path/to/krb5.conf]` to change the `krb5.conf` default location.
