# AWS ALB

## Links

- [Code Repository](https://github.com/terraform-aws-modules/terraform-aws-alb)
- [Terraform Registry](https://registry.terraform.io/modules/terraform-aws-modules/alb/aws/latest)

## Glossary

- Application Load Balancer (ALB)

## Usage

```tf
module "alb" {
  source = "./modules/alb"

  providers = {
    aws = aws.target
  }

  name_prefix = var.name_prefix
  workspace   = var.workspace

  alb_vpc_id             = module.vpc.vpc_id
  alb_public_subnets_ids = module.vpc.public_subnets

  depends_on = [module.eks]
}
```
