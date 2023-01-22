resource "helm_release" "this" {
  name = local.name

  repository = "https://charts.external-secrets.io"
  chart      = local.name
  namespace  = local.namespace
  version    = "0.7.2"
  values     = [local.values]
  timeout    = var.helm_timeout

  create_namespace = var.create_namespace
}

module "external_secrets_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.10.0"

  role_name_prefix = "external-secrets-"
  role_description = "IRSA role for external secrets"

  attach_external_secrets_policy = true

  oidc_providers = {
    main = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["${local.namespace}:${local.name}"]
    }
  }
}

resource "kubernetes_manifest" "this" {
  manifest = {
    apiVersion = "external-secrets.io/v1beta1"
    kind       = "ClusterSecretStore"

    metadata = {
      "name" = "aws-secret-store"
    }

    spec = {
      provider = {
        aws = {
          service = "SecretsManager"
          region  = var.aws_region

          auth = {
            jwt = {
              serviceAccountRef = {
                name      = local.name
                namespace = local.namespace
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    helm_release.this,
    module.external_secrets_irsa
  ]
}
