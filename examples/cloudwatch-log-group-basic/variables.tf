variable "project_name" {
  description = "Project identifier used by the labels module for naming and tagging."
  type        = string
  default     = "payments"
}

variable "environment" {
  description = "Environment label included in names and tags."
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner or team responsible for this example deployment."
  type        = string
  default     = "platform-team"
}

variable "cost_center" {
  description = "Cost allocation reference used in tags."
  type        = string
  default     = "shared-services"
}

variable "aws_region" {
  description = "AWS region used by this example."
  type        = string
  default     = "us-east-1"
}

variable "log_group_suffix" {
  description = "Suffix appended to the labels prefix to build the CloudWatch log group name."
  type        = string
  default     = "application"
}

variable "retention_in_days" {
  description = "CloudWatch Logs retention period for the example log group."
  type        = number
  default     = 30
}
