locals {
  name      = "external-secrets"
  namespace = "security"

  values = yamlencode({
    serviceAccount = {
      annotations = {
        "eks.amazonaws.com/role-arn" = module.external_secrets_irsa.iam_role_arn
      }

      extraLabels = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/name"      = "external-secrets"
      }
    }
  })
}
