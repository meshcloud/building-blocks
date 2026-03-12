variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "user_name" {
  type = string
  default = "sradzhabov@meshcloud.io"
}

variable "target_aws_account_id" {
  type = string
}

variable "selected_role" {
  description = "The role key to assign (e.g., admin, dev, auditor)"
  type        = string
  default     = "finops"
}

variable "approval" {
  description = "Operator decision: Approved/Rejected."
  type        = bool
}