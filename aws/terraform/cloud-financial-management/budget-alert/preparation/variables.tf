variable "backend_account_id" {
  type        = string
  description = "ID of the account holding the backend"
}

variable "iam_user_to_assume_this_role" {
  type        = string
  description = "Name of the user whom should assume this role"
}
