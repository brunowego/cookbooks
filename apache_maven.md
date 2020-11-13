# Apache Maven

## References

- [Project Object Model (POM)](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html)
- [Maven Version Manager](/mvnvm.md)

## CLI

### Installation

#### Homebrew

```sh
brew install maven

# Legacy
brew install maven@3.5
```

#### APT

```sh
sudo apt update
sudo apt -y install maven
```

#### YUM

```sh
yum check-update
sudo yum -y install maven
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Apache Maven
export PATH="/usr/local/opt/maven@3.5/bin:$PATH"
```

### Commands

```sh
mvn -h
```

### Usage

```sh
#
mvn clean

#
mvn install
mvn install -DskipTests

#
mvn package

#
mvn dependency:tree
```

### Tips

#### Proxy

| Property | Description |
| --- | --- |
| `http.proxyUser` | |
| `http.proxyPassword` | |
| `https.proxyUser` | |
| `https.proxyPassword` | |

```sh
# Pre-flight
export MAVEN_HTTP_PROXY_HOST="$ZSH_PROXY_HOST"
export MAVEN_HTTP_PROXY_PORT="$ZSH_PROXY_PORT"
export MAVEN_HTTP_NON_PROXY_HOSTS='localhost|127.0.0.1'

# Option 1: CLI
mvn \
  -Dhttp.proxyHost="$MAVEN_HTTP_PROXY_HOST"  \
  -Dhttp.proxyPort="$MAVEN_HTTP_PROXY_PORT" \
  -Dhttp.nonProxyHosts="$MAVEN_HTTP_NON_PROXY_HOSTS" \
  -Dhttps.proxyHost="$MAVEN_HTTP_PROXY_HOST"  \
  -Dhttps.proxyPort="$MAVEN_HTTP_PROXY_PORT" \
  -Dhttps.nonProxyHosts="$MAVEN_HTTP_NON_PROXY_HOSTS" \
  [command]

# Option 2: Environment
export MAVEN_OPTS="\
  -Dhttp.proxyHost=$MAVEN_HTTP_PROXY_HOST \
  -Dhttp.proxyPort=$MAVEN_HTTP_PROXY_PORT \
  -Dhttp.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS \
  -Dhttps.proxyHost=$MAVEN_HTTP_PROXY_HOST \
  -Dhttps.proxyPort=$MAVEN_HTTP_PROXY_PORT \
  -Dhttps.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS \
"

# Option 3: Globally
mkdir -p ~/.m2

tee ~/.m2/settings.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<settings>
	<proxies>
		<proxy>
			<id>http</id>
			<active>true</active>
			<protocol>http</protocol>
			<host>$MAVEN_HTTP_PROXY_HOST</host>
			<port>$MAVEN_HTTP_PROXY_PORT</port>
			<nonProxyHosts>$MAVEN_HTTP_NON_PROXY_HOSTS</nonProxyHosts>
		</proxy>
		<proxy>
			<id>https</id>
			<active>true</active>
			<protocol>https</protocol>
			<host>$MAVEN_HTTP_PROXY_HOST</host>
			<port>$MAVEN_HTTP_PROXY_PORT</port>
			<nonProxyHosts>$MAVEN_HTTP_NON_PROXY_HOSTS</nonProxyHosts>
		</proxy>
	</proxies>
</settings>
EOF
```

> Global path is `/usr/share/maven/conf/settings.xml`.

#### Limited Home Disk

```sh
mkdir -p /tmp/.m2
```

```sh
ln -s /tmp/.m2 ~/.m2
```

After finish, remove.

```sh
rm -r ~/.m2
```

### Issues

#### Valid Certificate

```log
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

[Export Web Self-signed Certificate](/openssl.md#export-web-self-signed-certificate).

```sh
mkdir -p "$JAVA_HOME/lib/security"

echo 'yes' | \
  keytool \
    -import \
    -alias selfsigned \
    -file ./selfsigned_certificate.pem \
    -keystore "$JAVA_HOME/lib/security/cacerts" \
    -storepass changeit

rm ./selfsigned_certificate.pem

echo -n | \
  keytool \
    -list \
    -v \
    -alias selfsigned \
    -keystore "$JAVA_HOME/lib/security/cacerts" \
    -storepass changeit
```

#### Valid Certification Path

```log
sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Apache Maven
export MAVEN_OPTS="$MAVEN_OPTS -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts"
```

<!--
-Djavax.net.ssl.trustAnchors=$JAVA_HOME/lib/security/cacerts
-Djavax.net.ssl.trustStorePassword=changeit
-->

#### Incompatible Version

```log
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings (gerar-effective-settings) on project [app-name]: Execution gerar-effective-settings of goal org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings: java.lang.NoSuchMethodError: org.apache.maven.settings.Settings.getRuntimeInfo()Lorg/apache/maven/settings/RuntimeInfo;
```

```sh
# Downgrade Apache Maven to version 3.0.4
echo 'mvn_version=3.0.4' > mvnvm.properties

mvn clean install
```

<!-- ####

```log

````

```sh
export MAVEN_OPTS="$MAVEN_OPTS -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"
export JAVA_OPTS="$JAVA_OPTS -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"
``` -->

<!-- ####

```log
java.lang.RuntimeException: Unexpected error: java.security.InvalidAlgorithmParameterException: the trustAnchors parameter must be non-empty
```

```sh
export MAVEN_OPTS="$MAVEN_OPTS -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=changeit"

export JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=changeit"
``` -->

### Uninstall

```sh
# Homebrew
brew uninstall maven

rm -fR ~/.m2
```
