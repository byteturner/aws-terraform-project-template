locals {
  normalized_project_name = lower(replace(trimspace(var.project_name), "/[^a-zA-Z0-9-]/", "-"))
  normalized_environment  = lower(replace(trimspace(var.environment), "/[^a-zA-Z0-9-]/", "-"))

  name_prefix = "${local.normalized_project_name}-${local.normalized_environment}"

  tags = merge(
    {
      Project     = local.normalized_project_name
      Environment = local.normalized_environment
      Owner       = lower(trimspace(var.owner))
      CostCenter  = lower(trimspace(var.cost_center))
      ManagedBy   = "Terraform"
    },
    var.additional_tags
  )
}
