variable "bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be 3-63 characters, use lowercase letters, numbers, dots, and hyphens, and start and end with a letter or number."
  }

  validation {
    condition     = !can(regex("\\.\\.", var.bucket_name))
    error_message = "bucket_name must not contain consecutive periods."
  }

  validation {
    condition     = !can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", var.bucket_name))
    error_message = "bucket_name must not be formatted as an IP address."
  }
}

variable "tags" {
  description = "Tags applied to all resources managed by this module."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "When true, allows Terraform to delete the bucket even if it contains objects."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Controls whether bucket versioning is enabled."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm for default object encryption (AES256 or aws:kms)."
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be either AES256 or aws:kms."
  }
}

variable "kms_key_arn" {
  description = "Optional KMS key ARN to use when sse_algorithm is set to aws:kms."
  type        = string
  default     = null

  validation {
    condition     = var.sse_algorithm != "aws:kms" || (var.kms_key_arn != null && length(trimspace(var.kms_key_arn)) > 0)
    error_message = "kms_key_arn must be set when sse_algorithm is aws:kms."
  }
}
