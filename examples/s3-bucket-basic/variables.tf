variable "project_name" {
  description = "Project identifier used by the labels module for naming and tagging."
  type        = string
  default     = "artifact-store"
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

variable "bucket_suffix" {
  description = "Suffix appended to the labels prefix when building the bucket name."
  type        = string
  default     = "artifacts"
}

variable "bucket_name_override" {
  description = "Optional explicit bucket name. Leave null to use the default naming pattern."
  type        = string
  default     = null
}
