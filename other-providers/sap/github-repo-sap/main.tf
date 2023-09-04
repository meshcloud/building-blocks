resource "github_repository" "repository" {
  name                 = var.repo_name
  description          = var.description
  visibility           = var.visibility # Default is Private
  auto_init            = false
  vulnerability_alerts = true

  # if you want to create a workflow in github actions, 
  # deploy this repository based on a template github repo 
  # which already has ".github/workflows" path
  # Use a conditional expression to include the "template" block
  # only when the "use_template" variable is true
  dynamic "template" {
    for_each = var.use_template ? [1] : []
    content {
      owner                = var.template_owner
      repository           = var.template_repo
      include_all_branches = true
    }
  }

}

resource "github_repository_file" "workflow" {
  count               = var.create_new ? 1 : 0
  repository          = github_repository.repository.name   # Replace with the target repository
  file                = ".github/workflows/${var.filename}" # The desired file path within the repository
  content             = file("./${var.filename}")           # Content of the file
  overwrite_on_create = true
  branch              = var.branch # Replace with the desired branch
  // Optional: Commit details
  commit_message = var.commit_message
  commit_author  = var.commit_author
  commit_email   = var.commit_email
}
