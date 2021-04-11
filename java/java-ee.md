# Java Enterprise Edition (EE)

Superset of Java SE.

## Reverences

- [Java Persistence API (JPA)](/jpa.md)
- Jakarta Server Faces (JSF)

## Specification

- [Java EE 7 - JSR 342](https://www.jcp.org/en/jsr/detail?id=342)
- [Java EE 8 - JSR 366](https://www.jcp.org/en/jsr/detail?id=366)

<!--
https://app.pluralsight.com/paths/skills/java-ee-foundations

https://www.linkedin.com/learning/search?entityType=COURSE&keywords=Jakarta%20EE
-->

## Java Development Toolkit (JDK)

### Installation

#### DMG

##### Version 7

1. [Java Platform, Enterprise Edition 7 SDK (with JDK 7u21)](https://www.oracle.com/java/technologies/java-ee-sdk-7-jdk-7u21-downloads.html)
   - Click `java_ee_sdk-7-jdk7-macosx-x64-ml.sh`
   - Accept the terms
   - Click in Download button

```sh
export DISPLAY=:0

#
chmod +x ./java_ee_sdk-7-jdk7-macosx-x64-ml.sh

#
./java_ee_sdk-7-jdk7-macosx-x64-ml.sh
```

### Issues

#### Unknown Host Exception

```log
Bad Network Configuration.  DNS can not resolve the hostname:
java.net.UnknownHostException: [hostname]: [hostname]: nodename nor servname provided, or not known
```

```sh
sudo hostess add "$(hostname)" 127.0.0.1
```

<!-- ####

```log
JVM failed to start: java.io.IOException: Cannot run program "/usr/libexec/StartupItemContext" (in directory "~/.glassfish4/glassfish/domains/domain1/config"): error=2, No such file or directory
```

TODO -->

<!-- ```sh
sudo touch /usr/libexec/StartupItemContext
cat << \EOF | sudo tee /usr/libexec/StartupItemContext
#! /bin/sh
unset LAUNCHD_SOCKET
exec launchctl bsexec / "$@"
EOF

chown +x /usr/libexec/StartupItemContext

sudo ln -s /bin/bash /usr/libexec/StartupItemContext
``` -->
