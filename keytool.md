# Java KeyStore (keytool)

## CLI

### Commands

```sh
keytool -help
```

### Usage

```sh
mkdir -p "$JAVA_HOME/jre/lib/security/cacerts"
```

```sh
# List
keytool -list

keytool -list \
  -keystore "$JAVA_HOME/jre/lib/security/cacerts" \
  -storepass changeit

# Import Cert
keytool -importcert \
  -noprompt \
  -trustcacerts \
  -alias 'example-selfsign-ca' \
  -file '/etc/ssl/certs/example/root-ca.crt' \
  -keystore "$JAVA_HOME/jre/lib/security/cacerts" \
  -storepass changeit

# Delete
keytool -delete \
  -alias [name] \
  -keystore "$JAVA_HOME/jre/lib/security/cacerts" \
  -storepass changeit
```

<!-- ###

```sh
# Extract certificate from created jssecacerts keystore
keytool -exportcert -alias [host]-1 -keystore jssecacerts -storepass changeit -file [host].cer

# Import certificate into system keystore
keytool -importcert -alias [host] -keystore [path to system keystore] -storepass changeit -file [host].cer
``` -->

### Issues

####

```log
keytool error: java.lang.Exception: Keystore file does not exist: $JAVA_HOME/jre/lib/security/cacerts
```

```sh

```
