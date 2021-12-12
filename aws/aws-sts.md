# AWS Security Token Service (STS)

## Links

- [Main Website](https://docs.aws.amazon.com/STS/latest/APIReference/welcome.html)

## CLI

### Commands

```sh
aws sts help
```

### Usage

```sh
#
aws \
  --output json \
  sts get-caller-identity
```

<!--
aws sts assumed-role \
  --role-arn [arn] \
  --role-session-name [name]
-->
