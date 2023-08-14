variable "project_id" {
  description = "Project wheree the dataset and table are created"
}

variable "dataset_id" {
  type    = string
  default = "foo"
}

variable "dataset_friendly_name" {
  type    = string
  default = "test"
}

variable "dataset_location" {
  type    = string
  default = "EU"
}

variable "dataset_labels" {
  description = "A mapping of labels to assign to the dataset"
  type        = map(string)
  default = {
    "env" = "demo"
  }
}

variable "table_id" {
  type    = string
  default = "bar"
}

variable "table_labels" {
  description = "A mapping of labels to assign to the table"
  type        = map(string)
  default = {
    "env" = "demo"
  }
}




