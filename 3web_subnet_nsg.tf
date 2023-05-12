# Create Subnet for Web Server
resource "azurerm_subnet" "web_server_subnet" {
    name = var.app_subnet_name
    resource_group_name = azurerm_resource_group.terra_RG1.name
    virtual_network_name = azurerm_virtual_network.vnet1
    address_prefixes = var.web_subnet_address

}

# Create NSG for Web Server
resource "azurerm_network_security_group" "web_nsg_1" {
    name = var.web_nsg
    resource_group_name = azurerm_resource_group.terra_RG1.name
    location = azurerm_resource_group.terra_RG1.location
}

#locals for NSG Rule
locals {
  web_inbound_port_map={
    "100" : "80", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "443",
    "120" : "22"
}
}
# Create NSG Rule
resource "azurerm_network_security_rule" "wb_nsg_rule_inbound" {
    for_each = local.web_inbound_port_map
    
    name = "${var.web_nsg}-nsg_rule_port-${each.value}"
    priority                    = each.key
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = each.value
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.terra_RG1.name
    network_security_group_name = azurerm_network_security_group.web_nsg_1
}
  

# Associate NSG to the web server subnet
resource "azurerm_subnet_network_security_group_association" "web_subnet_association"{
    depends_on = [ azurerm_network_security_group.web_nsg_1 ]
    subnet_id = azurerm_subnet.web_server_subnet.id
    network_security_group_id = azurerm_network_security_group.web_nsg_1.id
  
}