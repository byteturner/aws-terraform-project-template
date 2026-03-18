output "name_prefix" {
  description = "Normalized prefix composed of project and environment."
  value       = local.name_prefix
}

output "tags" {
  description = "Baseline tag map merged with additional_tags."
  value       = local.tags
}

output "normalized_project_name" {
  description = "Normalized project name used by the module."
  value       = local.normalized_project_name
}
