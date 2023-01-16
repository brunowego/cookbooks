locals {
  cluster_name = format("%s-%s", var.name_prefix, var.workspace)

  tags = merge({
    name_prefix = var.name_prefix,
    workspace   = var.workspace,
    Name        = local.cluster_name
  }, var.tags)
}
