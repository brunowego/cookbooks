# Oracle WebLogic Server (WLS)

## References

- [Standards support by version](https://en.wikipedia.org/wiki/Oracle_WebLogic_Server#Standards_support_by_version)

## Docker

Checkout [developer tier](https://hub.docker.com/_/oracle-weblogic-server-12c) before continue.

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h weblogic \
  -p 7001:7001 \
  --name weblogic \
  --network workbench \
  docker.io/store/oracle/weblogic:12.2.1.2
```

<!--
https://github.com/markxnelson/legacy-license-plates/blob/8a05b5ddafc794ab620049807e4900877f007e5f/README.md
-->

> Wait! This process take a while.

```sh
#
docker logs weblogic | grep 'password'

#
echo -e '[INFO]\thttp://127.0.0.1:7001/console'
```

### Remove

```sh
docker rm -f weblogic

rm -fR ./properties
```

## CLI

### Installation

#### JAR

<!-- ##### 12.1.x

1. [Free Oracle WebLogic Server Installers for Development](https://www.oracle.com/middleware/technologies/weblogic-server-downloads.html)
2. Find Oracle WebLogic Server 12.1.3 -> Mac OS X with 32-bit JVM

```sh
unzip /path/to/wls1213_dev_update3.zip

export WEBLOGIC_MIDDLEWARE_HOME='/opt/oracle/weblogic/middleware'

sudo mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME"

(cd "$WEBLOGIC_MIDDLEWARE_HOME" && java -jar /absolute/path/to/fmw_12.2.1.3.0_wls_quick.jar)
``` -->

##### 12.2.x

1. [Free Oracle WebLogic Server Installers for Development](https://www.oracle.com/middleware/technologies/weblogic-server-downloads.html)
2. Find Oracle WebLogic Server 12.2.1.3 -> Quick Installer for Mac OSX, Windows and Linux
   - Accept the terms
   - Click in Download button

```sh
#
unzip /absolute/path/to/fmw_12.2.1.3.0_wls_quick_Disk1_1of1.zip

#
export WEBLOGIC_MIDDLEWARE_HOME='/opt/oracle/weblogic/middleware'

#
sudo mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME" && cd "$_"

sudo chown "$USER" "$WEBLOGIC_MIDDLEWARE_HOME/../"

#
java -jar /absolute/path/to/fmw_12.2.1.3.0_wls_quick.jar

#
export USER_MEM_ARGS='-Xmx1024m -XX:MaxPermSize=256m'

#
source "$WEBLOGIC_MIDDLEWARE_HOME/wls12213/wlserver/server/bin/setWLSenv.sh"

#
cd "$WEBLOGIC_MIDDLEWARE_HOME/../"

#
sudo mkdir -p domain && cd "$_"

#
java -Xmx1024m -XX:MaxPermSize=256m weblogic.Server

#
echo -e '[INFO]\thttp://127.0.0.1:7001/console'
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# WLS Domain
export WEBLOGIC_DOMAIN_HOME='/opt/oracle/weblogic/domain'
```

```sh
sudo su - "$USER"
```

### Running

```sh
# Start WebLogic
$WEBLOGIC_DOMAIN_HOME/startWebLogic.sh
```

### Docs

#### Add Library

```sh
# Libs
wget \
  -P '/opt/oracle/weblogic/domain/lib' \
  --content-disposition \
  --no-check-certificate \
  'https://[domain]/path/to/lib.jar'
```

### Issues

#### OpenJDK Not Supported

```log
The OpenJDK JVM is not supported on this platform.
```

OpenJDK is not listed within the [Oracle Fusion Middleware Supported System Configurations](https://www.oracle.com/middleware/technologies/fusion-certification.html).

Install [Oracle JDK](/oracle-jdk.md)
