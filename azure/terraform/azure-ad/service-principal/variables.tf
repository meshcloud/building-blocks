variable "spn_name" {
    type = string
    description = "Name of the application"
    default = "building-blocks-spn"
}

variable "spn_password_expiration" {
  type = string
  description = "Expiration date of the service principal password"
  default = "2999-01-01T01:02:03Z"
  validation {
    condition     = can(formatdate("", var.timestamp))
    error_message = "The timestamp argument requires a valid RFC 3339 timestamp ('2999-01-01T01:02:03Z')"
  }
}