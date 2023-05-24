# resource "aws_iam_policy" "this" {
#   name        = "cert_manager_policy"
#   path        = "/"
#   description = "Policy, which allows CertManager to create Route53 records"

#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Action" : "route53:GetChange",
#         "Resource" : "arn:aws:route53:::change/*"
#       },
#       {
#         "Effect" : "Allow",
#         "Action" : [
#           "route53:ChangeResourceRecordSets",
#           "route53:ListResourceRecordSets"
#         ],
#         "Resource" : "arn:aws:route53:::hostedzone/${var.hosted_zone_id}"
#       },
#     ]
#     }
#   )
# }

# module "cert_manager_irsa" {
#   source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
#   version = "~> 5.10.0"

#   create_role                   = true
#   oidc_fully_qualified_subjects = ["system:serviceaccount:${local.namespace}:cert-manager"]
#   provider_url                  = var.eks_cluster_oidc_issuer_url
#   role_name_prefix              = "cert-manager-"
#   role_description              = "IRSA role for cert-manager"
#   role_policy_arns              = [aws_iam_policy.this.arn]
# }

resource "helm_release" "this" {
  name = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = local.namespace
  version    = "v1.11.0"
  values     = [local.values]
  timeout    = var.helm_timeout

  create_namespace = var.create_namespace
}

resource "kubernetes_manifest" "this" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"

    metadata = {
      "name" = "letsencrypt-issuer"
    }

    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = "devops@xyz.tld"

        privateKeySecretRef = {
          name = "letsencrypt-issuer"
        }

        solvers = [
          {
            http01 = {
              ingress = {
                class = "nginx"
              }
            }
          }
        ]
      }
    }
  }

  depends_on = [
    helm_release.this
  ]
}
