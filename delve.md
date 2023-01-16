# Delve

<!--
https://app.pluralsight.com/library/courses/go-delve-debugging-applications/
-->

## Links

- [Code Repository](https://github.com/go-delve/delve)

## CLI

### Installation

#### Homebrew

```sh
brew install delve
```

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/go-delve/delve/cmd/dlv@latest
```

### Commands

```sh
dlv -h
```

### Usage

```sh
#
dlv debug
```

<!--
#
dlv \
  --listen :2345 \
  --headless=true \
  --log-dest ./log.txt \
  --api-version 2 \
  --accept-multiclient \
  exec ./<binary>

dlv -proc path/to/program

dlv -run

sudo dlv -pid 44839
-->
