# Leiningen

<!--
https://stackoverflow.com/questions/33135667/can-i-make-lein-ring-server-headless-run-on-a-specific-servlet-context
-->

## Docker

### Running

```sh
# REPL
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h clojure \
  --name clojure \
  docker.io/library/clojure:openjdk-8-lein
```

## CLI

### Installation

#### Homebrew

```sh
brew install leiningen
```

### Commands

```sh
lein help
```

### Usage

```sh
# Version
lein -v

# REPL
lein repl

pkill java
```

<!-- ### Tips

####

```sh

``` -->

### Issues

#### Behind Corporate Proxy

```sh
This could be due to a typo in :dependencies, file system permissions, or network issues.
If you are behind a proxy, try setting the 'http_proxy' environment variable.
Could not resolve dependencies
```

```sh
keytool -importcert \
  -noprompt \
  -trustcacerts \
  -alias 'company-root-ca' \
  -file '/etc/ssl/certs/company/root-ca.crt' \
  -keystore "$JAVA_HOME/jre/lib/security/cacerts" \
  -storepass changeit
```
