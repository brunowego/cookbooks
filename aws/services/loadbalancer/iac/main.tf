module "security-group" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 4.16.2"

  name   = "${local.cluster_name}-sg-http"
  vpc_id = var.alb_vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name               = "${local.cluster_name}-alb"
  load_balancer_type = var.load_balancer_type

  vpc_id          = var.alb_vpc_id
  subnets         = var.alb_public_subnets_ids
  security_groups = [module.security-group.security_group_id]

  target_groups = [
    {
      name_prefix      = var.name_prefix
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = local.tags
}
