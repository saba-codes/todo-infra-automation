resource "azurerm_mssql_server" "db_server" {
  name                         = var.db_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.db_version
  administrator_login          = var.db_admin_username
  administrator_login_password = var.db_admin_password
}
