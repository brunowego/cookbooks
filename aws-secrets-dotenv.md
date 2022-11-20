# aws-secrets-dotenv

<!--
https://github.com/supersoniko/aws-secrets-dotenv
-->

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

<!--
#### Manual Creation

```sh
#
aws-secrets-dotenv \
  --aws-region 'us-east-1' \
  get \
    '[secret-id]' \
    -f ./.env

#
kubectl create secret generic [name] \
  -n [namespace] \
  --from-env-file=./.env

#
kubectl get secret [name] \
  -n [namespace] \
  -o yaml | \
    kubectl neat
```
-->
