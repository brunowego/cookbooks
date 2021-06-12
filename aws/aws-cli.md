# AWS Command Line Interface (CLI)

## Links

- [Code Repository](https://github.com/aws/aws-cli)
- [AWS Command Line Interface](https://aws.amazon.com/cli/)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)

## CLI

### Dependencies

- [aws-google-auth](/aws-google-auth.md)

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

**AWS CLI Command Syntax**

```sh
aws [options] <command> <subcommand> [parameters]
```

### Usage


```sh
#
aws configure get profile.default.region
aws configure get profile.default.output
aws configure get profile.dev.region # uat

#
aws configure set profile.default.region us-east-1
aws configure set profile.default.output text # json, table
aws configure set profile.dev.region us-east-1 # uat

#
aws configure list --profile default
aws configure list --profile dev # uat

#
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"

#
aws pricing get-attribute-values \
  --service-code AmazonEC2 \
  --attribute-name instanceType

#
cat ~/.aws/config
cat ~/.aws/credentials
```

<!--
#
export mfa_serial=arn:aws:iam::<account>:mfa/<login>

aws configure set profile.dev.region <your_region>
aws configure set profile.dev.aws_access_key_id <access_key_id>
aws configure set profile.dev.aws_secret_access_key <secret_access_key>
aws configure set profile.dev.aws_session_token <session_token>

aws configure set default.source_profile sts
aws configure set profile.sts.mfa_serial $mfa_serial
aws configure set profile.sts.aws_access_key_id $aws_access_key_id
aws configure set profile.sts.aws_secret_access_key $aws_secret_access_key

aws configure set profile.dev.role_arn arn:aws:iam::<organizationaccount>:role/OrganizationAccountAccessRole
aws configure --profile <name>

eval $(aws ecr get-login --no-include-email)

aws ecr get-login \
  --no-include-email \
  --region us-east-1
-->

### Tips

#### Profile Environment

```sh
#
export AWS_ACCESS_KEY_ID="$(aws --profile dev configure get aws_access_key_id)"
export AWS_SECRET_ACCESS_KEY="$(aws --profile dev configure get aws_secret_access_key)"
```

### Issues

#### Missing Default Region

```log
You must specify a region. You can also configure your region by running "aws configure".
```

```sh
#
aws configure set default.region us-east-1
```
