# Backend Variables -------------------------------
variable "tfstate_resource_group_name" {
 type= string
 description = "Name of the resource group holding the tfstate file" 
}

variable "tfstate_storage_account_name" {
 type= string
 description = "Name of the storage account holding the tfstate file" 
}

variable "tfstate_storage_container_name" {
 type= string
 description = "Name of the storage container name holding the tfstate file" 
}

variable "tfstate_tenant_id" {
 type= string
 description = "Id of the tenant holding the tfstate file" 
}

variable "tfstate_subscription_id" {
  type = string
  description = "Id of the subsctiption holding the tfstate file"  
}

variable "tfstate_key" {
  type = string
  description = "value add to the tfstates file name"
}

#--------------------------------------------------
variable "prefix" {
  type        = string
  default     = "cosmos-db-autoscale"
  description = "Prefix of the resource name"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID for deployment of the resources"
}
variable "location" {
  type        = string
  default     = "West Europe"
  description = "Resource group location"
}

variable "cosmosdb_account_name" {
  type        = string
  default     = null
  description = "Cosmos db account name"
}

variable "cosmosdb_sqldb_name" {
  type        = string
  default     = "default-cosmosdb-sqldb"
  description = "value"
}

variable "sql_container_name" {
  type        = string
  default     = "default-sql-container"
  description = "SQL API container name."
}

variable "consistency_level" {
  type        = string
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
  default     = "BoundedStaleness"
}

variable "max_throughput" {
  type        = number
  default     = 4000
  description = "Cosmos db database max throughput"
  validation {
    condition     = var.max_throughput >= 4000 && var.max_throughput <= 1000000
    error_message = "Cosmos db autoscale max throughput should be equal to or greater than 4000 and less than or equal to 1000000."
  }
  validation {
    condition     = var.max_throughput % 100 == 0
    error_message = "Cosmos db max throughput should be in increments of 100."
  }
}
