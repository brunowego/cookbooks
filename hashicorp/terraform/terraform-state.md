# Terraform State

## Usage

```sh
#
terraform state pull > ./terraform.tfstate

#
az storage fs file download \
  --account-name <storage> \
  --file-system <container> \
  --path terraform.tfstate \
  --destination ./terraform.tfstate
```

<!--
#
aws s3 cp s3://path/to/terraform.tfstate -
-->
