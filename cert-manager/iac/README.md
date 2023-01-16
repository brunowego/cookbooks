# Cert Manager (cert-manager)

## Links

- [Code Repository](https://github.com/cert-manager/cert-manager)
- [Terraform Registry](https://registry.terraform.io/providers/hashicorp/helm/latest)

## Usage

**Refer:** `main.tf`

```tf
module "cert-manager" {
  source = "./modules/cert-manager"

  providers = {
    helm = helm.target
  }
}
```
