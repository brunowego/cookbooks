# AWS Virtual Private Cloud (VPC)

## Links

- [Amazon VPC pricing](https://aws.amazon.com/vpc/pricing/)
- [Your VPCs](https://console.aws.amazon.com/vpc/home?region=us-east-1#vpcs:)
- [NAT gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

## VPC Features

- Configure VPC routing tables.
- Use NAT Gateways for outbound traffic.
- Internal IP address allocation.

## CLI

### Usage

```sh
#
aws \
  --output json \
  ec2 describe-vpcs | \
    jq -r '.Vpcs[].VpcId'

#
aws \
  --output json \
  ec2 describe-subnets

#
aws \
  --output json \
  ec2 describe-nat-gateways | \
    jq -r '.NatGateways[].NatGatewayAddresses[].PublicIp'
```
