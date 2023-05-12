# Create db Server Subnet
resource "azurerm_subnet" "db_server_subnet" {
    name = var.db_subnet_name
    resource_group_name = azurerm_resource_group.terra_RG1.name
    virtual_network_name = azurerm_virtual_network.vnet1
    address_prefixes = var.db_subnet_address
  
}

# Create NSG for db Server
resource "azurerm_network_security_group" "db_nsg_1" {
    name = var.db_nsg
    resource_group_name = azurerm_resource_group.terra_RG1.name
    location = azurerm_resource_group.terra_RG1.location
  
}

# Create NSG Rule for db Server
## Locals Block for Security Rules
locals {
  db_inbound_ports_map = {
    "100" : "3306", # If the key starts with a number, you must use the colon syntax ":" instead of "="
    "110" : "1433",
    "120" : "5432"
  }
}

resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
    for_each = local.db_inbound_ports_map

    name = "${var.db_nsg}-nsg_rule_port-${each.value}"
    priority                    = each.key
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = each.value
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = azurerm_resource_group.terra_RG1.name
    network_security_group_name = azurerm_network_security_group.db_nsg_1
  
}
# Associate NSG Rule to db Server subnet
resource "azurerm_subnet_network_security_group_association" "db_subnet_association" {
    depends_on = [azurerm_network_security_group.db_nsg_1  ]
    subnet_id = azurerm_subnet.db_server_subnet.id
    network_security_group_id = azurerm_network_security_group.db_nsg_1.id  
}