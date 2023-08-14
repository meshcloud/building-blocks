resource "github_repository" "repository" {
  count = var.create_new ? 1 : 0

  name                 = var.repo_name
  description          = var.description
  visibility           = var.visibility
  auto_init            = false
  vulnerability_alerts = true
}
