# AWS RDS MySQL

## Console

- [Dashboard](https://console.aws.amazon.com/rds/home)

## CLI

### Usage

```sh
#
aws rds describe-db-instances --output table

#
aws rds create-db-instance \
  --db-instance-identifier '<app-mysql-instance>' \
  --allocated-storage 20 \
  --db-instance-class 'db.t3.micro' \
  --engine 'mysql' \
  --master-username 'admin' \
  --master-user-password 'Pa$$w0rd!' \
  --enable-cloudwatch-logs-exports '["audit", "error", "general", "slowquery"]'

#
aws rds stop-db-instance --db-instance-identifier '<app-mysql-instance>'

#
aws rds start-db-instance --db-instance-identifier '<app-mysql-instance>'

#
aws rds reboot-db-instance --db-instance-identifier '<app-mysql-instance>'

#
aws rds delete-db-instance \
  --db-instance-identifier '<app-mysql-instance>' \
  --skip-final-snapshot
```

#### Snapshots

```sh
#
aws rds describe-db-snapshots --output table

#
aws rds delete-db-snapshot --db-snapshot-identifier 'rds:<app>-mysql-instance-<date-time>'
```
