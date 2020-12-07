# Java

<!--
JavaBeans
Hibernate
Spring Framework
-->

## References

- [Java SE - JDK](/java-se-jdk.md)

## Distributions

- [AdoptOpenJDK](https://adoptopenjdk.net/)
- [Amazon Corretto](https://aws.amazon.com/pt/corretto/)
- [GraalVM (Graal) and GraalVM Community Edition (CE) ](https://www.graalvm.org/downloads/)
- [Liberica JDK](https://bell-sw.com/pages/downloads/)
- [OpenJDK](https://openjdk.java.net/)
- [Zulu OpenJDK](https://www.azul.com/downloads/zulu-community/)

## Tooling

- [Apache Maven](/apache_maven.md)
- [Apache Tomcat](/apache_tomcat.md)
- [GlassFish](/glassfish.md)
- [IBM WebSphere](/ibm_websphere.md)
- [Jetty Runner](/jetty-runner.md)
- [Oracle WebLogic Server (WLS)](/weblogic.md)
- [WildFly (JBoss Application Server)](/wildfly.md)

## CLI

### Installation

#### Darwin

- [Download Java for Mac OS X](https://java.com/en/download/mac_download.jsp)

### Configuration

```sh
# Git ignore
echo '/*.jar' >> ~/.gitignore_global
```

### Usage

```sh
# Version
java -version 2>&1 | tail -1
javac -version 2>&1 | tail -1

#
java -jar './path/to/file.war'
```

### Tips

#### Visual Studio Code

```sh
code --install-extension vscjava.vscode-java-pack
```

#### Get Manifest

```sh
jar tvf [filename].jar
```

<!-- ####

"java.server.launchMode": "LightWeight"
  "java.configuration.checkProjectSettingsExclusions": false -->

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.{java,xml}]
indent_size = 4
max_line_length = 100

EOF
```

<!-- ####

```sh
jar -xvf ./target/[name].war

cd WEB-INF

java -classpath 'lib/*:classes/.' [yourpackage.YourClassName]
``` -->

#### Visual Studio Code

```sh
code --install-extension vscjava.vscode-java-pack
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension vscjava.vscode-java-pack
```

### Issues

#### Java Home Environment

```log
Failed to create the Java Virtual Machine.
```

<!--
https://www.pushing-pixels.org/2020/06/19/fixing-the-failed-to-create-the-java-virtual-machine-error-on-eclipse-startup-on-a-mac.html
-->

```sh
#
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"

#
open /Applications/ApacheDirectoryStudio.app
```
