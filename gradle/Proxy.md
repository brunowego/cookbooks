# Proxy

## Pre-flight

```sh
export GRADLE_HTTP_PROXY_HOST=
export GRADLE_HTTP_PROXY_PORT=
export GRADLE_HTTP_PROXY_USERNAME=
export GRADLE_HTTP_PROXY_PASSWORD=
export GRADLE_HTTP_NON_PROXY_HOSTS="localhost|127.0.0.1"
```

## CLI

```sh
gradle \
  -Dhttp.proxyHost=$GRADLE_HTTP_PROXY_HOST  \
  -Dhttp.proxyPort=$GRADLE_HTTP_PROXY_PORT \
  -Dhttp.proxyUser=$GRADLE_HTTP_PROXY_USERNAME \
  -Dhttp.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD \
  -Dhttp.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS \
  -Dhttps.proxyHost=$GRADLE_HTTP_PROXY_HOST  \
  -Dhttps.proxyPort=$GRADLE_HTTP_PROXY_PORT \
  -Dhttps.proxyUser=$GRADLE_HTTP_PROXY_USERNAME \
  -Dhttps.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD \
  -Dhttps.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS \
  [command]
```

## Environment

```sh
export GRADLE_OPTS="-Dhttp.proxyHost=$GRADLE_HTTP_PROXY_HOST -Dhttp.proxyPort=$GRADLE_HTTP_PROXY_PORT -Dhttp.proxyUser=$GRADLE_HTTP_PROXY_USERNAME -Dhttp.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD -Dhttp.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS -Dhttps.proxyHost=$GRADLE_HTTP_PROXY_HOST -Dhttps.proxyPort=$GRADLE_HTTP_PROXY_PORT -Dhttps.proxyUser=$GRADLE_HTTP_PROXY_USERNAME -Dhttps.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD -Dhttps.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS"
```

## Properties

### Global

```sh
mkdir -p ~/.gradle
```

```sh
tee ~/.gradle/gradle.properties << EOF
systemProp.proxySet="true"

systemProp.http.keepAlive="true"
systemProp.http.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.http.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.http.proxyUser=$GRADLE_HTTP_PROXY_USERNAME
systemProp.http.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD
systemProp.http.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS

systemProp.https.keepAlive="true"
systemProp.https.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.https.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.https.proxyUser=$GRADLE_HTTP_PROXY_USERNAME
systemProp.https.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD
systemProp.https.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS
EOF
```

### Wrapper

```sh
sudo tee /path/to/gradle/wrapper/gradle-wrapper.properties << EOF
systemProp.proxySet="true"

systemProp.http.keepAlive="true"
systemProp.http.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.http.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.http.proxyUser=$GRADLE_HTTP_PROXY_USERNAME
systemProp.http.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD
systemProp.http.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS

systemProp.https.keepAlive="true"
systemProp.https.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.https.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.https.proxyUser=$GRADLE_HTTP_PROXY_USERNAME
systemProp.https.proxyPassword=$GRADLE_HTTP_PROXY_PASSWORD
systemProp.https.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS
EOF
```
