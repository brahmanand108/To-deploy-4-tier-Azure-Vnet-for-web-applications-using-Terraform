
resource "azurerm_resource_group" "terra_RG1" {
    
    name = "var.rg_name"
    location = "var.rg_location"
    tags = { }
  
}

