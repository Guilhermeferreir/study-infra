provider "azurerm" {
  features{

  }
}

variable "location" {
  type = string
  default = "brazilsouth"
}

resource "azurerm_resource_group" "rg" {
    name = "rg-keyvault"
    location = var.location
  
}

## create azurerm_key_vault_secret

data "azurerm_client_config" "current" {
  
}

resource "azurerm_key_vault" "keyvault" {
  name = "keyvault_terraform"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name

  tenant_id = data.azurerm_client_config.current.id
  sku_name = "premium"
  soft_delete_retention_days = 7

  access_policy = {
    key_permissions = [ "create", "get" ]
    object_id = data.azurerm_client_config.current.tenant_id
    tenant_id = data.azurerm_client_config.current.tenant_id
    certicate_permissions = ["list"]
    secret_permissions = [
        "set", 
        "get", 
        "delete", 
        "purge", 
        "recover" ]
  } 
}

## Provisioning secrets of Key Vault 

resource "azurerm_key_vault_secret" "secret" {
  name = "secret-terraform"
  value = "mysecret@12345"
  key_vault_id = azurerm_key_vault.keyvault.id 
  expiration_date = "2022-12-31T00:00:00Z"
}
