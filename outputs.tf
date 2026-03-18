output "account_id" {
  description = "AWS account ID resolved from the active credentials."
  value       = data.aws_caller_identity.current.account_id
}

output "current_region" {
  description = "AWS region used by the default provider for this run."
  value       = data.aws_region.current.region
}

output "name_prefix" {
  description = "Normalized naming prefix built from project and environment."
  value       = module.labels.name_prefix
}

output "common_tags" {
  description = "Baseline tags applied to provider default_tags and future resources."
  value       = module.labels.tags
}
