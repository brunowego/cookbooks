# AWS Copilot CLI

**Keywords:** AWS Fargate

## Links

- [Code Repository](https://github.com/aws/copilot-cli)
- [Main Website](https://aws.github.io/copilot-cli/)

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
