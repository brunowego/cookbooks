# socat

<!--
https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc
-->

## CLI

### Installation

#### Homebrew

```sh
brew install socat
```

### Usage

```sh
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```
