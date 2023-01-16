variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "Name prefix to be used on all the resources as identifier"
  type        = string
}

variable "workspace" {
  description = "Name of the workspace to be used on all the resources as identifier"
  type        = string
}

variable "load_balancer_type" {
  description = "The type of load balancer to create. The default value is application"
  type        = string
  default     = "application"
}

variable "alb_vpc_id" {
  description = "VPC ID of the ALB to be provisioned into"
  type        = string
  default     = null
}

variable "alb_public_subnets_ids" {
  description = "ALB VPC public subnets IDs"
  type        = list(string)
  default     = []
}
