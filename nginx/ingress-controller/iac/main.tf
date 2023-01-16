resource "helm_release" "ingress_controller" {
  name = "ingress-controller"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  version    = "4.4.2"
  values     = [local.values]
  timeout    = var.helm_timeout

  create_namespace = var.create_namespace
}

# resource "time_sleep" "wait_10_seconds" {
#   depends_on = [helm_release.ingress_controller]

#   create_duration = "10s"

#   provisioner "local-exec" {
#     command = "kubectl delete ValidatingWebhookConfiguration ingress-controller-ingress-nginx-admission"
#   }
#
