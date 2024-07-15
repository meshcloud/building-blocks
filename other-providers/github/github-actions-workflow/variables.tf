variable "repository_name" {
  type        = string
  description = "The name to the target repository"
}

variable "branch" {
  type        = string
  description = "branch name"
  default     = "main"
}

variable "commit_message" {
  type        = string
  description = "Commit message when adding or updating the managed file."
  default     = "Managed by Terraform"
}

variable "commit_author" {
  type        = string
  description = "Committer author name to use"
  default     = "Terraform User"
}

variable "commit_email" {
  type        = string
  description = "Committer email address to use"
  default     = "terraform@example.com"
}

variable "filename" {
  type        = string
  description = "Name of the yaml file you want to create in workflows folder"
  default     = "workflow.yml"
}