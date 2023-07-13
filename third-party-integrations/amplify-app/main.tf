resource "aws_amplify_app" "app" {
  name         = var.app_name
  repository   = var.github_repo_url
  access_token = var.github_token

  # The default build_spec added by the Amplify Console for React.
  build_spec = var.build_spec

  dynamic "custom_rule" {
    for_each = var.custom_rules
    content {
      source = custom_rule.value["source"]
      status = custom_rule.value["status"]
      target = custom_rule.value["target"]
    }
  }
}

resource "aws_amplify_branch" "master" {
  app_id            = aws_amplify_app.app.id
  branch_name       = var.github_repo_branch
  enable_auto_build = true
}

resource "github_app_installation_repository" "amplify_app_repo" {
  # The installation id of the app (in the organization).
  installation_id = var.github_app_installation_id
  repository      = var.github_repo_name
}
