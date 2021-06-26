# Terraform Provider for AWS

<!--
https://registry.terraform.io/modules/terraform-aws-modules/pricing/aws/latest
-->

## Links

- [Code Repository](https://github.com/hashicorp/terraform-provider-aws)

## Guides

- [Overview](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## Issues

<!-- ### AWS SSO

https://github.com/hashicorp/terraform-provider-aws/issues/19716

```log
Error: error configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.
```

```sh
#
export AWS_SHARED_CREDENTIALS_FILE="/Users/${USER}/.aws/credentials"
export AWS_PROFILE='default'

#
terraform plan
```

```sh
#
export AWS_ACCESS_KEY_ID="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.AccessKeyId)"
export AWS_SECRET_ACCESS_KEY="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.SecretAccessKey)"
export AWS_SESSION_TOKEN="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.SessionToken)"

#
terraform plan
```

```sh
#
export TF_VAR_${provider_alias}_aws_access_key="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.AccessKeyId)"
export TF_VAR_${provider_alias}_aws_secret_key="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.SecretAccessKey)"
export TF_VAR_${provider_alias}_aws_session_token="$(cat ~/.aws/cli/cache/*.json | jq .Credentials.SessionToken)"

#
terraform plan
``` -->

<!-- ###

```log
Error: error configuring Terraform AWS Provider: error validating provider credentials: error calling sts:GetCallerIdentity: InvalidClientTokenId: The security token included in the request is invalid.
	status code: 403, request id: [uuid]
```

```sh
#
aws sts get-caller-identity

#
terraform plan
``` -->
