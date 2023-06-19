# Terraform Visual

## Links

- [Code Repository](https://github.com/hieven/terraform-visual)
- [Main Website](https://hieven.github.io/terraform-visual)

## CLI

### Installation

```sh
# Using npm
npm install @terraform-visual/cli -g
```

### Commands

```sh
terraform-visual -h
```

### Usage

```sh
#
terraform plan -out ./plan.out

#
terraform show -json ./plan.out > ./plan.json

#
terraform-visual --plan ./plan.json

#
open ./terraform-visual-report/index.html
```
