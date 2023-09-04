output "repo_name" {
  value = var.create_new ? github_repository.repository.name : var.repo_name
}

output "repo_full_name" {
  value = var.create_new ? github_repository.repository.full_name : "${var.github_owner}/${var.repo_name}"
}

output "repo_html_url" {
  value = var.create_new ? github_repository.repository.html_url : "https://github.com/${var.github_owner}/${var.repo_name}"
}

output "repo_git_clone_url" {
  value = var.create_new ? github_repository.repository.git_clone_url : "https://github.com/${var.github_owner}/${var.repo_name}"
}
