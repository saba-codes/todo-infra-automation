module "resource_group" {
  source                  = "../modules/resource_group"
  resource_group_name     = "todo-infra-rg1"
  resource_group_location = "East US"
}
module "vnet" {
  depends_on           = [module.resource_group]
  source               = "../modules/vnet"
  virtual_network_name = "todo-infra-vnet"
  address_space        = ["10.0.0.0/16"]
  location             = "East US"
  resource_group_name  = "todo-infra-rg1"
}
module "subnet" {
  depends_on           = [module.vnet, module.resource_group]
  source               = "../modules/subnet"
  subnet_name          = "todo-infra-subnet"
  resource_group_name  = "todo-infra-rg1"
  virtual_network_name = "todo-infra-vnet"
  address_prefixes     = ["10.0.0.0/24"]
}
module "nic" {
  depends_on             = [module.subnet, module.vnet, module.resource_group, module.pip]
  source                 = "../modules/nic"
  network_interface_card = "todo-infra-nic"
  resource_group_name    = "todo-infra-rg1"
  location               = "East US"
  pip_name               = "todo-infra-pip"
  data-subnet-name       = "todo-infra-subnet"
  virtual_network_name   = "todo-infra-vnet"
}
module "vm" {
  depends_on           = [module.nic, module.subnet, module.vnet, module.resource_group]
  source               = "../modules/vm"
  virtual_machine_name = "todo-infra-vm"
  resource_group_name  = "todo-infra-rg1"
  location             = "East US"
  data-nic             = "todo-infra-nic"
}
module "pip" {
  depends_on          = [module.subnet, module.resource_group]
  source              = "../modules/pip"
  pip_name            = "todo-infra-pip"
  resource_group_name = "todo-infra-rg1"
  location            = "East US"
}

module "database-server" {
  depends_on          = [module.nic, module.subnet, module.vnet, module.resource_group]
  source              = "../modules/database-server"
  db_server_name      = "todo-infra-batabase-server"
  resource_group_name = "todo-infra-rg1"
  location            = "central india"
  db_admin_username   = "adminuser"
  db_admin_password   = "P@ssw0rd1234!"
}

module "database" {
  depends_on    = [module.database-server, module.nic, module.subnet, module.vnet, module.resource_group]
  source        = "../modules/database"
  database-name = "todo-infra-db"
    resource_group_name = "todo-infra-rg1"
    db_server_name = "todo-infra-batabase-server"
}


