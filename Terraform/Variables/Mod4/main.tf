provider "azurerm"{
    features{
    }
}

variable "location" {
    type = string 
    description = "Localização dos Recursos do Azure. Ex: brazilsouth"
    default = "brazilsouth"
}

#consuming the variable

resource "azurerm_resource_group" "grupo-recurso" {
  name = "rg-variables"
  location = var.location
}