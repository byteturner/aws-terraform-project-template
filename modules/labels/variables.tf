variable "project_name" {
  description = "Project identifier used as the base for normalized naming and tags."
  type        = string

  validation {
    condition = (
      length(trimspace(var.project_name)) >= 3 &&
      length(trimspace(var.project_name)) <= 30
    )
    error_message = "project_name must be between 3 and 30 characters."
  }
}

variable "environment" {
  description = "Environment label used in names and tags."
  type        = string

  validation {
    condition     = length(trimspace(var.environment)) > 0
    error_message = "environment must not be empty."
  }
}

variable "owner" {
  description = "Owner or team responsible for resources."
  type        = string

  validation {
    condition     = length(trimspace(var.owner)) > 0
    error_message = "owner must not be empty."
  }
}

variable "cost_center" {
  description = "Cost allocation reference for tagging."
  type        = string

  validation {
    condition     = length(trimspace(var.cost_center)) > 0
    error_message = "cost_center must not be empty."
  }
}

variable "additional_tags" {
  description = "Additional tags merged into the baseline tag map."
  type        = map(string)
  default     = {}
}
