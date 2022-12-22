# Java KeyStore (keytool)

## CLI

### Commands

```sh
keytool -help
```

### Configuration

```sh
mkdir -p "$JAVA_HOME/jre/lib/security/cacerts"
```

### Usage

```sh
# List
keytool -list

#
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
  -alias <name> \
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

<!-- #### CA Signed Certificate

```sh
keytool \
  -certreq \
  -alias datalayer \
  -keystore datalayer.jks \
  -file datalayer.csr
``` -->

<!-- #### Self-Signed Certificate

```sh
keytool \
  -keystore datalayer.jks \
  -alias datalayer \
  -genkey \
  -keyalg RSA \
  -sigalg SHA256withRSA \
  -validity 365
```

```sh
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA
keytool -keystore keystore -alias doc-api -genkey -keyalg RSA -sigalg SHA256withRSA -ext 'SAN=dns:doc.datalayer.io,dns:*.datalayer.io'
``` -->

<!-- #### Load Certificate

```sh
keytool \
  -keystore datalayer.jks \
  -import \
  -alias datalayer \
  -file certificate.crt \
  -trustcacerts
``` -->

<!-- ### Issues

#### TBD

```log
keytool error: java.lang.Exception: Keystore file does not exist: $JAVA_HOME/jre/lib/security/cacerts
```

```sh

``` -->
