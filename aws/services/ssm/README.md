# AWS Simple Systems Manager (SSM)

<!--
https://github.com/xen0l/aws-gate
-->

## Console

- [Dashboard](https://console.aws.amazon.com/systems-manager/home)
- [Fleet Manager](https://console.aws.amazon.com/systems-manager/managed-instances)

## Docs

- [Parameter Store](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-parameter-store.html)

## CLI

### Commands

```sh
aws ssm help
```

### Usage

#### Documents

```sh
#
aws ssm list-documents
```

#### Parameters

```sh
#
aws ssm describe-parameters

#
aws ssm get-parameters \
  --names '<name>' \
  --with-decryption

#
aws ssm get-parameters-by-path --path '</app/path>'
```

#### Start Session

<!--
INSTANCE_ID=$(aws ssm get-parameter --query 'Parameter.Value' --output text --name '/sample-cdk-AuroraServerlessV2/BastionHostEc2InstanceId')

instance-id -> Bastion Host
-->

```sh
#
aws ssm start-session \
  --target '<instance-id>' \
  --document-name 'AWS-StartPortForwardingSessionToRemoteHost' \
  --parameters host='<rds-host>',portNumber='<rds-port>',localPortNumber='<local-port>' \
  --region 'us-east-1'
  # --debug
```

### Issues

#### Target Not Connected

```log
An error occurred (TargetNotConnected) when calling the StartSession operation: <instance-id> is not connected.
```

<!--
aws iam list-instance-profiles --region 'us-east-1'
-->

TODO
