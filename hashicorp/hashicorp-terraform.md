# HashiCorp Terraform

<!--
https://github.com/aaratn/terraenv

https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

https://github.com/srebrasil/IaC-Demo

https://github.com/dhinojosa/spinnaker-study/tree/master/terraform

https://app.pluralsight.com/paths/skill/managing-infrastructure-with-terraform
https://app.pluralsight.com/paths/certificate/hashicorp-certified-terraform-associate

https://www.linkedin.com/learning/search?entityType=COURSE&keywords=terraform

https://www.hashicorp.com/certification/terraform-associate

https://www.youtube.com/watch?v=OXE2a8dqIAI

https://github.com/semi-technologies/weaviate-infra
https://github.com/Artemmkin/terraform-kubernetes
https://github.com/terraform-providers/terraform-provider-azurerm

Core/State
Providers (AWS: EC2, Users|Kubernetes: Services)
Resource (VPC/Kubernetes Namespace)

Declarative vs. Imperative

What does declarative mean exactly?

What does Imperative mean exactly?
- check delta

Version v0.11.10
Version v0.15.1

https://github.com/philophilo/tech_infra
https://github.com/inayuky/terraform-qiita-search

variable
provider
data
resource
output
-->

**Keywords:** Infrastructure as Code, Infrastructure Provisioning

## References

- [Releases](https://releases.hashicorp.com/terraform/)

## Architecture

### Phrases

- Provisioning infrastructure through software to achieve consistent and predictable environments.

### Core Concepts

- Defined in code
- Stored in source control
- Declarative or imperative
- Idempotent and consistent
- Push or pull

### Components

- Terraform executable
- Terraform files (files `.tf`)
- Terraform plugins
- Terraform state

### Terraform State

- JSON format (Do not touch!)
- Resources mappings and metadata
- Locking
- Location
  - Local
  - Remote: AWS, Azure, NFS, Terraform Cloud
- Workspaces

## CLI

### Dependencies

#### APT

- [cURL](/curl.md)
- [GNU Privacy Guard](/gnupg.md)
- [lsb-release](/lsb-release.md)
- [software-properties-common](/software-properties-common.md)

### Installation

#### Homebrew

```sh
brew install terraform
```

#### APT

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | \
  sudo apt-key add -

sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update
sudo apt -y install terraform
```

#### Chocolatey

```sh
choco install terraform
```

### Commands

```sh
terraform -h
```

### Configuration

```sh
cat << EOF >> ./gitignore
/terraform.tfstate.d
/*.tfplan
/*.tfstate
/*.tfvars
EOF
```

<!--
terraform.tfvars.example
-->

### Usage

```sh
#
terraform workspace list

#
terraform workspace new dev # uat, prod

#
terraform workspace select dev

#
terraform refresh

#
terraform init .
terraform init \
  -backend-config key=./terraform.tfstate

#
terraform validate

#
terraform fmt

#
terraform plan
terraform plan \
  -out ./dev.tfplan

#
terraform plan \
  -state './dev/dev.state' \
  -var-file './common.tfvars' \
  -var-file './dev/dev.tfvars'

#
terraform plan -var '[variable]=[value]'

#
terraform apply
terraform apply -auto-approve
terraform apply ./dev.tfplan

#
terraform console

#
terraform show

#
terraform output

#
terraform destroy
terraform destroy -auto-approve
```

### Tips

#### Generate Graphing

**Dependencies:** [Graphviz](/graphviz.md)

```sh
#
terraform graph

#
terraform graph | dot -Tpng > graph.png
terraform graph | dot -Tsvg > graph.svg
```

#### Visual Studio Code

```sh
# Install
code --install-extension hashicorp.terraform
```

<!--
## Interview

https://www.youtube.com/watch?v=uFaMUS6Z9fI
-->
