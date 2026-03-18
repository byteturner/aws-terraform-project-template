output "name_prefix" {
  description = "Normalized name prefix from the labels module."
  value       = module.labels.name_prefix
}

output "bucket_name" {
  description = "Name of the example S3 bucket."
  value       = module.bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN of the example S3 bucket."
  value       = module.bucket.bucket_arn
}
