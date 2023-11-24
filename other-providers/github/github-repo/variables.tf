variable "github_token" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "create_new" {
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

variable "use_template" {
  type = bool
  description = "Set it to 'True' if you want to create a repo based on a Template Repository"
  default = false
}
variable "template_owner" {
  type = string
}

variable "template_repo" {
  type = string
}
