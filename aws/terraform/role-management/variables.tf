variable "region" {
  description = "The AWS region"
  type        = string
}

variable "user_name" {
  description = "Requester Username: The ID associated with the AWS role request."
  type = string
}

variable "target_aws_account_id" {
  description = "The target AWS account ID where the selected role will be provisioned for the user."
  type = string
}

variable "selected_role" {
  description = "The role key to assign (e.g., admin, dev, auditor)"
  type        = string
}

variable "approval" {
  description = "Operator decision: Approved/Rejected."
  type        = bool
}