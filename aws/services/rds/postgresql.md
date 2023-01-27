# AWS RDS PostgreSQL

## Usage

```sh
#
aws rds describe-db-engine-versions \
  --engine aurora-postgresql \
  --query '*[].[EngineVersion]' \
  --output text \
  --region us-east-1
```
