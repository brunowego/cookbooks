# AWS Systems Manager (SSM)

<!--
https://github.com/xen0l/aws-gate
-->

## Console

- [Dashboard](https://console.aws.amazon.com/systems-manager/home)
- [Fleet Manager](https://console.aws.amazon.com/systems-manager/managed-instances)

## Docs

- [Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html)

## CLI

### Commands

```sh
aws ssm help
```

### Usage

#### Documents

```sh
#
aws ssm list-documents
```

#### Parameters

```sh
#
aws ssm describe-parameters

#
aws ssm get-parameters \
  --names <name> \
  --with-decryption

#
aws ssm get-parameters-by-path --path </app/path>
```

<!--
aws ssm start-session --target "i-xxxxxxxxxxxxxxxxx"
-->
