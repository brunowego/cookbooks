# Kerberos

## Environment

### Linux

```sh
tee -a /usr/share/dbeaver/dbeaver.ini << EOF
-Dsun.security.krb5.debug=true
-Djava.security.krb5.conf=/etc/krb5.conf
-Djavax.security.auth.useSubjectCredsOnly=false
EOF
```

### OS X

```sh
tee -a /Applications/DBeaver.app/Contents/Eclipse/dbeaver.ini << EOF
-Dsun.security.krb5.debug=true
-Djava.security.krb5.conf=/etc/krb5.conf
-Djavax.security.auth.useSubjectCredsOnly=false
EOF
```

> Change `DBeaver.app` to `DBeaverEE.app` for enterprise edition.

## Connection

### Hive Server2

```txt
jdbc:hive2://[hostname]:10000/default;principal=[username]/[FQDN]@[REALM]
```

> Use `_HOST` instead of `FQDN` when have keytab initialized.

### Using ZooKeeper

```txt
jdbc:hive2://[hostname]:2181/default;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2
```
