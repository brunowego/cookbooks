# AWS Virtual Private Cloud (VPC)

<!--
VPC Default: 172.31.0.0/16
-->

<!--
https://www.youtube.com/watch?v=3okhljXN9aA
https://www.youtube.com/watch?v=oJnWUbpJduA
-->

## Console

- Virtual private cloud
  - [Your VPCs](https://console.aws.amazon.com/vpc/home#vpcs:)
  - [Subnets](https://console.aws.amazon.com/vpc/home#subnets:)
  - [Route tables](https://console.aws.amazon.com/vpc/home#RouteTables:)
  - [Internet gateways](https://console.aws.amazon.com/vpc/home#igws:)

## Links

- [Amazon VPC pricing](https://aws.amazon.com/vpc/pricing/)

## Docs

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

#### Bootstrap VPC

```sh
#
export AWS_EC2_MAIN_VPC_ID="$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=main}]' --output text --query 'Vpc.VpcId')"

#
export AWS_EC2_PUBLIC_SUBNET="$(aws ec2 create-subnet --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-subnet-1a}]' --cidr-block '10.0.0.0/24' --vpc-id "$AWS_EC2_MAIN_VPC_ID" --output text --query 'Subnet.SubnetId')"

export AWS_EC2_PRIVATE_SUBNET="$(aws ec2 create-subnet --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=private-subnet-1a}]' --cidr-block '10.0.1.0/24' --vpc-id "$AWS_EC2_MAIN_VPC_ID" --output text --query 'Subnet.SubnetId')"

#
export AWS_EC2_PUBLIC_ROUTE_TABLE="$(aws ec2 create-route-table --vpc-id "$AWS_EC2_MAIN_VPC_ID" --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=public-rt}]' --output text --query 'RouteTable.RouteTableId')"

export AWS_EC2_PRIVATE_ROUTE_TABLE="$(aws ec2 create-route-table --vpc-id "$AWS_EC2_MAIN_VPC_ID" --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=private-rt}]' --output text --query 'RouteTable.RouteTableId')"

#
aws ec2 associate-route-table \
  --subnet-id "$AWS_EC2_PUBLIC_SUBNET" \
  --route-table-id "$AWS_EC2_PUBLIC_ROUTE_TABLE"

aws ec2 associate-route-table \
  --subnet-id "$AWS_EC2_PRIVATE_SUBNET" \
  --route-table-id "$AWS_EC2_PRIVATE_ROUTE_TABLE"

#
export AWS_EC2_INTERNET_GATEWAY="$(aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=main-igw}]' --output text --query 'InternetGateway.InternetGatewayId')"

#
aws ec2 attach-internet-gateway \
  --vpc-id "$AWS_EC2_MAIN_VPC_ID" \
  --internet-gateway-id "$AWS_EC2_INTERNET_GATEWAY"

#
aws ec2 create-route \
  --route-table-id "$AWS_EC2_PUBLIC_ROUTE_TABLE" \
  --destination-cidr-block '0.0.0.0/0' \
  --gateway-id "$AWS_EC2_INTERNET_GATEWAY"
```
