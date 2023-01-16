# AWS VPC

## Issues

### TBD

```log
│ Error: Invalid count argument
│
│   on .terraform/modules/vpc.vpc/main.tf line 360, in resource "aws_subnet" "public":
│  360:   count = local.create_vpc && length(var.public_subnets) > 0 && (false == var.one_nat_gateway_per_az || length(var.public_subnets) >= length(var.azs)) ? length(var.public_subnets) : 0
│
│ The "count" value depends on resource attributes that cannot be determined until apply, so Terraform cannot predict how many instances will be
│ created. To work around this, use the -target argument to first apply only the resources that the count depends on.
```

TODO

```sh
terraform apply -target module.module-1.aws_instance.ec2_example
terraform apply -target 'module.vpc.aws_subnet.public[0]'
terraform apply -target 'module.vpc'
```
