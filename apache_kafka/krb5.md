# krb5

```properties
security.protocol=SASL_PLAINTEXT

sasl.mechanism=GSSAPI
sasl.kerberos.service.name=kafka
sasl.jaas.config=com.sun.security.auth.module.Krb5LoginModule required \
  useKeyTab=true \
  storeKey=true \
  keyTab="/etc/security/keytabs/[name].keytab" \
  principal="[username]/[FQDN]@[REALM]";
```
