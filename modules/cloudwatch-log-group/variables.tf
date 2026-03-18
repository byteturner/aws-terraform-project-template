variable "name" {
  description = "Name of the CloudWatch log group to create."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "name must not be empty."
  }
}

variable "retention_in_days" {
  description = "Number of days to retain log events."
  type        = number
  default     = 30

  validation {
    condition = contains([
      1,
      3,
      5,
      7,
      14,
      30,
      60,
      90,
      120,
      150,
      180,
      365,
      400,
      545,
      731,
      1096,
      1827,
      2192,
      2557,
      2922,
      3288,
      3653
    ], var.retention_in_days)
    error_message = "retention_in_days must be a valid CloudWatch Logs retention value."
  }
}

variable "kms_key_id" {
  description = "Optional KMS key ID or ARN used to encrypt log data."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to all resources managed by this module."
  type        = map(string)
  default     = {}
}
