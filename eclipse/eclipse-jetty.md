# Eclipse Jetty

**Keywords:** Servlet engine, Webserver

## Guides

- [HTTP/2 in Jetty](https://www.baeldung.com/jetty-http-2)

## CLI

### Installation

#### Homebrew

```sh
brew install jetty
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Eclipse Jetty
export JETTY_HOME="$(brew --prefix jetty)/libexec"
```

### Modules

```sh
# List available modules
java \
  -jar "$JETTY_HOME"/start.jar \
  --list-modules

# Add to start HTTP2 module
java \
  -jar "$JETTY_HOME"/start.jar \
  --add-to-start=http2
```

### Commands

```sh
jetty
```

### Usage

```sh
# Check
jetty check

#
jetty start
jetty restart
jetty stop

#
jetty run

#
jetty supervise
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

<!--
mvn -Djetty.port=8080 jetty:run
-->

<!-- ### Tips -->

<!-- ####

```sh
cp ./target/*.war "$JETTY_HOME"/webapps
``` -->
