terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.31.0"
    }
  }
  required_version = "~> 1.3.5"
}
