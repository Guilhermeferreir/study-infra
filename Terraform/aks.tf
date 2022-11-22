resource "azurerm_kubernetes_cluster" "aks" {
  name = "aksterraform"
  location = "brazilsouth"
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = "aksterraform"

  default_node_pool {
    name = "agentpool"
    node_count = 2
    vm_size = "Stardard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "aks_acr" {
  scope = azurerm_kubernetes_cluster.acr.id
  role_definition_name = "AcrPull"
  principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}