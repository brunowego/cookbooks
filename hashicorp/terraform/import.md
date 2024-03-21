# Terraform Import

## Learn

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
terraform import '<resource-addr>' '<resource-id>'
# or
terraform import \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars" \
  '<resource-addr>' \
  '<resource-id>'
```

<!--
# Kubernetes
terraform import '<resource-addr>' '<kubernetes-name>'

https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest#import-the-resource-state-from-the-cluster
-->
