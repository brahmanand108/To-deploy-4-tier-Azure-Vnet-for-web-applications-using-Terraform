
# Create bastion Subnet
resource "azurerm_subnet" "bastion_host_subnet" {
    name = var.bastion_subnet_name
    resource_group_name = azurerm_resource_group.terra_RG1.name
    virtual_network_name = azurerm_virtual_network.vnet1
    address_prefixes = var.bastion_subnet_address
  
}

# Create NSG for bastion subnet
resource "azurerm_network_security_group" "bastion_nsg_1" {
  name = var.bastion_nsg
  resource_group_name = azurerm_resource_group.terra_RG1.name
  location = azurerm_resource_group.terra_RG1.location
}

# Create NSG Rule for bastion subnet
locals {
  bastion_inbound_ports_map = {
    "100" : "22", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "3389"
  } 
}

resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each = local.bastion_inbound_ports_map

  name                        = "${var.bastion_nsg}-nsg_rule_port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.terra_RG1.name
  network_security_group_name = azurerm_network_security_group.bastion_nsg_1.name
}
# Associate NSG to bastion subnet

resource "azurerm_subnet_network_security_group_association" "bastion_nsg_association" {
    depends_on = [ azurerm_network_security_group.bastion_nsg_1 ]
    subnet_id = azurerm_network_security_group.bastion_nsg_1.id
    network_security_group_id = azurerm_network_security_group.bastion_nsg_1.id
   
}