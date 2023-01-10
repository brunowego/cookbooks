# AWS Key Management Service (KMS)

## CLI

### Commands

```sh
aws kms help
```

### Usage

```sh
#
aws kms list-keys

#
aws kms list-key-policies --key-id '<id>'

#
aws kms get-key-policy \
  --key-id '<id>' \
  --policy-name '<name>'
```
