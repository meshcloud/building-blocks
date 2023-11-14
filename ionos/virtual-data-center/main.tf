data "ionoscloud_user" "this" {
  for_each = toset([var.admin_email]) # TODO: we need to integrate this with the new user capability
  email    = each.key
}

resource "ionoscloud_datacenter" "this" {
  name                = "${var.workspace_id}-${var.project_id}"
  location            = var.dc_location
  description         = var.dc_description
  sec_auth_protection = false
}

resource "ionoscloud_share" "this" {
  group_id        = ionoscloud_group.admin.id
  resource_id     = ionoscloud_datacenter.this.id
  edit_privilege  = true
  share_privilege = false
}

resource "ionoscloud_group" "admin" {
  name                           = "admin"
  user_ids                       = [for d in data.ionoscloud_user.this : d["id"]]
  create_datacenter              = true
  create_snapshot                = true
  reserve_ip                     = true
  access_activity_log            = true
  create_pcc                     = true
  s3_privilege                   = true
  create_backup_unit             = true
  create_internet_access         = true
  create_k8s_cluster             = true
  create_flow_log                = true
  access_and_manage_monitoring   = true
  access_and_manage_certificates = true
  manage_dbaas                   = true
}
