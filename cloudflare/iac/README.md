# Cloudflare

## Links

- [Code Repository](https://github.com/cloudflare/terraform-provider-cloudflare)
- [Terraform Registry](https://registry.terraform.io/providers/cloudflare/cloudflare/latest)

## Glossary

- Virtual Private Clouds (VCP)

## Usage

```env
TF_VAR_cloudflare_api_key=
TF_VAR_cloudflare_email=
```

```tf
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.31.0"
    }
  }

  required_version = "~> 1.3.5"
}

provider "cloudflare" {
  alias   = "target"
  api_key = var.cloudflare_api_key
  email   = var.cloudflare_email
}

module "cloudflare" {
  source = "./modules/cloudflare"

  providers = {
    cloudflare = cloudflare.target
  }

  zone_name = var.cloudflare_zone_name
}

variable "cloudflare_api_key" {
  description = "The Cloudflare API key to use for authentication"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "The Cloudflare email to use for authentication"
  type        = string
}

variable "cloudflare_zone_name" {
  description = "The Cloudflare zone name to use for authentication"
  type        = string
  default     = "londonbridge.dev"
}
```
