variable "project_name" {
  description = "Project identifier used for naming and tagging."
  type        = string
  default     = "aws-platform"

  validation {
    condition = (
      length(var.project_name) >= 3 &&
      length(var.project_name) <= 30 &&
      can(regex("^[A-Za-z0-9][A-Za-z0-9-]*[A-Za-z0-9]$", var.project_name))
    )
    error_message = "project_name must be 3-30 characters, start and end with alphanumeric characters, and may include hyphens."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be one of: dev, stage, prod."
  }
}

variable "aws_region" {
  description = "AWS region used by the default provider."
  type        = string
  default     = "us-east-1"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "aws_region must look like a valid AWS region identifier, such as us-east-1."
  }
}

variable "owner" {
  description = "Owner or team responsible for resources managed by this root module."
  type        = string
  default     = "platform-team"
}

variable "cost_center" {
  description = "Cost allocation reference applied to resource tags."
  type        = string
  default     = "shared-services"
}

variable "additional_tags" {
  description = "Additional tags merged into the common tagging baseline."
  type        = map(string)
  default     = {}
}
