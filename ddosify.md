# Ddosify

## Links

- [Code Repository](https://github.com/ddosify/ddosify)
- [Main Website](https://ddosify.com/)

## CLI

### Installation

#### Homebrew

```sh
brew tap ddosify/tap
brew install ddosify
```

<!-- ### Commands

```sh
ddosify -h
``` -->

### Usage

```sh
#
ddosify -t [URL]

#
ddosify \
  -t [URL] \
  -n 1000 \
  -d 20 \
  -p HTTPS \
  -m PUT \
  -T 7 \
  -P http://proxy_server.com:80

#
ddosify -config ./config_examples/config.json
```
