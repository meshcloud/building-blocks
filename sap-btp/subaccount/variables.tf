variable "globalaccount" {
  type        = string
  description = "The subdomain of the global account in which you want to manage resources."
}

variable "parent_id" {
  type        = string
  description = "ID of the account where this subaccount is going to created in, use global if there is no parent account"
}

variable "subaccount_region" {
  type        = string
  description = "The region of the subaccount."
}

variable "workspace" {
  type = string
  description = "The meshStack workspace identifier."
}

variable "project" {
  type = string
  description = "The meshStack project identifier."
}