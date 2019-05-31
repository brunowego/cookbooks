# Kerberos

## Java Authentication and Authorization Service (JAAS)

```sh
sudo install -dm 775 -o flume -g flume /etc/flume-ng/conf
```

```sh
sudo -u flume tee /etc/flume-ng/conf/jaas.conf << 'EOF'
Client {
  com.sun.security.auth.module.Krb5LoginModule required
  useKeyTab=true
  storeKey=true
  keyTab="/etc/security/keytabs/[name].keytab"
  principal="[username]/[FQDN]@[REALM]";
};

KafkaClient {
  com.sun.security.auth.module.Krb5LoginModule required
  useKeyTab=true
  storeKey=true
  serviceName="kafka"
  keyTab="/etc/security/keytabs/[name].keytab"
  principal="[username]/[FQDN]@[REALM]";
};
EOF
```

## Environment

```sh
sudo tee -a /opt/apache-flume/conf/flume-env.sh << 'EOF'
# Kerberos Security
export JAVA_OPTS="$JAVA_OPTS -Djava.security.krb5.conf=/etc/krb5.conf"
export JAVA_OPTS="$JAVA_OPTS -Djava.security.auth.login.config=/etc/flume/conf/jaas.conf"
EOF
```
