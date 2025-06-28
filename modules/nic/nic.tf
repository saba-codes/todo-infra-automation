data "azurerm_public_ip" "data-pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "data-subnet" {
  name                 = var.data-subnet-name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_network_interface" "example" {
  name                = var.network_interface_card
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.data-pip.id
  }
}