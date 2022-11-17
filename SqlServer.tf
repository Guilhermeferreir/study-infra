provider "azurerm" {
  features{

  }
}

variable "location" {
  type = string
  default = "brazilsouth"
}

resource "azurerm_resource_group" "rg" {
  name = "rg-sqldatabase"
  location = var.location
}

resource "azurerm_sql_server" "example" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "administratorloginsqlserver"
  administrator_login_password = "thismypasswordsqlserver"

  tags = {
    environment = "production"
  }
}
