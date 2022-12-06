# Bastion Host for AWS

<!--
https://docs.aws.amazon.com/vpc/latest/userguide/vpc-subnets-commands-example.html

https://github.com/chicalicdan/aws-bastionhost-ssh-tunnel
https://github.com/haandol/bastionhost-rds-tutorial/blob/384110c9059ecd07a1ba1c618d6f08bf11da402e/README.md
https://github.com/JoseIbanez/sl-Step3Project2/blob/3489f5dbcbe362c257668c91e9cda93c0f481330/awscli/new-ec2.sh
https://github.com/Nyele93/DevOps1/blob/f45235986e37b8e8897970dc0bb30c110246746c/classes/01class/exercises/c01-aws01/tkav/README.md

https://www.youtube.com/watch?v=aOVdNAE2Jeg
-->

## Console

- Instances
  - [Instances](https://console.aws.amazon.com/ec2/home#Instances:)
- Network & Security
  - [Security Groups](https://console.aws.amazon.com/ec2/home#SecurityGroups:)
  - [Elastic IPs](https://console.aws.amazon.com/ec2/home#Addresses:)
  - [Key pairs](https://console.aws.amazon.com/ec2/home#KeyPairs:)

## Tools

- [aws-security-viz](/aws-security-viz.md)

## Alternative

- AWS Systems Manager (SSM) / Fleet Manager

## Connect

```sh
#
nc -zv 'ec2-<ip-address-separated-by-hyphen>.compute-1.amazonaws.com' 22

#
cat << EOF >> ~/.ssh/config
Host ec2-<ip-address-separated-by-hyphen>.compute-1.amazonaws.com
    User ec2-user
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa.<company-name>
EOF

#
ssh \
  -N \
  -L <rds-port>:<rds-endpoint>:<rds-port> \
  <bastion-host-public-ip>
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

aws ec2 instance-connect send-ssh-public-key \
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
