<!--
https://stackoverflow.com/questions/20567909/remote-weblogic-server-identity-exception
-->

# Oracle WebLogic Server (WLS)

## References

- [Standards support by version](https://en.wikipedia.org/wiki/Oracle_WebLogic_Server#Standards_support_by_version)
- [EclipseLink](/eclipselink.md)

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

## Host

### Dependencies

#### 12.1.x

- [Apache Ant](/apache/ant.md)
- Java SE 7

### Installation

#### 12.1.x

1. [Free Oracle WebLogic Server Installers for Development](https://www.oracle.com/middleware/technologies/weblogic-server-downloads.html)
2. Find Oracle WebLogic Server 12.1.3 -> Zip distribution Update 3 for Mac OSX, Windows, and Linux
   - Accept the terms
   - Click in Download button

```sh
# Linux/Darwin
export WEBLOGIC_MIDDLEWARE_HOME='/opt/oracle/weblogic/12.1.3/middleware'

#
sudo mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME"

#
sudo chown -R "$USER" "$WEBLOGIC_MIDDLEWARE_HOME/../"

# Darwin/Extract all files
unzip ~/Downloads/wls1213_dev_update3.zip -d "$WEBLOGIC_MIDDLEWARE_HOME"

# Remove files
rm ~/Downloads/wls1213_dev_update3.zip
```

#### 12.2.x

1. [Free Oracle WebLogic Server Installers for Development](https://www.oracle.com/middleware/technologies/weblogic-server-downloads.html)
2. Find Oracle WebLogic Server 12.2.1.4 -> Quick Installer for Mac OSX, Windows and Linux
   - Accept the terms
   - Click in Download button

```sh
# Linux/Darwin
export WEBLOGIC_MIDDLEWARE_HOME='/opt/oracle/weblogic/12.2.1.4/middleware'

#
sudo mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME"

#
sudo chown -R "$USER" "$WEBLOGIC_MIDDLEWARE_HOME/../"

# Darwin
unzip ~/Downloads/fmw_12.2.1.4.0_wls_quick_Disk1_1of1.zip -d "$WEBLOGIC_MIDDLEWARE_HOME"

# Darwin
/usr/libexec/java_home -V
jabba current # min version is Java 1.8

# Extract all files
( cd "$WEBLOGIC_MIDDLEWARE_HOME" && java -jar "$WEBLOGIC_MIDDLEWARE_HOME"/fmw_12.2.1.4.0_wls_quick.jar )

# Darwin/Remove files
rm ~/Downloads/fmw_12.2.1.4.0_wls_quick_Disk1_1of1.zip
rm -f "$WEBLOGIC_MIDDLEWARE_HOME"/fmw_*
rm -fR ~/oraInventory
```

### Bootstrap

<!-- ```sh
#
export USER_MEM_ARGS='-Xmx1024m -XX:MaxPermSize=256m'
``` -->

#### 12.1.x

```sh
# Darwin
/usr/libexec/java_home -V
jabba current # min version is Java 1.8

#
"$WEBLOGIC_MIDDLEWARE_HOME"/wls12130/configure.sh -silent

#
export MW_HOME="$WEBLOGIC_MIDDLEWARE_HOME/wls12130"

#
source "$WEBLOGIC_MIDDLEWARE_HOME"/wls12130/wlserver/server/bin/setWLSEnv.sh

#
mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME"/../mydomain

#
( cd "$WEBLOGIC_MIDDLEWARE_HOME"/../mydomain && java -Xmx1024m -XX:MaxPermSize=256m weblogic.Server )
```

- Would you like the server to create a default configuration and boot? y
- Enter username to boot WebLogic server: admin
- Enter username to boot WebLogic server: PaSSw0rd!

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:7001/console'
```

#### 12.2.x

```sh
#
source "$WEBLOGIC_MIDDLEWARE_HOME"/wls12214/wlserver/server/bin/setWLSenv.sh

#
mkdir -p "$WEBLOGIC_MIDDLEWARE_HOME"/../mydomain

#
( cd "$WEBLOGIC_MIDDLEWARE_HOME"/../mydomain && java -Xmx1024m -XX:MaxPermSize=256m weblogic.Server )
```

- Would you like the server to create a default configuration and boot? y
- Enter username to boot WebLogic server: admin
- Enter username to boot WebLogic server: PaSSw0rd!

```sh
#
echo -e '[INFO]\thttp://127.0.0.1:7001/console'
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

#### 12.1.x

```sh
# WLS Domain
export WEBLOGIC_DOMAIN_HOME='/opt/oracle/weblogic/12.1.3/mydomain'
export EXTRA_JAVA_PROPERTIES="-Duser.language=en -Duser.country=US ${EXTRA_JAVA_PROPERTIES}"
```

```sh
sudo su - "$USER"
```

#### 12.2.x

```sh
# WLS Domain
export WEBLOGIC_DOMAIN_HOME='/opt/oracle/weblogic/12.2.1.4/mydomain'
export EXTRA_JAVA_PROPERTIES="-Duser.language=en -Duser.country=US ${EXTRA_JAVA_PROPERTIES}"
```

```sh
sudo su - "$USER"
```

### Running

#### 12.1.x

```sh
# Start WebLogic
"$WEBLOGIC_DOMAIN_HOME"/startWebLogic.sh

# Stop WebLogic
pkill java
```

#### 12.2.x

```sh
# Start WebLogic
"$WEBLOGIC_DOMAIN_HOME"/startWebLogic.sh

# Stop WebLogic
"$WEBLOGIC_DOMAIN_HOME"/stopWebLogic.sh
```

### Docs

#### Origem de Dados Genérica (PT-BR)

1. Serviços
2. Origens de Dados
3. Novo -> Origem de Dados Genérica
   - Nome: jdbc/\[app-name]
   - Nome da JNDI: jdbc/\[app-name]
   - Tipo de Banco de Dados: MySQL
   - Próximo
   - Driver de Banco de Dados: MySQL's Driver (Type 4) Versions:using com.mysql.jdbc.Driver
   - Próximo
   - \[x] Suporta Transações Globais
   - \[x] Commit de Uma Fase
   - Próximo
   - Nome do Banco de Dados:
   - Nome do Host:
   - Nome do Usuário do Banco de Dados:
   - Senha:
   - Próximo
   - Testar Configuração
   - Próximo
   - Selecionar Alvos -> \[x] myserver
   - Finalizar

#### Implantar (PT-BR)

1. Implantações
2. Instalar
   - Caminho: /absolute/path/to/target
   - Select WAR file
   - Próximo
   - \[x] Instalar esta implantação como um aplicativo
   - Próximo
   - Próximo
   - Finalizar

#### Add Library

```sh
# Libs
wget \
  -P '/opt/oracle/weblogic/mydomain/lib' \
  --content-disposition \
  --no-check-certificate \
  'https://[domain]/path/to/lib.jar'
```

### Issues

#### Change Admin Password

<!-- ```sh
#
export MW_HOME="$WEBLOGIC_MIDDLEWARE_HOME/wls12130"

#
source "$WEBLOGIC_MIDDLEWARE_HOME"/wls12130/wlserver/server/bin/setWLSenv.sh

#
( cd "$WEBLOGIC_MIDDLEWARE_HOME"/../mydomain/servers/myserver/security && java weblogic.security.utils.AdminAccount admin PaSSw0rd! ./ )
``` -->

#### OpenJDK Not Supported

```log
The OpenJDK JVM is not supported on this platform.
```

OpenJDK is not listed within the [Oracle Fusion Middleware Supported System Configurations](https://www.oracle.com/middleware/technologies/fusion-certification.html).

Install [Oracle JDK](/oracle-jdk.md)

### Uninstall

```sh
# For 12.1.x
sudo rm -fR /opt/oracle/weblogic/12.1.3

# For 12.2.x
sudo rm -fR /opt/oracle/weblogic/12.2.1.4
```
