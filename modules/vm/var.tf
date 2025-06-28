variable "resource_group_name" {
  description = "The name of the resource group where the network interface card will be created."
  type        = string
}

variable "location" {
  description = "The Azure location where the network interface card will be created."
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "data-nic" {
  description = "The name of the data network interface card."
  type        = string
}





