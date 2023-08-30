resource "github_repository" "repository" {
  count                = var.create_new ? 1 : 0
  name                 = var.repo_name
  description          = var.description
  visibility           = var.visibility
  auto_init            = false
  vulnerability_alerts = true

  template {
    owner                = var.template_owner
    repository           = var.template_repo
    include_all_branches = true
  }
}
