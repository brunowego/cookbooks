# wrk

## Links

- [Code Repository](https://github.com/wg/wrk)

## CLI

### Installation

#### Homebrew

```sh
brew install wrk
```

### Commands

```sh
wrk
```

### Usage

```sh
#
wrk \
  -t 2 \
  -c 500 \
  -d 5s \
  'http://127.0.0.1:8080'
```
