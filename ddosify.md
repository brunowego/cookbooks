# Ddosify

## Links

- [Code Repository](https://github.com/ddosify/ddosify)
- [Main Website](https://ddosify.com)

## CLI

### Installation

#### Homebrew

```sh
brew tap ddosify/tap
brew install ddosify
```

### Commands

```sh
ddosify -h
```

### Usage

```sh
#
ddosify \
  -T 5 \
  -d 60 \
  -m GET \
  -n 500 \
  -t http://127.0.0.1:3000/api/trpc/waitlist.addEmailToWaitList?batch=1
```

<!--
ddosify -config ./config_examples/config.json
-->
