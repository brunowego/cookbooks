# Terraform Import

## Links

- [Command: import](https://developer.hashicorp.com/terraform/cli/commands/import)

## CLI

### Commands

```sh
terraform import -h
```

### Usage

```sh
#
terraform state list

#
terraform state show '<resource-addr>'

#
terraform import \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars" \
  '<resource-addr>' \
  '<resource-id>'
```

<!--
terraform init

https://github.com/aws-samples/aws2tf

https://github.com/hashicorp/learn-terraform-import

terraform import --var-file="terraform.tfvars" "module.vpc.aws_route_table.private[2]"
-->
