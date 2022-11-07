terraform {
  backend "azurerm" {
    resource_group_name = "terraformstate"
    storage_account_name = "storagename"
    container_name = "statecontainer"
    key = "GeImisqo67Hut4RbjBox3k3dTcrmfAdCYK+p+zPj5fzG2h104RF8EF9o2oij58ohwGxkBggH+NvQ+AStZU+8xA=="
  }
}

provider "azurerm" {
    features{
    }
}

resource "azurerm_resource_group" "rg-state" {
    name = "rg_terraform_com_state"
    location = "brazilsouth"
}