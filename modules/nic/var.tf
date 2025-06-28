variable "network_interface_card" {
  description = "The name of the network interface card."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the network interface card will be created."
  type        = string
}

variable "location" {
  description = "The Azure location where the network interface card will be created."
  type        = string
}
variable "pip_name" {
  description = "The name of the public IP address associated with the network interface card."
  type        = string
}
variable "data-subnet-name" {
  description = "The name of the subnet where the network interface card will be created."
  type        = string
}
variable "virtual_network_name" {
  description = "The name of the virtual network where the subnet is located."
  type        = string
}