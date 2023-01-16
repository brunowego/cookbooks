locals {
  values = yamlencode({
    controller = {
      # config = {
      #   use-forwarded-headers = "true"
      # }

      ingressClassResource = {
        default = true
      }

      # publishService = {
      #   enabled = false
      # }

      # extraArgs = {
      #   "publish-status-address" = format("%s.elb.us-east-1.amazonaws.com", var.name_prefix, var.workspace)
      # }

      nodeSelector = {
        # "ingress-ready"    = "true"
        "kubernetes.io/os" = "linux"
        "role"             = "ondemand"
      }

      service = {
        # type = "LoadBalancer"

        # externalTrafficPolicy = "Cluster"

        annotations = {
          # Traffic Routing
          "service.beta.kubernetes.io/aws-load-balancer-name"            = var.eks_cluster_name
          "service.beta.kubernetes.io/aws-load-balancer-type"            = "external"
          "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"

          # Health Check Settings
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-protocol"            = "http"
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-port"                = "traffic-port"
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-path"                = "/index.html"
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-healthy-threshold"   = 3
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-unhealthy-threshold" = 3
          # "service.beta.kubernetes.io/aws-load-balancer-healthcheck-interval"            = 10

          # Access Control
          # "service.beta.kubernetes.io/load-balancer-source-ranges" = "0.0.0.0/0"
          "service.beta.kubernetes.io/aws-load-balancer-scheme" = "internet-facing"

          # External DNS - For creating a Record Set in Route53
          # "external-dns.alpha.kubernetes.io/hostname" = "nlb.${var.domain}"
          # "external-dns.alpha.kubernetes.io/cloudflare-proxied" = "true"
        }
      }

      # admissionWebhooks = {
      #   enabled = true
      # }
    }
  })
}
