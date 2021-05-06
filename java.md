# Java

<!--
https://www.linkedin.com/learning/calling-rest-apis-with-java/restful-apis-in-java-application-architectures

https://learn.oracle.com/ols/home/java-25th-anniversary-learning-subscription/82508

https://app.pluralsight.com/paths/skill/java

https://app.pluralsight.com/paths/skill/java-ee-foundations

https://www.linkedin.com/learning/search?keywords=eclipselink

https://app.pluralsight.com/library/courses/java-persistence-api-21/table-of-contents

JDBC
Swing
Spring Framework
JUnit
Facelets
HttpClient


Enterprise Information Systems Tier
-->

## References

- Oracle Certified Professional (OCP)
- [Java Standard Edition (SE) - Java Development Toolkit (JDK)](/java-se.md)
- [Java Enterprise Edition (EE)](/java-ee.md)
- Java Micro Edition (ME)
- JavaFX (EFF-ECTS)
- WebProfile
- MicroProfile
- [jabba](/jabba.md)
- [Checkstyle (Linter)](/checkstyle.md)
- [Java formatting and linting](https://code.visualstudio.com/docs/java/java-linting)

## Terms

- Plain old Java object (POJO)

## Exams

- [Java SE 11 Developer - Exam Number: 1Z0-819](education.oracle.com/x/pexam_1Z0-819)

## Glossary

- Java ARchive (JAR)
- Java Development Kit (JDK)
- Java Persistence Query Language (JPQL)
- Java Runtime Environment (JRE)

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
# Java Version
java -version 2>&1

# Java Compiler Version
javac -version 2>&1

#
# java -jar './path/to/file.war'
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension vscjava.vscode-java-pack

#
code --install-extension redhat.fabric8-analytics
```

```sh
# Darwin
/usr/libexec/java_home -V

# Linux/Darwin
jq ".\"java.home\" |= \"$(dirname $(dirname $(readlink -f $(which java))))\"" "$PWD/.vscode/settings.json" | sponge "$PWD/.vscode/settings.json"

jq '."java.project.importOnFirstTimeStartup" |= "automatic"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

<!-- ```sh
code './.vscode/settings.json'
```

```json
{
  "files.exclude": {
    "**/.classpath": true,
    "**/.project": true,
    "**/.settings": true,
    "**/.factorypath": true
  },
  "java.configuration.updateBuildConfiguration": "automatic"
}
``` -->

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension vscjava.vscode-java-pack
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
[*.java]
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

### Issues

#### Strict Compatible JRE

```log
Build path specifies execution environment JavaSE-11. There are no JREs installed in the workspace that are strictly compatible with this environment.

The compiler compliance specified is 11 but a JRE 15 is used
```

```sh
code "$HOME/.config/Code/User/settings.json"
```

```json
{
  // ...
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-1.7",
      "path": "/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
    },
    {
      "name": "JavaSE-11",
      "path": "/Library/Java/JavaVirtualMachines/jdk-11.0.11.jdk/Contents/Home",
      "default": true
    }
  ]
}
```

#### Java Home Environment

```log
Failed to create the Java Virtual Machine.
```

<!--
https://www.pushing-pixels.org/2020/06/19/fixing-the-failed-to-create-the-java-virtual-machine-error-on-eclipse-startup-on-a-mac.html
-->

```sh
# Linux
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"

#
open /Applications/ApacheDirectoryStudio.app
```
