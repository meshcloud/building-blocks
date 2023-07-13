variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "github_repo_url" {
  type = string
}

variable "github_repo_name" {
  type = string
}

variable "github_repo_branch" {
  type    = string
  default = "master"
}

variable "github_token" {
  type = string
}

variable "github_owner" {
  type = string
}

variable "github_app_installation_id" {
  type = string
}

variable "app_name" {
  type = string
}

# TODO read that from a file?
variable "build_spec" {
  type    = string
  default = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: dist/foobar
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT
}

# TODO read those from a file?
variable "custom_rules" {
  type = list(object({
    source = string
    status = string
    target = string
  }))
  default = [{
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }]
}
