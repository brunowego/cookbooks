# Terraform Workspace

## Commands

```sh
terraform workspace -h
```

## Usage

```sh
#
terraform workspace list

#
terraform workspace new <ws-name> # dev, uat, pre-prod, prod

#
terraform workspace show <ws-name>

#
terraform workspace select <ws-name>

#
terraform workspace delete <ws-name>
```