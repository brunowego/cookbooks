# AWS Bastion Host Setup

## Dependencies

- [Bootstrap VPC](/aws/services/aws-vpc.md#bootstrap-vpc)

## Bootstrap

```sh
#
aws ec2 describe-key-pairs --output table

#
export AWS_EC2_MAIN_VPC_ID=''
export AWS_EC2_PUBLIC_SUBNET=''
export AWS_EC2_PRIVATE_SUBNET=''

#
aws ec2 create-key-pair \
  --key-name 'app-kp' \
  --output 'text' \
  --query 'KeyMaterial' \
  > ~/.ssh/<org>-app-kp.pem

aws ec2 create-key-pair \
  --key-name 'bastion-kp' \
  --output 'text' \
  --query 'KeyMaterial' \
  > ~/.ssh/<org>-bastion-kp.pem

#
chmod 400 ~/.ssh/<org>-app-kp.pem
chmod 400 ~/.ssh/<org>-bastion-kp.pem

#
export AWS_EC2_APP_SECURITY_GROUP_ID="$(aws ec2 create-security-group --description "Application SG" --group-name 'app-sg' --vpc-id "$AWS_EC2_MAIN_VPC_ID" --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=app-sg}]' --output text --query 'GroupId')"

export AWS_EC2_BASTION_SECURITY_GROUP_ID="$(aws ec2 create-security-group --description "Bastion SG" --group-name 'bastion-sg' --vpc-id "$AWS_EC2_MAIN_VPC_ID" --tag-specifications 'ResourceType=security-group,Tags=[{Key=Name,Value=bastion-sg}]' --output text --query 'GroupId')"

#
aws ec2 authorize-security-group-ingress \
  --group-id "$AWS_EC2_BASTION_SECURITY_GROUP_ID" \
  --protocol 'tcp' \
  --port 22 \
  --cidr '0.0.0.0/0'

aws ec2 authorize-security-group-ingress \
  --group-id "$AWS_EC2_APP_SECURITY_GROUP_ID" \
  --protocol 'tcp' \
  --port 22 \
  --source-group "$AWS_EC2_BASTION_SECURITY_GROUP_ID"

#
aws ec2 run-instances \
  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=16}' \
  --image-id 'ami-09d3b3274b6c5d4aa' \
  --instance-type 't2.micro' \
  --key-name 'bastion-kp' \
  --security-group-ids "$AWS_EC2_BASTION_SECURITY_GROUP_ID" \
  --subnet-id "$AWS_EC2_PUBLIC_SUBNET" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=bastion}]' \
  --count 1

aws ec2 run-instances \
  --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=16}' \
  --image-id 'ami-09d3b3274b6c5d4aa' \
  --instance-type 't2.micro' \
  --key-name 'app-kp' \
  --security-group-ids "$AWS_EC2_APP_SECURITY_GROUP_ID" \
  --subnet-id "$AWS_EC2_PRIVATE_SUBNET" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=app}]' \
  --count 1

#
aws ec2 describe-instances --output text --query 'GroupId'
```

<!--
bastion-ip

aws ec2 associate-address \
  --allocation-id \
  --instance-id

aws ec2 describe-key-pairs \
  --key-names 'bastion-kp' \
  --include-public-key \
  --query "KeyPairs[].PublicKey" \
  --output text \
  > ~/.ssh/id_rsa.pub
-->
