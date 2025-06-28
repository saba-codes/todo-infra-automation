variable "pip_name" {
  description = "The name of the public IP address."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group where the public IP address will be created."
  type        = string
}
variable "location" {
  description = "The Azure location where the public IP address will be created."
  type        = string
}