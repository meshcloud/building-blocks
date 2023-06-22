variable "sg_organization" {
  type        = string
  description = "StackGuardian Organization name"
  nullable    = false
}
variable "sg_workflow_group" {
  type        = string
  description = "StackGuardian Workflow Group name"
  nullable    = false
}
variable "building_block_uuid" {
  type        = string
  description = "meshcloud UUID for the Building Block"
  nullable    = false
}
variable "customer_id" {
  type        = string
  description = "meshcloud Customer ID"
  nullable    = false
}
variable "project_id" {
  type        = string
  description = "meshcloud Project ID"
  nullable    = false
}
variable "subscription_id" {
  type = string
  description = "Azure Subscription ID"
}
variable "tenant_id" {
  type = string
  description = "Azure Tenant ID"
}