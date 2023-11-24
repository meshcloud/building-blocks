locals {
 repo_name = var.repo_name
}

module "github_repo" {
  source = "github.com/meshcloud/building-blocks//other-providers/github/github-repo"
  github_token = var.github_token
  github_owner = var.github_owner
  repo_name    = local.repo_name
  create_new   = var.create_new
  use_template = true
  template_owner = var.template_owner
  template_repo = var.template_repo
}

module "github_actions_workflow" {
  source = "github.com/meshcloud/building-blocks//other-providers/github/github-actions-workflow"
  repository_name = local.repo_name
}
