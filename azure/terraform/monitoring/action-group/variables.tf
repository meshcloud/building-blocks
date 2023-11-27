variable "location" {
  type    = string
  default = "germanywestcentral"
}

variable "action_group_name" {
  type        = string
  description = "Name of the Action group"
}

variable "action_group_short_name" {
  type        = string
  description = "Short Name of the Action group"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group where the action group will reside"
}

variable "webhook_name" {
  type        = string
  description = "Name of the webhook used to receive the message in Action group"
}

variable "webhook_url" {
  type        = string
  description = "Url of the webhook. e.g. in case of using logic app, you can retrieve this value from overview pane of that logic app"
}
