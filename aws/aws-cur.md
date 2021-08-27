# AWS Cost and Usage Reports (CUR)

<!--
https://console.aws.amazon.com/migrationhub/home?region=us-east-1#/welcome
-->

## Links

- [AWS Console](https://console.aws.amazon.com/acm/home?region=us-east-1#/)

## CLI

### Commands

```sh
aws cur help
```

### Usage

```sh
#
aws \
  --output json \
  cur describe-report-definitions
```

<!--
Cost allocation tags

aws-migration-project-id
map-dba
map-migrated
map-migrated-app
map-sap
map-win-modernized
-->
