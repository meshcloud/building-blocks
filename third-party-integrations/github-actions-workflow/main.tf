resource "github_repository_file" "workflow" {
  repository          = var.repository_name                 # Replace with the target repository
  file                = ".github/workflows/${var.filename}" # The desired file path within the repository
  content             = file("./${var.filename}")           # Content of the file
  overwrite_on_create = true
  branch              = var.branch # Replace with the desired branch
  // Optional: Commit details
  commit_message = var.commit_message
  commit_author  = var.commit_author
  commit_email   = var.commit_email
}

