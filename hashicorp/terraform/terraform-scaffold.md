# Terraform Scaffold

## Structure

````sh
#
mkdir -p ./.terraform

#
cat << \EOF > ./.terraform/.gitignore
/.terraform
/.terraform.lock.hcl
EOF

#
cat << \EOF > ./.terraform/locals.tf
locals {
  tags = {
    app_name   = var.app_name,
    app_env    = var.app_env,
    managed-by = "terraform"
  }
}
EOF

#
cat << \EOF > ./.terraform/main.tf
terraform {
  backend "remote" {
    organization = "my-company"
    workspaces {
      prefix = "project-my-app-us-east-1-"
    }
  }
}
EOF

#
cat << \EOF > ./.terraform/outputs.tf

EOF

#
cat << \EOF > ./.terraform/provider.tf
provider "aws" {
  region = var.aws_region
}
EOF

#
cat << \EOF > ./.terraform/variables.tf

EOF

#
cat << EOF > ./.terraform/versions.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46"
    }
  }
  required_version = "~> 0.14.7"
}
EOF

#
cat << \EOF > ./.terraform/README.md
# Terraform

## Running

```sh
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
