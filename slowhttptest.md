# SlowHTTPTest

**Keywords:** DDoS Attack Simulator

## Links

- [Code Repository](https://github.com/shekyan/slowhttptest)

## CLI

### Installation

#### Homebrew

```sh
brew install slowhttptest
```

### Commands

```sh
slowhttptest -h
```

### Usage

```sh
#
slowhttptest \
  -H \
  -g \
  -o slowhttp \
  -c 1000 \
  -i 10 \
  -r 200 \
  -t GET \
  -u http://127.0.0.1:3000 \
  -x 24 \
  -p 3
```
