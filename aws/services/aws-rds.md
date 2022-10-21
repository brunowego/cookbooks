# AWS Relational Database Service (RDS)

<!--
https://github.com/symopsio/terraform-okta-ssm-modules/blob/main/bin/ec2-tunnel
https://github.com/nvaidya1/BugBust-repo-python/tree/master/awscli/examples/rds
-->

## Alternatives

- MySQL
- PostgreSQL
- MariaDB

## Links

- [AWS Console / RDS / Databases](https://console.aws.amazon.com/rds/home?region=us-east-1#databases:)

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
aws rds create-db-instance \
  --db-instance-identifier 'test-mysql-instance' \
  --db-instance-class 'db.t3.micro' \
  --engine 'mysql' \
  --master-username 'admin' \
  --master-user-password 'admin' \
  --allocated-storage 20
```

### Tips

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

<!-- #### Secure RDS Access through SSH over AWS SSM

Generate a keypair and send the pubkey to our EC2 instance, so that we can use ssh to access our instance instead of aws ssm start-session. This isn't particularly useful without doing port forwarding, but including for testing.

```sh
echo -e 'y\n' | \
  ssh-keygen \
    -t rsa \
    -f /tmp/temp \
    -N '' \
    >/dev/null \
    2>&1

aws \
  --profile 'default' \
  --region 'us-east-1' \
  ec2-instance-connect send-ssh-public-key \
    --instance-id "$(terraform output instance_id)" \
    --availability-zone "$(terraform output instance_az)" \
    --instance-os-user ec2-user \
    --ssh-public-key 'file:///tmp/temp.pub'

ssh \
  -i /tmp/temp \
  -o 'UserKnownHostsFile=/dev/null' \
  -o 'StrictHostKeyChecking=no' \
  -o ProxyCommand="aws --profile default --region us-east-1 ssm start-session --target %h --document AWS-StartSSHSession" \
  ec2-user@"$(terraform output instance_id)"
```

####

Generate a keypair and send the pubkey to our EC2 instance, so that we can use ssh port forwarding to our remote rds endpoint. If we were just using `aws ssm start-session` to connect we wouldn't need this step, but we can't configure the rds endpoint without using ssh.

```sh
echo -e 'y\n' | \
  ssh-keygen \
    -t rsa \
    -f /tmp/temp \
    -N '' \
    >/dev/null \
    2>&1

aws \
  --profile 'default' \
  --region 'us-east-1' \
  ec2-instance-connect send-ssh-public-key \
    --instance-id `terraform output instance_id` \
    --availability-zone `terraform output instance_az` \
    --instance-os-user ec2-user \
    --ssh-public-key file:///tmp/temp.pub

ssh \
  -i /tmp/temp \
  -Nf \
  -M \
  -L 5432:`terraform output rds_endpoint` \
  -o "UserKnownHostsFile=/dev/null" \
  -o "StrictHostKeyChecking=no" \
  -o ProxyCommand="aws --profile default --region us-east-1 ssm start-session --target %h --document AWS-StartSSHSession --parameters portNumber=%p" \
  ec2-user@"$(terraform output instance_id)"
``` -->
