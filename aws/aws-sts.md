# AWS Security Token Service (STS)

## CLI

### Commands

```sh
aws sts help
```

### Usage

```sh
# Security Token Service
aws \
  --output json \
  sts get-caller-identity
```

<!--
aws sts assumed-role \
  --role-arn [arn] \
  --role-session-name [name]
-->
