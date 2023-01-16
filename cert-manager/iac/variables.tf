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
