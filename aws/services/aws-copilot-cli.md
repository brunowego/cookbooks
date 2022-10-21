# AWS Copilot CLI

## Links

- [Code Repository](https://github.com/aws/copilot-cli)

## Installation

### Homebrew

```sh
brew tap aws/tap
brew install copilot-cli
```

### Commands

```sh
copilot -h
```

### Usage

```sh
#
copilot init \
  -a 'demo' \
  --deploy \
  -d './Dockerfile' \
  -n 'api' \
  -t 'Load Balanced Web Service'
```
