# AWS Secrets Manager

## Links

- [Secrets](https://console.aws.amazon.com/secretsmanager/home?region=us-east-1#!/listSecrets)

## CLI

### Commands

```sh
aws secretsmanager help
```

### Usage

```sh
#
aws \
  --output json \
  secretsmanager list-secrets | \
  jq .
```
