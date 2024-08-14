# Terragrunt

<!--
https://github.com/warrensbox/tgswitch
-->

**Keywords:** Terraform

## Links

- [Code Repository](https://github.com/gruntwork-io/terragrunt)
- [Main Website](https://terragrunt.gruntwork.io)

## CLI

### Installation

#### Homebrew

```sh
brew install terragrunt
```

### Linux Binary

```sh
curl \
  -L 'https://github.com/gruntwork-io/terragrunt/releases/download/v0.31.7/terragrunt_linux_amd64' \
  -o /usr/local/bin/terragrunt && \
    sudo chmod +x /usr/local/bin/terragrunt
```

### Commands

```sh
terragrunt -h
```

### Usage

```sh
#
terragrunt validate
terragrunt validate-all

#
terragrunt plan
terragrunt plan-all

#
terragrunt apply
terragrunt apply-all

#
terragrunt destroy
terragrunt destroy-all
```
