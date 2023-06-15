variable "tenant_id" {
  description = "Identifier of the Lift-and-Shift subscription's AAD tenant."
}

variable "subscription_id" {
  description = "Identifier of the Lift-and-Shift subscription."
}

variable "address_space" {
  description = "The address space in CIDR notation for your workload subnet. For example 10.1.0.0/25"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.address_space))
    error_message = "must be a valid CIDR range"
  }
}

variable "customer" {
  description = "meshCustomer identifier. Part of the subnet name."
}

variable "project" {
  description = "meshProject identifier. Part of the subnet name."
}

variable "name" {
  description = "Part of the subnet name."
}
