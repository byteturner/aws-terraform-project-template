locals {
  default_bucket_name = "${module.labels.name_prefix}-${var.bucket_suffix}"
  bucket_name         = coalesce(var.bucket_name_override, local.default_bucket_name)
}

module "labels" {
  source = "../../modules/labels"

  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
  cost_center  = var.cost_center
}

module "bucket" {
  source = "../../modules/s3-bucket"

  bucket_name = local.bucket_name
  tags        = module.labels.tags
}
