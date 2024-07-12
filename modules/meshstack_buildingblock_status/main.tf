
resource "meshstack_buildingblock_status" "success" {
  metadata = {
    uuid = var.buildingblock_uuid
  }
  spec = {
    status = "success"
  }
}
