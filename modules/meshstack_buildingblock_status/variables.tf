variable "buildingblock_uuid" {
  type = string
}

variable "meshstack_api_url" {
  type = string
}

variable "meshstack_api_key" {
  type = string
}

variable "meshstack_api_secret" {
  sensitive = true
  type      = string
}