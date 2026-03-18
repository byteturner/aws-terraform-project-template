output "name_prefix" {
  description = "Normalized name prefix from the labels module."
  value       = module.labels.name_prefix
}

output "log_group_name" {
  description = "Name of the example CloudWatch log group."
  value       = module.log_group.name
}

output "log_group_arn" {
  description = "ARN of the example CloudWatch log group."
  value       = module.log_group.arn
}
