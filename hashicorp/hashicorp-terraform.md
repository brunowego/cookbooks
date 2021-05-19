# HashiCorp Terraform

<!--
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

Declarative vs Imperative

What does declarative mean exactly?

What does Imperative mean exactly?
- check delta

Version v0.11.10
Version v0.15.1
-->

<!--
https://github.com/philophilo/tech_infra
https://github.com/inayuky/terraform-qiita-search
-->

**Keywords:** Infrastructure as Code, Infrastructure Provisioning

## References

- [Releases](https://releases.hashicorp.com/terraform/)

## CLI

### Installation

#### Homebrew

```sh
brew install terraform
```

### Commands

```sh
terraform -h
```

### Configuration

```sh
cat << EOF >> ./gitignore
/.terraform
**/.terraform/*
EOF

# *.tfstate
# *.tfstate.*

# crash.log

# *.tfvars

# override.tf
# override.tf.json
# *_override.tf
# *_override.tf.json

# .terraformrc
# terraform.rc
```

### Usage

```sh
#
terraform workspace list
terraform workspace new developement
terraform workspace new production
terraform workspace select developement

#
terraform refresh

#
terraform init
terraform init -backend-config=key=./terraform.tfstate

#
terraform plan
terraform plan -out ./terraform.tfplan

#
terraform apply
terraform apply -auto-approve
terraform apply ./terraform.tfplan

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
