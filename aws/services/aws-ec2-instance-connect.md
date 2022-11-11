# AWS Elastic Computer Cloud (EC2) Instance Connect

## CLI

<!-- ### Installation

sudo apt-get install ec2-instance-connect -->

### Commands

```sh
aws ec2-instance-connect help
```

### Usage

```sh
#
export AWS_EC2_INSTANCE_ID="$(aws ec2 describe-instances --output text --query 'Reservations[].Instances[].InstanceId' --no-cli-pager)"

#
export AWS_EC2_INSTANCE_AVAILABILITY_ZONE="$(aws ec2 describe-instances --instance-ids "$AWS_EC2_INSTANCE_ID" --query 'Reservations[0].Instances[0].Placement.AvailabilityZone' --output text --no-cli-pager)"

#
aws ec2-instance-connect send-ssh-public-key \
  --instance-id "$AWS_EC2_INSTANCE_ID" \
  --instance-os-user 'ubuntu' \
  --ssh-public-key file://~/.ssh/id_rsa.<company-name>.pub \
  --availability-zone "$AWS_EC2_INSTANCE_AVAILABILITY_ZONE"

#
cat << EOF >> ~/.ssh/config
Host ec2-<ip-address-separated-by-hyphen>.compute-1.amazonaws.com
    User ec2-user
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa.<company-name>
EOF
```
