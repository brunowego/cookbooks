# AWS Command Line Interface (awscli)

## CLI

### Installation

#### Homebrew

```sh
brew install awscli
```

#### PIP

```sh
pip install -U awscli
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

# Identity and Access Management
aws iam get-user
aws iam get-account-summary

# Security Token Service
aws sts get-caller-identity
```

```sh
aws configure set default.region us-east-1

eval $(aws ecr get-login --no-include-email)

aws s3 cp s3://[owner]-secrets/[app]/${TRAVIS_BRANCH}/ssl/ ./ssl/ --recursive
```

### Tips

#### Profile Environment

```sh
export AWS_ACCESS_KEY_ID="$(aws --profile default configure get aws_access_key_id)"
export AWS_SECRET_ACCESS_KEY="$(aws --profile default configure get aws_secret_access_key)"
```
