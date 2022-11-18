provider "azurerm" {
  features {
    
  }
}

variable "location" {
  type = string
  default = "brazilsouth"
}


resource "azurerm_resource_group" "rg" {
  name = "resource-terraoform"
  location = var.location
}

## Get IP

data "http" "ip_anddress" {
  url = "https://api.ipify.org"
  request_headers = {
    Accept = "text/plain"
  }
}


resource "azurerm_sql_firewall_rule" "sqlfirewall-myip" {
  name = "personal-ip"
  resource_group_name = azurerm_resource_group.rg.name
  server_name = azurerm_sql_server.azurerm_sql_server.name
  start_ip_address = data.http.ip_anddress.body
  end_ip_address = data.http.ip_anddress.body

}

## Allow Azure Service

resource "azuerm_sql_firewall_rule" "sqlfirewall-azureservices" {
  name = "AllowAzureService"
  resource_group_name = azurerm_resource_group.rg.name
  server_name = azurerm_sql_server.sqlserver.name
  start_ip_address = "0.0.0.0"
  end_ip_address = "0.0.0.0"
}
