# Terraform

<!--
https://github.com/hashicorp/learn-boundary-azure-sql-database
-->

## Dependencies

- Identity Provider (IdP)
  - [Keycloak](/keycloak/iac/README.md)
- [HashiCorp Boundary](../README.md#cli)

## Running

```sh
#
export TF_VAR_keycloak_client_secret='<secret>'

#
terraform init

#
terraform plan

#
terraform apply
```
