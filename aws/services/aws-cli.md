# AWS Command Line Interface (CLI)

## Links

- [Code Repository](https://github.com/aws/aws-cli)
- [Main Website](https://aws.amazon.com/cli/)

## Docs

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [Using an IAM role in the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html)

## Tools

- [AWS Profile Manager (a.k.a. AWS Profile Switcher)](/aws-profile-manager.md)

## CLI

### Installation

#### Homebrew

```sh
brew install awscli
```

#### pip

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

# AWS CLI Command Syntax
 aws <options> <command> <subcommand> <parameters>
```

### Configuration

```sh
#
aws configure set output text # json, table
aws configure set cli_pager ''

#
aws configure \
  --profile default

#
cat ~/.aws/config
cat ~/.aws/credentials
```

### Usage

```sh
#
aws configure list-profiles

#
aws configure list --profile default

#
aws s3 ls
```

### Tips

#### Show All Regions

```sh
#
aws ec2 describe-regions \
  --all-regions \
  --output json \
  --region 'us-east-1' | \
    jq -r '.Regions | .[] | .RegionName + " " + .OptInStatus' | \
      grep -v not-opted-in | cut -d ' ' -f 1
```

#### Manually Configuration

```sh
#
export AWS_ACCESS_KEY_ID='<access-key>'
export AWS_SECRET_ACCESS_KEY='<secret-key>'

aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY"
```

#### Environment Access Variables

```sh
#
export AWS_ACCESS_KEY_ID="$(aws --profile <name> configure get aws_access_key_id)"
export AWS_SECRET_ACCESS_KEY="$(aws --profile <name> configure get aws_secret_access_key)"
```

### Issues

#### Missing Default Region

```log
You must specify a region. You can also configure your region by running "aws configure".
```

```sh
#
export AWS_REGION='us-east-1'
# or
aws configure set default.region us-east-1
```

#### Wrong Profile Selected

```log
An error occurred (ExpiredToken) when calling the GetCallerIdentity operation: The security token included in the request is expired
An error occurred (ExpiredToken) when calling the ListBuckets operation: The provided token has expired.
```

```sh
# First verify if you have already logged in AWS through CLI.
# Or, if you selected the right profile:
AWS_PROFILE=<name> aws s3 ls
```
