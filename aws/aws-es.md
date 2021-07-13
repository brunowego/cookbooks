# AWS Elasticsearch Service (ES)

## CLI

### Commands

```sh
aws es help
```

### Usage

```sh
#
aws \
  --output json \
  es list-domain-names

#
aws \
  --output json \
  es get-upgrade-history \
    --domain-name [name]

#
aws \
  --output json \
  es get-upgrade-status \
    --domain-name [name]

#
aws \
  --output json \
  es list-packages-for-domain \
    --domain-name [name]

#
aws \
  --output json \
  es get-package-version-history \
    --package-id [id]
```