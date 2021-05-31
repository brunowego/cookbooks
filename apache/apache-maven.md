# Apache Maven

<!--
https://app.pluralsight.com/library/courses/maven-fundamentals/table-of-contents
https://app.pluralsight.com/library/courses/allthetalks-session-66/table-of-contents
-->

## References

- [Project Object Model (POM)](https://maven.apache.org/guides/introduction/introduction-to-the-pom.html)
- [Maven Version Manager](/mvnvm.md)
- Alternative for [Apache Ant](/apache/apache-ant.md)

## Repositories

- [Maven Repository](https://mvnrepository.com/)
- [Maven Central Repository Search](https://search.maven.org/)

## Plugins

- [Apache Maven Site Plugin](https://maven.apache.org/plugins/maven-site-plugin/)

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
#
mvn -h

#
mvn archetype:generate -h
```

### Usage

```sh
# Show dependency tree
mvn dependency:tree

# Show effective POM
mvn help:effective-pom

# Show active profiles
mvn help:active-profiles
```

#### Project

```sh
# Root
PROJECT_GROUP_ID=org.acme.app \
PROJECT_ARTIFACT_ID=app \
PROJECT_VERSION=0.0.1-SNAPSHOT; \
  mvn archetype:generate -B \
    -DarchetypeGroupId=org.codehaus.mojo.archetypes \
    -DarchetypeArtifactId=pom-root \
    -DarchetypeVersion=RELEASE \
    -DgroupId="$PROJECT_GROUP_ID" \
    -DartifactId="$PROJECT_ARTIFACT_ID" \
    -Dversion="$PROJECT_VERSION"

#
cd ./"$PROJECT_ARTIFACT_ID"

# Module
PROJECT_GROUP_ID=org.acme.app \
PROJECT_ARTIFACT_ID=user \
PROJECT_VERSION=0.0.1-SNAPSHOT; \
  mvn archetype:generate -B \
    -DarchetypeGroupId=org.apache.maven.archetypes \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=RELEASE \
    -DgroupId="$PROJECT_GROUP_ID" \
    -DartifactId="$PROJECT_ARTIFACT_ID" \
    -Dversion="$PROJECT_VERSION"
```

#### Goals (Lifecycle/Super POM)

| Command | Description |
| --- | --- |
| `mvn clean` | TODO |
| `mvn validate` | Check if all information necessary for the build is available |
| `mvn compile` | Compile the source code |
| `mvn test-compile` | Compile the test source code |
| `mvn test` | Run unit tests |
| `mvn package` | Package compiled source code into the distributable format (jar, war, …) |
| `mvn verify` | |
| `mvn integration-test` | Process and deploy the package if needed to run integration tests |
| `mvn install` | Install the package to a local repository (`~/.m2/repository`) |
| `mvn site` | |
| `mvn deploy` | Copy the package to the remote repository |

<!-- clean, compile, test, package, install, deploy -->

#### Phases

|  | Description |
| --- | --- |
| `validate` | |
| `compile` | |
| `test` | |
| `package` | |
| `integration-test` | |
| `verify` | |
| `install` | |
| `deploy` | |

<!-- mvn site -->

### Tips

<!-- ####

1. Move `properties` and `dependencyManagement`
2. Remove `groupId` and `version`

```xml
<parent>
  <groupId>org.acme.app</groupId>
  <artifactId>[parent-name]</artifactId>
  <version>0.0.1-SNAPSHOT</version>
</parent>
<artifactId>[module-name]</artifactId>
```

3. Run `mvn clean package -DskipTests` -->

#### Local Repository

Change `settings.xml`:

```xml
<!-- ... -->
<localRepository>[/absolute/path/to/.m2/repository]</localRepository>
<!-- ... -->
```

```sh
mvn install \
  -DlocalRepositoryPath=[/absolute/path/to/.m2/repository]
```

<!-- #### Super POM

```sh
$MAVEN_HOME/lib/maven-model-builder-3.3.3.jar - org/apache/maven/model/pom-4.0.0.xml
``` -->

#### Scopes

| Name | Description |
| --- | --- |
| `compile` | |
| `provided` | |
| `runtime` | |
| `test` | |
| `system` | |
| `import` | |

#### Packaging Types

| Type | Meaning |
| --- | --- |
| `pom` | Project Object Model |
| `jar` (default) | Java ARchive |
| `war` | Web Application Resource |
| `ear` | Enterprise Application aRchive |
| `maven-plugin` | Maven Plugin |

#### Version Conventions

| Name Convention | Short Description |
| --- | --- |
| `myapp-1.0-SNAPSHOT.jar` | Snapshot |
| `myapp-1.0-M1.jar` | Milestone |
| `myapp-1.0-RC1.jar` | Release Candidate |
| `myapp-1.0-RELEASE.jar` | Release |
| `myapp-1.0-Final.jar` | Final |


#### Chose Profile

```sh
#
mvn clean install -P [name]
```

<!-- ####

```sh
#
mvn install:install-file \
  -DgroupId=<your_group_name> \
  -DartifactId=<your_artifact_name> \
  -Dversion=<version> \
  -Dfile=<path_to_your_jar_file> \
  -Dpackaging=jar \
  -DgeneratePom=true

#
mvn org.apache.maven.plugins:maven-dependency-plugin:get \
  -Dartifact=org.codehaus.sonar:sonar:4.2

mvn org.apache.maven.plugins:maven-dependency-plugin:get \
  -Dartifact=groupId:artifactId:version

mvn org.apache.maven.plugins:maven-dependency-plugin:get \
  -Dartifact=io.cresco:logger:1.1-SNAPSHOT

# mvn org.apache.maven.plugins:maven-dependency-plugin:3.1.0:go-offline -s /tools/m2/settings.xml

# mvn org.apache.maven.plugins:maven-install-plugin:2.5.1:install-file [/path/to/file.jar]
``` -->

#### ProxyChains

```sh
proxychains -q mvn install
```

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

<!-- ####

```log
[WARNING] Some problems were encountered while building the effective model for org.acme.app:auth:jar:0.0.1-SNAPSHOT
[WARNING] 'build.plugins.plugin.(groupId:artifactId)' must be unique but found duplicate declaration of plugin org.apache.maven.plugins:maven-compiler-plugin @ line 113, column 15
[WARNING]
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING]
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
```

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-compiler-plugin</artifactId>
  <version>${compiler-plugin.version}</version>
  <configuration>
    <parameters>${maven.compiler.parameters}</parameters>
    <source>1.8</source>
    <target>1.8</target>
    <annotationProcessorPaths>
      <path>
        <groupId>org.mapstruct</groupId>
        <artifactId>mapstruct-processor</artifactId>
        <version>${org.mapstruct.version}</version>
      </path>
    </annotationProcessorPaths>
    <showWarnings>true</showWarnings>
    <compilerArgs>
      <arg>
        -Amapstruct.suppressGeneratorTimestamp=true
      </arg>
      <arg>
        -Amapstruct.suppressGeneratorVersionInfoComment=true
      </arg>
      <arg>
        -Amapstruct.verbose=true
      </arg>
    </compilerArgs>
  </configuration>
</plugin>
``` -->

<!-- ####

```sh
proxychains wget http://hostname/repo/[groupId]/[artifactId]/[version].jar
``` -->

#### ProxyChains Issue

```log
[ERROR]   The project [groupId]:[artifactId]:[version] (/absolute/path/to/project/pom.xml) has 1 error
[ERROR]     Non-resolvable parent POM: Could not transfer artifact [groupId]:[artifactId]:[version] from/to [repository] (http://hostname/repo): Connection to http://hostname refused and 'parent.relativePath' points at wrong local POM @ line 6, column 10: Connection refused (Connection refused) -> [Help 2]
```

Try, at first time, not use [ProxyChains-NG](/proxychains-ng.md).

####

```log
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-dependency-plugin:2.4:get (default-cli) on project big-plataforma-api: Couldn't download artifact: Unable to get dependency information for org.codehaus.sonar:sonar:jar:4.2: Failed to retrieve POM for org.codehaus.sonar:sonar:jar:4.2: Could not transfer artifact org.codehaus.sonar:sonar:pom:4.2 from/to central (http://repo.maven.apache.org/maven2): Failed to transfer file: http://repo.maven.apache.org/maven2/org/codehaus/sonar/sonar/4.2/sonar-4.2.pom. Return code is: 501, ReasonPhrase:HTTPS Required.
```

```xml
<mirror>
    <id>maven-mirror</id>
    <name>Maven Mirror</name>
    <url>https://repo.maven.apache.org/maven2</url>
    <mirrorOf>central</mirrorOf>
</mirror>
```

<!-- #### Repository Release Update Policy

```xml
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
  // ...
  <profiles>
    <profile>
      <repositories>
        <repository>
          // ...
          <releases>
            <enabled>true</enabled>
            <updatePolicy>never</updatePolicy>
          </releases>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          // ...
          <releases>
            <enabled>true</enabled>
            <updatePolicy>never</updatePolicy>
          </releases>
        </pluginRepository>
    </profile>
  </profiles>
  // ...
</settings>
``` -->

#### Valid Certificate

```log
javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

[Export Web Self-signed Certificate](/openssl.md#export-web-self-signed-certificate).

```sh
sudo mkdir -p "$JAVA_HOME/lib/security"

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

####

```log
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.1:compile (default-compile) on project [project-name]: Fatal error compiling: invalid target release: 1.8 -> [Help 1]
```

TODO

#### Incompatible Version

```log
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings (gerar-effective-settings) on project [app-name]: Execution gerar-effective-settings of goal org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings failed: An API incompatibility was encountered while executing org.apache.maven.plugins:maven-help-plugin:2.1.1:effective-settings: java.lang.NoSuchMethodError: org.apache.maven.settings.Settings.getRuntimeInfo()Lorg/apache/maven/settings/RuntimeInfo;
```

```sh
# Downgrade Apache Maven to version 3.0.4
echo 'mvn_version=3.0.4' > mvnvm.properties

mvn clean
mvn install
```

#### Unknown host

```log
[ERROR] Failed to execute goal org.codehaus.mojo:xml-maven-plugin:1.0:validate (validar-pom.xml) on project [project-name]: Failed to load schema with public ID null, system ID https://[hostname]/xsd/maven-4.0.0.xsd: [hostname]: Unknown host [hostname] -> [Help 1]
```

Use [ProxyChains](/proxychains-ng.md)

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

<!--
## Interview

https://www.youtube.com/watch?v=5iTcAR4fScM
https://www.youtube.com/watch?v=t86YyNdDz0w
https://www.youtube.com/watch?v=pK-kXMYoVA4
-->
