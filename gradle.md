# Gradle

## CLI

### Installation

#### Homebrew

```sh
brew install gradle
```

#### Chocolatey

```sh
choco install -y gradle
```

### Commands

```sh
gradle -h
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
export GRADLE_HTTP_PROXY_HOST="$ZSH_PROXY_HOST"
export GRADLE_HTTP_PROXY_PORT="$ZSH_PROXY_PORT"
export GRADLE_HTTP_NON_PROXY_HOSTS='localhost|127.0.0.1'

# Option 1: CLI
gradle \
  -Dhttp.proxyHost="$GRADLE_HTTP_PROXY_HOST"  \
  -Dhttp.proxyPort="$GRADLE_HTTP_PROXY_PORT" \
  -Dhttp.nonProxyHosts="$GRADLE_HTTP_NON_PROXY_HOSTS" \
  -Dhttps.proxyHost="$GRADLE_HTTP_PROXY_HOST"  \
  -Dhttps.proxyPort="$GRADLE_HTTP_PROXY_PORT" \
  -Dhttps.nonProxyHosts="$GRADLE_HTTP_NON_PROXY_HOSTS" \
  [command]

# Option 2: Environment
export GRADLE_OPTS="\
  -Dhttp.proxyHost=$GRADLE_HTTP_PROXY_HOST \
  -Dhttp.proxyPort=$GRADLE_HTTP_PROXY_PORT \
  -Dhttp.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS \
  -Dhttps.proxyHost=$GRADLE_HTTP_PROXY_HOST \
  -Dhttps.proxyPort=$GRADLE_HTTP_PROXY_PORT \
  -Dhttps.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS \
"

# Option 3: Globally
mkdir -p ~/.gradle

cat << EOF > ~/.gradle/gradle.properties
systemProp.proxySet="true"

systemProp.http.keepAlive="true"
systemProp.http.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.http.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.http.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS

systemProp.https.keepAlive="true"
systemProp.https.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.https.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.https.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS
EOF

# Option 4: Wrapper
cat << EOF | sudo tee /path/to/gradle/wrapper/gradle-wrapper.properties
systemProp.proxySet="true"

systemProp.http.keepAlive="true"
systemProp.http.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.http.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.http.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS

systemProp.https.keepAlive="true"
systemProp.https.proxyHost=$GRADLE_HTTP_PROXY_HOST
systemProp.https.proxyPort=$GRADLE_HTTP_PROXY_PORT
systemProp.https.nonProxyHosts=$GRADLE_HTTP_NON_PROXY_HOSTS
EOF
```

#### Limited Home Disk

```sh
mkdir -p /tmp/.gradle
```

```sh
ln -s /tmp/.gradle ~/.gradle
```

After finish, remove.

```sh
rm -r ~/.gradle
```

### Uninstall

```sh
# Homebrew
brew uninstall gradle

rm -fR ~/.gradle
```
