# AWS Secrets Manager

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
