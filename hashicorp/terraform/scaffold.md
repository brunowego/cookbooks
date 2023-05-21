# Terraform Scaffold

<!-- ```sh
#
cat << EOF >> ./.infra/terraform/.gitignore
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
mkdir -p ./.infra/terraform/{modules,policies,vars}

#
cat << EOF > ./.infra/terraform/.gitignore
/.terraform
/.terraform.lock.hcl
EOF

#
echo '1.3.5' > ./.infra/terraform/.terraform-version

#
cat << EOF > ./.infra/terraform/locals.tf
locals {
  tags = {
    managed-by = "terraform"
  }
}
EOF

#
cat << EOF > ./.infra/terraform/main.tf
terraform {
  # backend "local" {}

  backend "remote" {
    organization = "my-company"

    workspaces {
      prefix = "<project>-<app-name>-<region>-"
    }
  }
}
EOF

#
cat << EOF > ./.infra/terraform/outputs.tf

EOF

#
cat << EOF > ./.infra/terraform/provider.tf
# provider "aws" {
#   region = var.aws_region
# }
EOF

#
cat << EOF > ./.infra/terraform/variables.tf

EOF

#
cat << EOF > ./.infra/terraform/versions.tf
terraform {
  # required_providers {
  #   aws = {
  #     source  = "hashicorp/aws"
  #     version = "~> 3.46"
  #   }
  # }

  required_version = "~> 1.3.5"
}
EOF
```

```sh
#
cat << EOF > ./.infra/terraform/README.md
# Terraform

## Running

TBD
EOF
```

<!--
#
cd ./.infra/terraform

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

```

```
