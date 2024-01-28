variable "datadog_url" {
  type        = string
  default     = "https://api.datadoghq.eu/"
  description = "Regional URL"
}

variable "datadog_child_organization_name" {
  type        = string
  description = "Name of the new Datadog Child Organization"
}

variable "users" {
  type = list(object(
    {
      meshIdentifier = string
      username       = string
      firstName      = string
      lastName       = string
      email          = string
      euid           = string
      roles          = list(string)
    }
  ))
  description = "Users and their roles provided by meshStack"
}