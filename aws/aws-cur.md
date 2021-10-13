# AWS Cost and Usage Reports (CUR)

<!--
https://console.aws.amazon.com/migrationhub/home?region=us-east-1#/welcome
-->

## Links

- [AWS Console](https://console.aws.amazon.com/acm/home?region=us-east-1#/)

## Guides

- [MAP 2.0 Customer Documentation](https://s3-us-west-2.amazonaws.com/map-2.0-customer-documentation/html/latest/en/1-setting_up_cur.html)

## Files

- AWS CloudFormation
  - [CUR Server IDs Automator](https://map-automation.s3.us-west-2.amazonaws.com/cur-server-ids-automator.yaml)

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
