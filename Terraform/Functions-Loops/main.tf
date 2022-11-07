provider "azurerm" {
    features {
      
    }
}


resource "azurerm_resource_group" "grupo-recurso"{
    location = "brazilsouth"
    name = "Test-FuncionsAndLoops"
    tags = {
        data =  formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
        ambiente = lower("homologacao")
        responsavel = upper("guilherme ferreira")
        tecnologia = title("terraform")
    }
}

variable "vnetips" {
    type = list
    default = ["10.0.0.0/8"]
  
}


resource "azurerm_virtual_network" "vnet"{
    name = "vnet"
    location = "brazilsouth"
    resource_group_name = "Test-FuncionsAndLoops"
    address_space = length(var.vnetips) == 0 ? ["10.0.0.0/16", "192.168.0.0/16"] : var.vnetips

}

output "vnet_numeroips" {
  value = lenght("${azurerm_virtual_network.vnet.address_space}")
}