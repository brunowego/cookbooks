# Amazon Web Services (AWS)

<!--
https://github.com/infrascan/infrascan
-->

<!--
https://app.pluralsight.com/roleiq/roles/7650da31-d0c8-44a5-997f-5904774ff72c

https://youtube.com/watch?v=xCc9xk8LPTo
https://youtube.com/watch?v=YKT9bWvy_PI

ACKQueue

https://linkedin.com/learning/paths/prepare-for-the-aws-certified-cloud-practitioner-exam
https://linkedin.com/learning/paths/become-an-aws-data-and-devops-specialist
https://linkedin.com/learning/paths/prepare-for-aws-devops-engineer-professional-certification
https://linkedin.com/learning/paths/prepare-for-aws-sysops-administrator-certification

https://app.pluralsight.com/search/?q=aws%20certified&type=path&m_sort=relevance&query_id=4364f4ab-a8d6-4533-9340-582d9d55d691&source=user_typed

https://app.pluralsight.com/library/courses/aws-system-admin-fundamentals/table-of-contents

https://linkedin.com/learning/aws-essential-training-for-developers/what-is-the-best-way-to-use-aws

https://linkedin.com/learning/aws-administration-security-fundamentals/fundamentals-of-aws-security

https://linkedin.com/learning/aws-deploying-and-provisioning/aws-deploying-and-provisioning
https://linkedin.com/learning/aws-automation-and-optimization/automation-and-optimization-in-aws
https://linkedin.com/learning/aws-high-availability/aws-and-high-availability
https://linkedin.com/learning/aws-networking/aws-networking-overview
https://linkedin.com/learning/aws-monitoring-and-reporting/welcome
https://linkedin.com/learning/aws-for-devops-high-availability-and-elasticity/welcome
https://linkedin.com/learning/aws-for-devops-monitoring-metrics-and-logging/welcome

https://linkedin.com/learning/aws-and-react-creating-full-stack-apps/full-stack-react-development-on-aws
https://linkedin.com/learning/creating-a-serverless-application-using-react-in-aws/2392677

https://linkedin.com/learning/cloud-native-projects-aws-serverless/flexibility-with-lambda
https://linkedin.com/learning/advanced-kubernetes-1-core-concepts/exploring-the-kubernetes-architecture
https://linkedin.com/learning/aws-high-availability/aws-and-high-availability

Transactions Per Second (TPS)
-->

![AWS Network Architecture](/assets/images/aws/aws-network-architecture.gif)

## Console

- [Globally](https://console.aws.amazon.com)
- [US West 2](https://us-west-2.console.aws.amazon.com)

## References

- [Amazon Personalize Pricing](https://aws.amazon.com/personalize/pricing/)
- [Awesome List](https://github.com/donnemartin/awesome-aws)
- [AWS Exam Scheduling](https://certmetrics.com/amazon/candidate/exam_scheduling.aspx)
- [AWS Global Infrastructure](https://aws.amazon.com/about-aws/global-infrastructure/)
- [AWS Post-Event Summaries](https://aws.amazon.com/premiumsupport/technology/pes/)
- [Open Source AWS Security Tools](https://asecure.cloud/tools/)
- [Regions and Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)

## Links

- [AWS Architecture Icons](https://aws.amazon.com/architecture/icons/)
- [AWS Free Tier](https://aws.amazon.com/free) 🌟
- [AWS Glossary](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html)
- [AWS Pricing Calculator](https://calculator.aws/#/)
- [AWS Service Health Dashboard](https://status.aws.amazon.com)
- [AWS Simple Monthly Calculator](https://calculator.s3.amazonaws.com/index.html)

## Tools

- [AWS Profile Manager (a.k.a. AWS Profile Switcher)](/aws-profile-manager.md)

<!--
https://github.com/johnnyopao/awsp
-->

## History

- Launches first service Simple Queue Service (SQS) around 2004

## CLI

### Links

- [Code Repository](https://github.com/aws/aws-cli)
- [Main Website](https://aws.amazon.com/cli/)

### Docs

- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/)
- [Using an IAM role in the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-role.html)

### Tools

- [AWS Profile Manager (a.k.a. AWS Profile Switcher)](/aws-profile-manager.md)

### Installation

#### Homebrew

```sh
brew install awscli
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install awscli
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

#
aws configure list-profiles
aws configure list --profile default
```

### Usage

```sh
#
aws s3 ls
```

### Tips

#### Backup Credentials

```sh
cat ~/.aws/credentials | gh gist create - -f aws-credentials
```

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

#### Open SSL Library

```log
AttributeError: module 'lib' has no attribute 'X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT'
```

<!--
https://github.com/aws/aws-cli/issues/7942
-->

```sh
#
aws --version

#
pip3 install pyOpenSSL==23.1.0
```

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

## Questions

### Why Deploy Globally?

Reduced latency and increased redundancy.

<!--
## Interview

https://youtube.com/watch?v=HoXEyXIf6_U
https://youtube.com/watch?v=cp108MhVEI0
-->
