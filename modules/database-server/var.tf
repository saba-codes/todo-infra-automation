variable "db_server_name" {
  description = "The name of the database server."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the database server will be created."
  type        = string
}
variable "location" {
  description = "The Azure region where the database server will be created."
  type        = string
}
variable "db_version" {
  description = "The version of the database server."
  type        = string
  default     = "12.0"
}
variable "db_admin_username" {
  description = "The administrator username for the database server."
  type        = string
}
variable "db_admin_password" {
  description = "The administrator password for the database server."
  type        = string
  sensitive   = true
}

