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
  count      = var.create_workflow ? 1 : 0
  repository = github_repository.repository.name   # Replace with the target repository
  file       = ".github/workflows/${var.filename}" # The desired file path within the repository

  # Content of the file
  content = <<-EOF
  name: Deploy to Cloud Foundry

  on:
    push:
      branches:
      - master

  jobs:
    build:
      runs-on: ubuntu-18.04
      # Build your app here

    deploy:
      runs-on: ubuntu-18.04
      needs: build
      
      steps:
      - uses: NickChecan/sap-btp-action
        with:
          cf_api: https://api.my-cloud-foundry.com
EOF

  overwrite_on_create = true
  branch              = var.branch # Replace with the desired branch
  // Optional: Commit details
  commit_message = var.commit_message
  commit_author  = var.commit_author
  commit_email   = var.commit_email
}

resource "github_repository_file" "repo_readme" {
  repository = github_repository.repository.name # Replace with the target repository
  file       = "./README.md"
  content    = <<-EOF
  This repository is created to manages deployments in the SAP-BTP subaccount **${var.btp_subaccount_name}**
  which is located in **${var.btp_subaccount_region}**.
  Use the following information to access the environment instance: 
    - Environment Instance id: **${var.btp_subaccount_environment_instance_id}**
    - Environment Instance Dashboard URL: **${var.btp_subaccount_environment_instance_dashboard_url}**
    - Environment Instance State: **${var.btp_subaccount_environment_instance_state}**
  EOF
}
