variable "helm_timeout" {
  description = "Timeout for helm release"
  type        = string
  default     = 900
}

variable "create_namespace" {
  description = "Create namespace"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "The AWS region to use for the cluster"
  type        = string
}

variable "eks_oidc_provider_arn" {
  description = "ARN of the OIDC provider for the EKS cluster"
  type        = string
}
