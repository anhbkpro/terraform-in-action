variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default = "team-rocket"
  type = string
}

variable "principal_arns" {
  description = "The ARNs of the IAM roles to assume"
  default     = []
  type        = list(string)
}

variable "force_destroy_state" {
  description = "Force destroy the s3 bucket containing state files?"
  default = true
  type = bool
}
