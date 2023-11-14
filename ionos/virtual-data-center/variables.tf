variable "workspace_id" {
  type        = string
  description = "Virtual Data Center first block in name"
}

variable "project_id" {
  type        = string
  description = "Virtual Data Center last block in name"
}

variable "dc_location" {
  type        = string
  description = "Virtual Data Center location, e.g. de/fra, de/txl, es/vit, fr/par, gb/lhr, us/ewr, us/las, us/mci"
}

variable "dc_description" {
  type        = string
  description = "Virtual Data Center description"
}

variable "admin_email" {
  type        = string
  description = "Enter the e-mail of the admin user"
}
