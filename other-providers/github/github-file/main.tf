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

module "buildingblock_status" {
  count  = var.meshstack_native ? 0 : 1
  source = "../../../modules/meshstack_buildingblock_status"

  buildingblock_uuid   = var.buildingblock_uuid
  meshstack_api_url    = var.meshstack_api_url
  meshstack_api_key    = var.meshstack_api_key
  meshstack_api_secret = var.meshstack_api_secret

  depends_on = [github_repository_file.file]
}
