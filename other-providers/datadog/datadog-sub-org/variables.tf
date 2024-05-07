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

variable "approval" {
  type        = string
  description = "Enter Approved to allow execution of the building block. Any other value would terminate the process."
<<<<<<< HEAD
=======
  validation {
    condition     = var.approval == "Approved"
    error_message = "The process was terminated because the request did not receive approval."
  }
>>>>>>> bd126ff (Validation of the approval is implemented in variables file)
}
