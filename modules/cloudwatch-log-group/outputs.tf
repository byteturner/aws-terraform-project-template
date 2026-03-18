output "name" {
  description = "Name of the CloudWatch log group."
  value       = aws_cloudwatch_log_group.this.name
}

output "arn" {
  description = "ARN of the CloudWatch log group."
  value       = aws_cloudwatch_log_group.this.arn
}

output "id" {
  description = "ID of the CloudWatch log group."
  value       = aws_cloudwatch_log_group.this.id
}
