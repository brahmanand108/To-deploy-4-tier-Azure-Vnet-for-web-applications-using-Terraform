resource "azurerm_virtual_network" "vnet1" {
  name = "vnet1_1"
  location = azurerm_resource_group.terra_RG1.location
  address_space = var.vnet_add_space
  resource_group_name = azurerm_resource_group.terra_RG1.name
  
}