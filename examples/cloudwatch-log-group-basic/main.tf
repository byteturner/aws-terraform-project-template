locals {
  log_group_name = "/aws/${module.labels.name_prefix}/${var.log_group_suffix}"
}

module "labels" {
  source = "../../modules/labels"

  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
  cost_center  = var.cost_center
}

module "log_group" {
  source = "../../modules/cloudwatch-log-group"

  name              = local.log_group_name
  retention_in_days = var.retention_in_days
  tags              = module.labels.tags
}
