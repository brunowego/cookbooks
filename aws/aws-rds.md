# AWS Relational Database Service (RDS)

## CLI

### Commands

```sh
aws rds help
```

### Usage

```sh
#
aws rds create-db-instance \
  --db-instance-identifier 'test-mysql-instance' \
  --db-instance-class 'db.t3.micro' \
  --engine 'mysql' \
  --master-username 'admin' \
  --master-user-password 'admin' \
  --allocated-storage 20
```
