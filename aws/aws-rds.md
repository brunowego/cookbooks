# AWS Relational Database Service (RDS)

## CLI

### Commands

```sh
aws rds help
```

### Usage

```sh
#
aws rds create-db-instance
  --db-instance-identifier sg-cli-test \
  --allocated-storage 20 \
  --db-instance-class db.m1.small --engine mysql \
  --master-username myawsuser \
  --master-user-password mypassword
```
