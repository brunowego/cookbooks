# Kubernetes Provider

## Configuration

**Refer:** `./provider.tf`

```tf
provider "kubernetes" {
  config_path = "~/.kube/config"
}
```

**Refer:** `./versions.tf`

```tf
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.23.0"
    }
  }
}
```
