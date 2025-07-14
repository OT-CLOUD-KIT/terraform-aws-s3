variable "create_bucket" {
  type        = bool
  description = "Whether to create the bucket"
}

variable "name" {
  type        = string
  description = "Name of the bucket"
}

variable "bucket_prefix" {
  type        = string
  default     = null
  description = "Optional prefix for the bucket name"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Whether to force destroy the bucket"
}

variable "object_lock_enabled" {
  type    = bool
  default = false
}

variable "enable_transfer_acceleration" {
  type    = bool
  default = false
}

# variable "tags" {
#   type        = map(string)
#   default     = {}
# }

variable "acl" {
  type    = string
  default = null
}

variable "attach_public_policy" {
  type    = bool
  default = false
}

variable "block_public_acls" {
  type    = bool
  default = true
}

variable "block_public_policy" {
  type    = bool
  default = true
}

variable "ignore_public_acls" {
  type    = bool
  default = true
}

variable "restrict_public_buckets" {
  type    = bool
  default = true
}

variable "attach_elb_log_delivery_policy" {
  type    = bool
  default = false
}

variable "attach_lb_log_delivery_policy" {
  type    = bool
  default = false
}

variable "attach_cloudtrail_policy" {
  type    = bool
  default = false
}

variable "attach_iam_policy" {
  type    = bool
  default = false
}

variable "iam_policy" {
  type    = string
  default = ""
}

variable "control_object_ownership" {
  type    = bool
  default = true
}

variable "object_ownership" {
  type    = string
  default = "BucketOwnerEnforced"
}

variable "cors_rules" {
  type    = list(any)
  default = []
}

variable "server_side_encryption_configuration" {
  type    = list(any)
  default = []
}

variable "logging" {
  type    = map(string)
  default = {}
}

variable "versioning" {
  type = object({
    enabled    = bool
    status     = string
    mfa_delete = bool
  })
  default = {
    enabled    = false
    status     = "Suspended"
    mfa_delete = false
  }
}

variable "lifecycle_rules" {
  type    = list(any)
  default = []
}



variable "metric_configuration" {
  type    = list(any)
  default = []
}

variable "elb_service_accounts" {
  type    = map(string)
  default = {}
}

variable "elb_identifier" {
  type    = string
  default = "logdelivery.elb.amazonaws.com"
}

variable "lb_identifier" {
  type    = string
  default = "logdelivery.elasticloadbalancing.amazonaws.com"
}

variable "log_delivery_folder" {
  type    = string
  default = "logs"
}

variable "lb_log_delivery_conditions" {
  type = map(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  default = {}
}
variable "crr_enabled" {
  description = "Enable cross-region replication"
  type        = bool
  default     = false
}
variable "replication_destination_arn" {
  description = "Destination bucket ARN for replication"
  type        = string
  default     = "arn:aws:s3:::ot-cloud-kit-static-website"
}


variable "env" {
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  default     = "d"
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  default     = "ot"
  validation {
    condition     = length(var.bu) <= 5
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default     = "bp"
  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 15 characters."
  type        = string
  default     = "instance"
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 15 characters."
  }
}

variable "tenant" {
  description = "Tenant name (e.g., app1, app2). Max 6 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.tenant) <= 6
    error_message = "The tenant name must be less than or equal to 6 characters."
  }
}

variable "enabled_features" {
  type    = list(string)
  default = []
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  default     = 4
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters like !@#$%&*()-_=+[]{}<>:? in the generated name."
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase characters in the generated name."
  type        = bool
  default     = false
}

variable "number" {
  description = "Include numbers in the generated name."
  type        = bool
  default     = true
}

variable "gen_no_of_names" {
  description = "Number of names to generate."
  type        = number
  default     = 1
}

variable "team" {
  description = "The email address of the team who owns the application, ex:digitalops@gehealthcare.com"
  type        = string
  default     = "infra"
}

variable "program" {
  description = "Name of the Program, For ex: OT, BP etc."
  type        = string
  default     = "ot"
}

variable "region" {
  type    = string
  default = "us-east-1"
}