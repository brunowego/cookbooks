locals {
  namespace = "cert-system"

  values = yamlencode({
    installCRDs = true

    # serviceAccount = {
    #   annotations = {
    #     "eks.amazonaws.com/role-arn" = module.cert_manager_irsa.iam_role_arn
    #   }
    # }

    ingressShim = {
      defaultIssuerKind = "ClusterIssuer"
      defaultIssuerName = "letsencrypt-issuer"
    }

    prometheus = {
      enabled = false
    }
  })
}
