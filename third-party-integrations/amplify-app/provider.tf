provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "github" {
  version = "~> 5.0"
  token   = var.github_token
  owner   = var.github_owner
}
