
variable "project_name" {
  type        = string
  description = "The Project Name"
  default     = "example"
}

variable "description" {
  type        = string
  description = "The Description of the Project"
  default     = "example"
}

variable "visibility" {
  type        = string
  default     = "private"
  description = "Specifies the visibility of the Project. Valid values: private or public. Defaults to private."
}

variable "version_control" {
  type        = string
  description = "Specifies the version control system. Valid values: Git or Tfvc. Defaults to Git"
  default     = "Git"
}

variable "work_item_template" {
  type        = string
  description = "Specifies the work item template. Valid values: Agile, Basic, CMMI, Scrum or a custom, pre-existing one. Defaults to Agile."
  default     = "Agile"
}

# User Assignments
variable "users" {
  type = list(object({
    meshIdentifier = string
    username       = string
    firstName      = string
    lastName       = string
    email          = string
    euid           = string
    roles          = list(string)
  }))
}