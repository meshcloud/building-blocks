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
