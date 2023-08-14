# zone
variable "private_zone" {
  type    = bool
  default = false
}

variable "zone_name" {
  type        = string
  description = "AWS Route53 zone name in which the record should be created."
}

# record
variable "sub" {
  type = string
}

variable "type" {
  type = string

  validation {
    condition     = contains(["A", "CNAME"], var.type)
    error_message = "The type value must be one of 'CNAME', 'A' but was '${var.type}'."
  }
}

variable "ttl" {
  type = string

  default = "300"

  validation {
    condition     = parseint(var.ttl, 10) > 0
    error_message = "The ttl value must be larger than 0 but was ${var.ttl}."
  }
}

variable "record" {
  type = string
}
