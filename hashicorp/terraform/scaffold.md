# Terraform Scaffold

<!-- ```sh
#
cat << EOF >> ./.gitignore
/.terraform
/terraform.tfstate.d
/*.tfplan
/*.tfstate
/*.tfvars
EOF
``` -->

<!--
terraform.tfvars.example
-->

## Structure

```sh
#
mkdir -p ./.infra/terraform

#
cd ./.infra/terraform

#
mkdir -p ./{modules,policies,vars}

#
cat << EOF > ./.gitignore
/.terraform
/.terraform.lock.hcl
/terraform.tfstate*
EOF

#
curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v'

#
echo '1.7.5' > ./.terraform-version

#
cat << EOF > ./locals.tf
# locals {
#   tags = {
#     managed-by = "terraform"
#   }
# }
EOF

#
cat << EOF > ./main.tf
terraform {
  backend "local" {}

  # backend "remote" {
  #   organization = "my-company"

  #   workspaces {
  #     prefix = "<project>-"
  #     # prefix = "<project>-<app-name>-"
  #     # prefix = "<project>-<app-name>-<region>-"
  #   }
  # }
}
EOF

#
cat << EOF > ./outputs.tf

EOF

#
cat << EOF > ./provider.tf
# provider "aws" {
#   region = var.aws_region
# }
EOF

#
cat << EOF > ./variables.tf

EOF

#
cat << EOF > ./versions.tf
terraform {
  required_version = "~> 1.7.5"

  # required_providers {
  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "~> 3.46"
  #   }
  # }
}
EOF
```

```sh
#
cat << EOF > ./README.md
# Infra

## Docs

- [Developer Guide](/DEVELOPER.md)
```

```sh
#
cat << EOF > ./DEVELOPER.md
# Developer Guide

## Dependencies

- [tfenv](https://github.com/tfutils/tfenv)

## Local Development

sh
#
tfenv install
tfenv use

#
terraform -v

#
terraform init

#
terraform validate

#
terraform plan

#
terraform apply
EOF
```

<!--
#
cd .

#
terraform init

#
terraform workspace list

#
terraform workspace select stg
terraform workspace select prd

#
terraform validate

#
terraform plan \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars"

#
terraform apply \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars"

#
terraform state list

#
terraform output
-->

## Tips

### Ignore Changes

```tf
resource "..." "..." {
  # ...

  lifecycle {
    ignore_changes = [
      spec.0.sync_policy.0.retry
    ]
  }
}
```
