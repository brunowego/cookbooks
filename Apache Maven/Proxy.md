# Proxy

## Clean repository

```sh
rm -r ~/.m2/repository
```

## Pre-flight

```sh
export MAVEN_HTTP_PROXY_HOST=
export MAVEN_HTTP_PROXY_PORT=
export MAVEN_HTTP_PROXY_USERNAME=
export MAVEN_HTTP_PROXY_PASSWORD=
export MAVEN_HTTP_NON_PROXY_HOSTS="localhost|127.0.0.1"
```

## CLI

```sh
mvn \
  -Dhttp.proxyHost=$MAVEN_HTTP_PROXY_HOST  \
  -Dhttp.proxyPort=$MAVEN_HTTP_PROXY_PORT \
  -Dhttp.proxyUser=$MAVEN_HTTP_PROXY_USERNAME \
  -Dhttp.proxyPassword=$MAVEN_HTTP_PROXY_PASSWORD \
  -Dhttp.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS \
  -Dhttps.proxyHost=$MAVEN_HTTP_PROXY_HOST  \
  -Dhttps.proxyPort=$MAVEN_HTTP_PROXY_PORT \
  -Dhttps.proxyUser=$MAVEN_HTTP_PROXY_USERNAME \
  -Dhttps.proxyPassword=$MAVEN_HTTP_PROXY_PASSWORD \
  -Dhttps.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS \
  [command]
```

## Environment

```sh
export MAVEN_OPTS="-Dhttp.proxyHost=$MAVEN_HTTP_PROXY_HOST -Dhttp.proxyPort=$MAVEN_HTTP_PROXY_PORT -Dhttp.proxyUser=$MAVEN_HTTP_PROXY_USERNAME -Dhttp.proxyPassword=$MAVEN_HTTP_PROXY_PASSWORD -Dhttp.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS -Dhttps.proxyHost=$MAVEN_HTTP_PROXY_HOST -Dhttps.proxyPort=$MAVEN_HTTP_PROXY_PORT -Dhttps.proxyUser=$MAVEN_HTTP_PROXY_USERNAME -Dhttps.proxyPassword=$MAVEN_HTTP_PROXY_PASSWORD -Dhttps.nonProxyHosts=$MAVEN_HTTP_NON_PROXY_HOSTS"
```

## Properties

```sh
mkdir -p ~/.m2
```

```sh
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
			<username>$MAVEN_HTTP_PROXY_USERNAME</username>
			<password>$MAVEN_HTTP_PROXY_PASSWORD</password>
			<nonProxyHosts>$MAVEN_HTTP_NON_PROXY_HOSTS</nonProxyHosts>
		</proxy>
		<proxy>
			<id>https</id>
			<active>true</active>
			<protocol>https</protocol>
			<host>$MAVEN_HTTP_PROXY_HOST</host>
			<port>$MAVEN_HTTP_PROXY_PORT</port>
			<username>$MAVEN_HTTP_PROXY_USERNAME</username>
			<password>$MAVEN_HTTP_PROXY_PASSWORD</password>
			<nonProxyHosts>$MAVEN_HTTP_NON_PROXY_HOSTS</nonProxyHosts>
		</proxy>
	</proxies>
</settings>
EOF
```

> Global path is `/usr/share/maven/conf/settings.xml`.
