# Terraform State

## Usage

```sh
# List
terraform state list

# Move
terraform state mv <source> <destination>

# Remove
terraform state rm <name>
```

<!--
terraform state pull > ./terraform.tfstate

aws s3 cp s3://path/to/terraform.tfstate -

az storage fs file download \
  --account-name <storage> \
  --file-system <container> \
  --path terraform.tfstate \
  --destination ./terraform.tfstate
-->
