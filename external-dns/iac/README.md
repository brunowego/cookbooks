# External DNS

## Usage

```tf
locals {
  values = yamlencode({
    env = [
      {
        name  = "CF_API_KEY"
        value = var.cloudflare_api_key
      },
      {
        name  = "CF_API_EMAIL"
        value = var.cloudflare_email
      },
    ]

    domainFilters = var.cloudflare_domain_filters

    provider = "cloudflare"
  })
}
```
