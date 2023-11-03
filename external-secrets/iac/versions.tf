terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8.0"
    }
  }

  required_version = "~> 1.3.5"
}
