# Gradle

**Keywords:** Build Automation Tool

## Plugins

- [Nebula](https://nebula-plugins.github.io/)

## Build-in

### Commands

```sh
./gradlew -h
```

### Usage

```sh
#
./gradlew clean

#
./gradlew build -Dbuild.linux=true
./gradlew build -Dbuild.macos=true
```

<!--
./gradlew checkstyleMain checkstyleTest
-->

## CLI

### Installation

#### Homebrew

```sh
brew install gradle
# brew install gradle@6
```

#### Chocolatey

```sh
choco install -y gradle
```

### Commands

```sh
gradle -h
```

### Usage

```sh
#
gradle tasks

#
gradle clean -p ./

#
gradle build

#
gradle run
```

### Tips

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.gradle]
indent_size = 4
EOF
```

#### Remove Cache

```sh
rm -fR "$HOME"/.gradle/caches
```

#### Proxy

| Property              | Description |
| --------------------- | ----------- |
| `http.proxyUser`      |             |
| `http.proxyPassword`  |             |
| `https.proxyUser`     |             |
| `https.proxyPassword` |             |

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

### Issues

#### TBD

```log
org.gradle.api.GradleScriptException: A problem occurred evaluating project ':app'.
        ...
Caused by: java.lang.NullPointerException: Cannot invoke method split() on null object
        ...
```

TODO

#### TBD

```log
The server may not support the client's requested TLS protocol versions: (TLSv1.2). You may need to configure the client to allow other protocols to be used. See: https://docs.gradle.org/7.6-rc-4/userguide/build_environment.html#gradle_system_properties
```

TODO

### Uninstall

```sh
# Homebrew
brew uninstall gradle

rm -fR ~/.gradle
```
