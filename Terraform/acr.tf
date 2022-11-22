resource "azurerm_container_registry" "acr" {
  name = "acraregistrytf"
  resource_group_name = azurerm_resource_group.rg.name
  location = "brazilsouth"

  sku = "Basic"
  admin_enabled = true
}

output "acr_user" {
    value = azurerm_container_registry.acr.admin_username
}

output "acr_password" {
  value = azurerm_container_registry.acr.admin_password
}

output "acr_url" {
  value = azurerm_container_registry.acr.login_server
}