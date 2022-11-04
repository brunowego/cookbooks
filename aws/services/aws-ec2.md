# AWS Elastic Computer Cloud (EC2)

<!--
On-demand instances
Reserved instances
Spot instances

https://www.youtube.com/watch?v=F8jXE-_hdfg
-->

## Guides

- [Amazon Machine Images (AMI)](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)
- [Find a Linux AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)
- [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/reference/ec2/index.html)
- [VM Import/Export](https://aws.amazon.com/ec2/vm-import/)

## Links

- [Amazon EC2 pricing](aws.amazon.com/ec2/pricing)
- [Easy Amazon EC2 Instance Comparison](https://instances.vantage.sh/)

## CLI

### Dependencies

- [AWS Command Line Interface (CLI)](/aws/aws-cli.md)

### Commands

```sh
aws ec2 help
```

### Usage

```sh
#
aws \
  --output table \
  ec2 describe-regions

#
aws \
  --output json \
  ec2 describe-instances

#
aws \
  --output json \
  ec2 describe-vpcs

#
aws \
  --output text \
  ec2 describe-availability-zones \
    --query 'AvailabilityZones[0].[RegionName]'

#
aws \
  --output text \
  pricing get-attribute-values \
  --service-code 'AmazonEC2' \
  --attribute-name 'instanceType'

#
aws ec2 create-security-group \
  --group-name 'EC2SecurityGroup' \
  --description 'Security Group for EC2 instances to allow ports 22, 80 and 443'

#
aws ec2 authorize-security-group-ingress \
  --group-name 'EC2SecurityGroup' \
  --protocol tcp \
  --port 22 \
  --cidr 172.54.125.8/32

#
aws ec2 authorize-security-group-ingress \
  --group-name 'EC2SecurityGroup' \
  --protocol tcp \
  --port 80 \
  --cidr 0.0.0.0/0

#
aws ec2 authorize-security-group-ingress \
  --group-name 'EC2SecurityGroup' \
  --protocol tcp \
  --port 443 \
  --cidr 0.0.0.0/0

#
aws ec2 describe-security-groups \
  --query 'SecurityGroups[*].[Description]'

#
aws ec2 describe-security-groups \
  --group-names 'EC2SecurityGroup'

# List EC2 AMI images
aws \
  --output table \
  ec2 describe-images \
    --filters \
      'Name=description,Values=*Amazon Linux 2*' \
      'Name=owner-alias,Values=amazon'

aws \
  --output table \
  ec2 describe-images \
    --filters \
      'Name=description,Values=*CentOS*' \
      'Name=owner-alias,Values=amazon'

#
aws \
  --output table \
  ec2 describe-subnets

#
cat << EOF > ./my_script.sh
# my provisioner script
EOF

#
aws ec2 run-instances \
  --image-id <ami-id> \
  --count 1 \
  --instance-type 't2.micro' \
  --key-name 'newcluster' \
  --security-group-ids <sg-id> \
  --subnet-id <sn-id> \
  --user-data file://my_script.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=webserver,Value=production}]' \
  --dry-run

#
aws ec2 run-instances \
  --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
  --count 1 \
  --instance-type 't2.micro' \
  --key-name 'newcluster' \
  --security-group-ids <sg-id> \
  --subnet-id <sn-id> \
  --user-data file://my_script.sh \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=backend,Value=inventory1}]' \
  --dry-run
```

<!--
aws \
  --output text \
  ec2 describe-vpcs \
    --filter 'Name=tag:Name,Values=Kubernetes' \
    --query 'Vpcs[0].VpcId'
-->

<!--
aws ec2 detach-volume --volume-id "$1" --force
-->

<!--
aws ec2 describe-instances \
  --profile poc \
  --region us-east-1 | \
    grep "PrivateIpAddress" | \
      grep 10.101 | \
        grep -v "," | \
          awk '{print $2}' | \
            sort | \
              uniq
-->

#### Key Pairs

```sh
#
aws ec2 describe-key-pairs
```

<!--
export privatekey=bastion
aws ec2 create-key-pair \
    --key-name ${privatekey} \
    --key-type rsa \
    --key-format pem \
    --query "KeyMaterial" \
    --output text > ${privatekey}.pem

mv $(basename $(pwd)).pem ~/.ssh/

export privatekey=ubuntu
ssh-keygen -t rsa -f ${privatekey}
aws ec2 import-key-pair --key-name ${privatekey} --public-key-material fileb://${privatekey}.pub

#ssh-keygen -y -f ${privatekey} >> ${privatekey}_public.pub
-->

### Tips

#### Get Console Output

```sh
aws \
  --output text \
  ec2 get-console-output \
    --instance-id [instance-id]
```

<!--
tail -f /var/log/syslog
-->

#### Change Ubuntu EC2 Password

```sh
#
sudo su -

#
passwd ubuntu
```
