# Terraform Scaffold

<!-- ```sh
#
cat << EOF >> ./.devops/terraform/.gitignore
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

````sh
#
mkdir -p ./.devops/terraform/{modules,policies,vars}

#
cat << \EOF > ./.devops/terraform/.gitignore
/.terraform
/.terraform.lock.hcl
EOF

#
cat << \EOF > ./.devops/terraform/locals.tf
locals {
  tags = {
    app_name   = var.app_name,
    app_env    = var.app_env,
    managed-by = "terraform"
  }
}
EOF

#
cat << \EOF > ./.devops/terraform/main.tf
terraform {
  backend "remote" {
    organization = "my-company"
    workspaces {
      prefix = "<project>-<app-name>-<region>-"
    }
  }
}
EOF

#
cat << \EOF > ./.devops/terraform/outputs.tf

EOF

#
cat << \EOF > ./.devops/terraform/provider.tf
provider "aws" {
  region = var.aws_region
}
EOF

#
cat << \EOF > ./.devops/terraform/variables.tf

EOF

#
cat << EOF > ./.devops/terraform/versions.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46"
    }
  }
  required_version = "~> 1.3.4"
}
EOF

#
cat << \EOF > ./.devops/terraform/README.md
# Terraform

## Running

```sh
#
cd ./.devops/terraform

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
```
EOF
````

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
