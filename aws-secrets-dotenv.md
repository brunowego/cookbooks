# aws-secrets-dotenv

## Links

- [Code Repository](https://github.com/RafaelYon/aws-secrets-dotenv)

## CLI

### Installation

#### go get

```sh
go get github.com/RafaelYon/aws-secrets-dotenv
```

### Commands

```sh
aws-secrets-dotenv -h
```

### Usage

```sh
#
aws-secrets-dotenv \
  --aws-region 'us-east-1' \
  get \
    '[secret-id]' \
    -f ./.env
```
