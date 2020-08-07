# Apache Maven

## CLI

### Installation

#### Homebrew

```sh
brew install maven
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

### Commands

```sh
mvn -h
```

### Usage

```sh
#
mvn install

#
mvn package
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

### Uninstall

```sh
# Homebrew
brew uninstall maven

rm -fR ~/.m2
```
