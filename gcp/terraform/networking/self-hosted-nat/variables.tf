variable "name" {
  type        = string
  default     = "nat"
  description = "NAT instance name"

  validation {
    condition     = length(var.name) >= 2
    error_message = "Instance name length should be >=2 characters"
  }
}

variable "machine_type" {
  type        = string
  default     = "n2-standard-2"
  description = "NAT instance type. e.g. n2-standard-2"
}

variable "network" {
  type        = string
  default     = "default"
  description = "Network where the NAT instance will be created"
}

variable "zone" {
  type        = string
  description = "Zone where the NAT instance will be created"
}

variable "project" {
  type        = string
  description = "Project ID of the GCP project where the NAT instance will be created"
}

variable "tag" {
  type        = string
  description = "An instance tag to which the created route applies to. This tag is then used in VMs as network tag to access internet through the NAT instance"
}
