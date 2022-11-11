# AWS DynamoDB

## Alternatives

- MongoDB

## CLI

### Commands

```sh
aws dynamodb help
aws dynamodbstreams help
```

### Usage

```sh
#
aws dynamodb put-item \
  --table-name '<tb-name>' \
  --item '{...}'
```

### Tips

#### All Regions Running RDS

```sh
for AWS_REGION in $(aws ec2 describe-regions --output text | cut -f 4)
do
  echo -e "\nListing Instances in region: '$AWS_REGION'..."
  aws dynamodb describe-db-instances \
    --output text \
    --query 'DBInstances[*].DBInstanceIdentifier' \
    --region "$AWS_REGION" \
    --no-cli-pager
done
```
