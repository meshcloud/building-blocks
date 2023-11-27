
variable "slackchannel" {
  type    = string
  default = "#dev-notifications"
}

variable "location" {
  type        = string
  description = "Location where the resources will be deployed"
  default     = "germanywestcentral"
}
