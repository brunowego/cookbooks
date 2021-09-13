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

### Commands

```sh
dlv -h
```

### Usage

```sh
#
dlv debug

#
dlv \
  --listen :2345 \
  --headless=true \
  --log-dest ./log.txt \
  --api-version 2 \
  --accept-multiclient \
  exec ./[binary]
```
