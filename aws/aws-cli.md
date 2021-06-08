# AWS Command Line Interface (CLI)

## Links

- [Code Repository](https://github.com/aws/aws-cli)
- [AWS Command Line Interface](https://aws.amazon.com/cli/)

## CLI

### Installation

#### Homebrew

```sh
brew install awscli
```

#### PIP

```sh
pip3 install -U awscli
```

#### Chocolatey

```sh
choco install awscli
```

### Commands

```sh
aws help
```

### Examples

#### Configure

```sh
# list
aws configure list

#
aws configure

#
aws pricing get-attribute-values \
  --service-code AmazonEC2 \
  --attribute-name instanceType

# Identity and Access Management
aws iam get-user
aws iam get-account-summary

# Security Token Service
aws sts get-caller-identity
```

<!--
us-east-1
-->

```sh
eval $(aws ecr get-login --no-include-email)
```

### Tips

#### Profile Environment

```sh
export AWS_ACCESS_KEY_ID="$(aws --profile default configure get aws_access_key_id)"
export AWS_SECRET_ACCESS_KEY="$(aws --profile default configure get aws_secret_access_key)"
```

### Issues

#### Missing Default Region

```log
You must specify a region. You can also configure your region by running "aws configure".
```

```sh
aws configure set default.region us-east-1
```
