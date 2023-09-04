variable "github_owner" {
  type = string
  description = "This is the target GitHub organization or individual user account to manage"
}

variable "repo_name" {
  type = string
  description = "The name of the repository."
}

variable "create_workflow" {
  type = bool
}

variable "description" {
  type    = string
  default = "created by github-repo-building-block"
}

variable "visibility" {
  type    = string
  default = "private"
}

variable "template_owner" {
  type = string
  description = "The GitHub organization or user the template repository is owned by"
}

variable "template_repo" {
  type = string
  description = "The name of the template repository"
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

variable "use_template" {
  type        = bool
  description = "If true, Create the repository based on a GitHub Repo Template."
}
