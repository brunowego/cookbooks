# AWS Elastic Container Registry (ECR)

## Links

- [Main Website](https://aws.amazon.com/ecr/)

## Guides

- [Amazon ECR endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/ecr.html)

## CLI

### Commands

```sh
aws ecr help
```

### Usage

```sh
#
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''

#
export AWS_ACCOUNT_ID=''
export AWS_REGION='us-east-1'

#
aws ecr get-login-password \
  --region "$AWS_REGION" | \
    docker login \
      --username AWS \
      --password-stdin \
      "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
```
