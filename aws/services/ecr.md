# AWS Elastic Container Registry (ECR)

## Console

- [Repositories](https://console.aws.amazon.com/ecr/repositories)

## Links

- [Main Website](https://aws.amazon.com/ecr/)

## Guides

- [Amazon ECR endpoints and quotas](https://docs.aws.amazon.com/general/latest/gr/ecr.html)

## CLI

### Commands

```sh
aws ecr help
```

### Bootstrap

```sh
#
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --output text --query 'Account' --no-cli-pager)"
export AWS_REGION='us-east-1'

#
aws ecr get-login-password \
  --region "$AWS_REGION" | \
    docker login \
      --username AWS \
      --password-stdin \
      "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
```

### Usage

```sh
#
aws ecr describe-repositories \
  --output text \
  --query 'repositories[*].[repositoryUri,repositoryName]'

#
aws ecr list-images --repository-name '<name>'
```
