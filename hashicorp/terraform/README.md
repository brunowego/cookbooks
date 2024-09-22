# HashiCorp Terraform

<!--
registry.terraform.io
-->

<!--
sensitive = true

https://github.com/im2nguyen/rover

https://github.com/resource-watch/api-infrastructure

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet

https://github.com/cloudposse/tfenv

https://github.com/resource-watch/api-infrastructure

https://github.com/hashicorp/terraform/issues/13022

https://github.com/aaratn/terraenv

https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

https://github.com/srebrasil/IaC-Demo

https://github.com/dhinojosa/spinnaker-study/tree/master/terraform

https://app.pluralsight.com/paths/skill/managing-infrastructure-with-terraform
https://app.pluralsight.com/paths/certificate/hashicorp-certified-terraform-associate

https://linkedin.com/learning/search?entityType=COURSE&keywords=terraform

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

./.terraform
-->

**Keywords:** Infrastructure as Code, Infrastructure Provisioning

## For AWS

- [AWS Cloud Development Kit (CDK)](/aws/aws-cdk.md)
- [AWS CloudFormation (CF)](/aws/aws-cf.md)

## Links

- [Code Repository](https://github.com/hashicorp/terraform)
- [Main Website](https://terraform.io/)
- [Terraform Cloud](https://app.terraform.io)
- [Status Page](https://status.hashicorp.com)
- [Releases](https://releases.hashicorp.com/terraform/)

## References

- [Releases](https://releases.hashicorp.com/terraform/)

## Tools

- [Brainboard](https://brainboard.co)
- [Pluralith](/pluralith.md)

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
- [GNU Privacy Guard](/gnu/pg.md)
- [lsb-release](/lsb-release.md)
- [software-properties-common](/apt/software-properties-common.md)

### Installation

**Refer:** [Terraform Version Manager](./version-manager.md)

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
#
terraform login app.terraform.io

cat ~/.terraform.d/credentials.tfrc.json
```

<!--
export TERRAFORM_TOKEN='<token>'
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
terraform init ./
# or
terraform init ./ -upgrade
# or
terraform init \
  -backend-config key=./terraform.tfstate \
  ./

#
terraform validate

#
terraform fmt

#
terraform providers

#
terraform plan
terraform plan \
  -out ./dev.tfplan

#
terraform plan \
  -state './.terraform/dev/dev.state' \
  -var-file './.terraform/common.tfvars' \
  -var-file './.terraform/dev/dev.tfvars'

#
terraform plan -var '<variable>=<value>'
terraform plan -target '<module>'

#
terraform apply
terraform apply -auto-approve
terraform apply ./dev.tfplan

#
terraform state list
terraform state show '<module>'

# REPL
terraform console

#
terraform show

#
terraform output
terraform output <name>

#
terraform destroy
terraform destroy -auto-approve

#
terraform logout
```

### Tips

#### Autocomplete

```sh
#
terraform -install-autocomplete

#
autoload -Uz compinit && compinit
```

#### Force State Unlock

```sh
terraform force-unlock <hash>
```

#### Apply Specific State

```sh
#
terraform state list

#
terraform apply \
  -target '<state>' \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars"
```

#### Remove Specific State

```sh
#
terraform state list

#
terraform state rm '<state>'
```

#### Destroy Specific State

```sh
#
terraform state list

#
terraform destroy \
  -target '<state>' \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars"
```

**Tip:** Normally "Resource ID" is used in the URL of remote resource.

#### Debug Mode (Verbose)

```sh
TF_LOG=trace \
  terraform <command>
```

<!-- export TF_LOG='DEBUG' -->

#### Environment Variables

```sh
export TF_VAR_region='us-west-1'
export TF_VAR_ami='ami-049d8641'
export TF_VAR_alist='[1,2,3]'
export TF_VAR_amap='{ foo = "bar", baz = "qux" }'
```

#### Visual Studio Code

**Dependencies:** Code format with [Prettier](/prettier.md#visual-studio-code)

```sh
#
code --install-extension HashiCorp.terraform

#
jq '."recommendations" += ["HashiCorp.terraform"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
# jq '."[terraform]"."editor.formatOnSave" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
jq '."[terraform]"."editor.defaultFormatter" |= "hashicorp.terraform"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

#
jq '."files.associations"."*.json.tpl" |= "json"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

<!--
## Interview

https://www.youtube.com/watch?v=uFaMUS6Z9fI
-->

### Issues

#### Wrong Execution Mode

```log
Error: No valid credential sources found
```

<!--
Error: failed to refresh cached credentials, no EC2 IMDS role found, operation error ec2imds: GetMetadata, request canceled, context deadline exceeded
-->

1. [Terraform Organizations](https://app.terraform.io/app/organizations) -> Select Organization
2. Workspaces -> Select Workspace
3. Settings -> General Settings -> Execution Mode -> Local (custom)

#### TBD

```log
│ dial tcp: lookup argocd.k8s.orb.local on [2804:2994:77::10]:53: no such host
│ dial tcp: lookup argocd.k8s.orb.local on 8.8.8.8:53: no such host
```

<!--
Try disable ipv6
Try add address to /etc/hosts
-->

TODO

#### Missing Upgrade

```log
The local name "argocd" in the root module represents provider "oboukili/argocd", but "argocd" in module.argo-cd represents "hashicorp/argocd".
```

```sh
terraform init -upgrade
```

#### TBD

```log
│ Error: Required token could not be found
│
│ Run the following command to generate a token for app.terraform.io:
│     terraform login
```

TODO

<!-- ####

```log
Providers cannot be configured within modules using count, for_each or depends_on.
```

```sh
terraform plan -target 'module.<name>'
``` -->

<!-- ####

https://cloudaffaire.com/faq/terraform-error-refreshing-state-state-data-in-s3-does-not-have-the-expected-content/
https://discuss.hashicorp.com/t/s3-error-when-running-terraform-init/42582
https://iam-j.github.io/iac/corrupted-terraform-backend/

```log
Error refreshing state: state data in S3 does not have the expected content.

This may be caused by unusually long delays in S3 processing a previous state
update.  Please wait for a minute or two and try again. If this problem
persists, and neither S3 nor DynamoDB are experiencing an outage, you may need
to manually verify the remote state and update the Digest value stored in the
DynamoDB table to the following value:
```

Delete dynamodb -->

<!-- ####

```log
Error: Error loading state:
    AuthorizationHeaderMalformed: The authorization header is malformed; the region 'us-east-1' is wrong; expecting 'eu-west-2'
	status code: 400, request id: <hash>, host id: <hash>
```

TODO -->

<!-- ####

```log
Error: error configuring S3 Backend: no valid credential sources for S3 Backend found.
```

TODO -->

#### Incompatibility Version

```log
Warning: Provider source not supported in Terraform v0.12

  on providers.tf line 5, in terraform:
   5:     aws = {
   6:       source  = "hashicorp/aws"
   7:     }

A source was declared for provider aws. Terraform v0.12 does not support the
provider source attribute. It will be ignored.
```

Install Terraform version `>= 1.0.11`.

<!-- ####

```log
Error: rpc error: code = InvalidArgument desc = existing repository spec is different; use upsert flag to force update
```

TODO -->

<!-- ####

```log
Error: Provider produced inconsistent result after apply

When applying changes to module.app_iac.aws_rds_cluster.services, provider
"registry.terraform.io/hashicorp/aws" produced an unexpected new value: Root
resource was present, but now absent.
```

TODO -->

#### Final Snapshot Identifier

```log
Error: RDS Cluster FinalSnapshotIdentifier is required when a final snapshot is required
```

<!-- ```tf
resource "aws_rds_cluster" "aurora_cluster" {
  # ...
  backup_retention_period = 0
  skip_final_snapshot     = true
}
``` -->

```sh
#
terraform state list

#
terraform destroy \
  -target 'module.rds.aws_rds_cluster.aurora_cluster' \
  -var-file "./vars/terraform-$(terraform workspace show).tfvars"
```

#### DNS Problem

```log
Error: Failed to request discovery document: Get "https://app.terraform.io/.well-known/terraform.json": net/http: request canceled (Client.Timeout exceeded while awaiting headers)
```

Try change DNS to `1.1.1.1`.

#### Workspaces not Supported

```log
Failed to get configured named states: workspaces not supported
```

TODO

#### Execution Mode

```log
Error: Unreadable module directory

Unable to evaluate directory symlink: lstat ../../module: no such file or
directory

Error: Failed to read module directory

Module directory  does not exist or cannot be read.
```

1. Go to [Workspaces](https://app.terraform.io/app/[organization]/workspaces)
2. Select the Workspace Name
3. Settings Tab -> General
   - Execution Mode Session -> Select Local
   - Save settings
