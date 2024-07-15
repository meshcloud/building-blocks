resource "github_repository_file" "file" {
  repository          = var.repository_name
  branch              = var.branch
  file                = var.file
  content             = var.content
  commit_message      = var.commit_message
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = var.overwrite_on_create
}
