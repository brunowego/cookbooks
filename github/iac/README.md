# GitHub IaC

## Links

- [Code Repository](https://github.com/integrations/terraform-provider-github)
- [Terraform Registry](https://registry.terraform.io/providers/integrations/github/latest)

## Issues

### Missing GitHub Token

```log
│ Error: this resource can only be used in the context of an organization, "" is a user
│
│   with module.membership.github_membership.users["brunowego"],
│   on modules/membership/main.tf line 1, in resource "github_membership" "users":
│    1: resource "github_membership" "users" {
```

```sh
export TF_VAR_github_token=<github-token>
```

```tf
provider "github" {
  alias = "target"
  owner = var.github_owner
  token = var.github_token
}
```

### TBD

```log
│ Error: this resource can only be used in the context of an organization, "<org>" is a user
│
│   with module.membership.github_membership.users["brunowego"],
│   on modules/membership/main.tf line 1, in resource "github_membership" "users":
│    1: resource "github_membership" "users" {
```

TODO
