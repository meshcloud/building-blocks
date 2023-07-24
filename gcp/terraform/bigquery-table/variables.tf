variable "expiration" {
  description = "TTL of tables using the dataset in MS"
  default     = null
}

variable "project_id" {
  description = "Project wheree the dataset and table are created"
}

variable "time_partitioning" {
  description = "Configures time-based partitioning for this table"
}

variable "dataset_labels" {
  description = "A mapping of labels to assign to the table"
  type        = map(string)
}

variable "tables" {
  description = "A list of maps that includes both table_id and schema in each element, the table(s) will be created on the single dataset"
  default     = []
  type = list(object({
    table_id = string,
    schema   = string,
    labels   = map(string),
  }))
}
