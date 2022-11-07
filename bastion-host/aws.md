# Bastion Host for AWS

<!--
https://docs.aws.amazon.com/vpc/latest/userguide/vpc-subnets-commands-example.html
-->

<!--
https://github.com/chicalicdan/aws-bastionhost-ssh-tunnel
https://github.com/haandol/bastionhost-rds-tutorial/blob/384110c9059ecd07a1ba1c618d6f08bf11da402e/README.md
https://github.com/JoseIbanez/sl-Step3Project2/blob/3489f5dbcbe362c257668c91e9cda93c0f481330/awscli/new-ec2.sh
https://github.com/Nyele93/DevOps1/blob/f45235986e37b8e8897970dc0bb30c110246746c/classes/01class/exercises/c01-aws01/tkav/README.md

https://www.youtube.com/watch?v=aOVdNAE2Jeg
-->

## Glossary

- Classless Inter-Domain Routing (CIDR)

## Terms

- Inbound (Ingress)
- Outbound (Egress)

## Console

- Instances
  - [Instances](https://console.aws.amazon.com/ec2/home#Instances:)
- Network & Security
  - [Security Groups](https://console.aws.amazon.com/ec2/home#SecurityGroups:)
  - [Elastic IPs](https://console.aws.amazon.com/ec2/home#Addresses:)
  - [Key pairs](https://console.aws.amazon.com/ec2/home#KeyPairs:)

## Tools

- [aws-security-viz](/aws-security-viz.md)

## Host

### Dependencies

- [Bootstrap VPC](/aws/services/aws-vpc.md#bootstrap-vpc)

### Setup

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


bastion-ip

aws ec2 associate-address \
  --allocation-id \
  --instance-id
```

<!--
aws ec2 describe-key-pairs \
  --key-names 'bastion-kp' \
  --include-public-key \
  --query "KeyPairs[].PublicKey" \
  --output text \
  > ~/.ssh/id_rsa.pub
-->

## User

### Connect

```sh
ssh \
  -i '~/.ssh/<org>-bastion-key.pem' \
  -f \
  -l ec2-user \
  -L 5432:<rds-endpoint>:5432 \
  <bastion-host-public-ip> \
  -v
```

<!--
IAM Role: EC2_SSM_core
-->

<!-- #### Secure RDS Access through SSH over AWS SSM

Generate a keypair and send the pubkey to our EC2 instance, so that we can use ssh to access our instance instead of aws ssm start-session. This isn't particularly useful without doing port forwarding, but including for testing.

```sh
echo -e 'y\n' | \
  ssh-keygen \
    -t rsa \
    -f /tmp/temp \
    -N '' \
    >/dev/null \
    2>&1

aws \
  --profile 'default' \
  --region 'us-east-1' \
  ec2-instance-connect send-ssh-public-key \
    --instance-id "$(terraform output instance_id)" \
    --availability-zone "$(terraform output instance_az)" \
    --instance-os-user ec2-user \
    --ssh-public-key 'file:///tmp/temp.pub'

ssh \
  -i /tmp/temp \
  -o 'UserKnownHostsFile=/dev/null' \
  -o 'StrictHostKeyChecking=no' \
  -o ProxyCommand="aws --profile default --region us-east-1 ssm start-session --target %h --document AWS-StartSSHSession" \
  ec2-user@"$(terraform output instance_id)"
```

####

Generate a keypair and send the pubkey to our EC2 instance, so that we can use ssh port forwarding to our remote rds endpoint. If we were just using `aws ssm start-session` to connect we wouldn't need this step, but we can't configure the rds endpoint without using ssh.

```sh
echo -e 'y\n' | \
  ssh-keygen \
    -t rsa \
    -f /tmp/temp \
    -N '' \
    >/dev/null \
    2>&1

aws \
  --profile 'default' \
  --region 'us-east-1' \
  ec2-instance-connect send-ssh-public-key \
    --instance-id `terraform output instance_id` \
    --availability-zone `terraform output instance_az` \
    --instance-os-user ec2-user \
    --ssh-public-key file:///tmp/temp.pub

ssh \
  -i /tmp/temp \
  -Nf \
  -M \
  -L 5432:`terraform output rds_endpoint` \
  -o "UserKnownHostsFile=/dev/null" \
  -o "StrictHostKeyChecking=no" \
  -o ProxyCommand="aws --profile default --region us-east-1 ssm start-session --target %h --document AWS-StartSSHSession --parameters portNumber=%p" \
  ec2-user@"$(terraform output instance_id)"
``` -->
