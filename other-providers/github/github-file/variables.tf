variable "github_token" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "repository_name" {
  type = string
}

variable "branch" {
  type     = string
  nullable = true

  # use default branch
  default = null
}

variable "file" {
  type = string
}

variable "content" {
  type = string
}

variable "commit_author" {
  type = string

  nullable = true
  default  = null
}

variable "commit_email" {
  type = string

  nullable = true
  default  = null
}

variable "commit_message" {
  type = string

  nullable = true
  default  = null
}

variable "overwrite_on_create" {
  type    = bool
  default = false
}

## meshstack BB status

variable "integrate_with_meshstack" {
  type        = bool
  description = "true -> send success status to specificied BB, false -> don't send status to meshstack BB"
}

variable "buildingblock_uuid" {
  type    = string
  default = ""
}

variable "meshstack_api_url" {
  type    = string
  default = ""
}

variable "meshstack_api_key" {
  type    = string
  default = ""
}

variable "meshstack_api_secret" {
  sensitive = true
  type      = string
  default   = ""
}
