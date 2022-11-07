variable "name-rg" {
    type = string
    description = "Name of Resource Group"
    default = "value"
}

variable "location" {
  type = string
  description = "Localização do Recursos do Azure"
  default = "brazilsouth"
}

variable "tags" {
    type = map
    description = "Tags nos recursos e serviços do azure"
    default = {
        ambiente = "desenvevolvimento"
        responsavel = "Guilherme Ferreira"
    }
  
}

variable "vnetenderecos" {
    type = list
    default = ["10.0.0.0.16", "192.168.0.0/16"]
  
}