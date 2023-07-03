# Terraform Apply

## Usage

```sh
#
terraform state list

#
terraform plan -target module.<module_name>.<resource_type>
terraform plan -target 'module.<module_name>.<resource_type>[<index>]'

#
terraform apply -target module.<module_name>.<resource_type>
terraform apply -target 'module.<module_name>.<resource_type>[<index>]'
```
