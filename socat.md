# socat

<!--
https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
-->

## CLI

### Installation

```sh
# Using Homebrew
brew install socat
```

### Usage

```sh
#
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

#
socat TCP-LISTEN:3001,fork,reuseaddr TCP:localhost:$CONDUCTOR_PORT
```

<!--
lsof -i :3001
ps aux | grep socat

kill $(lsof -t -i :3001)
pkill socat
-->
