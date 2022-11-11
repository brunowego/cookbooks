# AWS Relational Database Service (RDS)

<!--
https://github.com/symopsio/terraform-okta-ssm-modules/blob/main/bin/ec2-tunnel
https://github.com/nvaidya1/BugBust-repo-python/tree/master/awscli/examples/rds
-->

## Alternatives

- MySQL
- PostgreSQL
- MariaDB

## Console

- [Dashboard](https://console.aws.amazon.com/rds/home)

## Tools

- [Amazon RDS Instance Comparison](https://instances.vantage.sh/rds/)

## Guides

- [Secure RDS Access through SSH over AWS SSM](https://codelabs.transcend.io/codelabs/aws-ssh-ssm-rds/#0)
- [IAM database authentication for MySQL and PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html)
- [DB instance classes](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html)

## Questions

- [AWS RDS connection limits](https://serverfault.com/questions/862387/aws-rds-connection-limits)

## CLI

### Commands

```sh
aws rds help
```

### Usage

```sh
#
aws rds describe-db-instances --output table
```

### Tips

#### All Regions Running RDS

```sh
for AWS_REGION in $(aws ec2 describe-regions --output text | cut -f 4)
do
  echo -e "\nListing Instances in region: '$AWS_REGION'..."
  aws rds describe-db-instances \
    --output text \
    --query 'DBInstances[*].DBInstanceIdentifier' \
    --region "$AWS_REGION" \
    --no-cli-pager
done
```

#### Increase Cluster Capacity

```sh
#
aws \
  --output json \
  rds describe-db-clusters | \
    jq '.DBClusters[].DBClusterIdentifier'

#
export AWS_RDS_DB_CLUSTER_ID=''

#
aws \
  --output json \
  rds describe-db-clusters \
    --db-cluster-identifier "$AWS_RDS_DB_CLUSTER_ID" | \
    jq '.DBClusters[0].Capacity'

#
aws rds modify-current-db-cluster-capacity \
  --db-cluster-identifier "$AWS_RDS_DB_CLUSTER_ID" \
  --capacity 4 \
  --seconds-before-timeout 10
```
