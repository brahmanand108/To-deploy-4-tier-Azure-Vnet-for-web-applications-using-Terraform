Azure Virtual Network 4-Tier design with Subnets and Network Security Groups using terraform
4-Tier Azure Virtual Network 
--------------------------------------------------------------------------------------------------------------------
WebTier Subnet + WebTier Network Security Group (Ports 80, 443)
AppTier Subnet + AppTier Network Security Group (Ports 8080, 80, 443)
DBTier Subnet + DBTier Network Security Group (Ports 3306, 1433, 5432)
Bastion Subnet + Bastion Network Security Group (Ports 80, 3389)

-------------------------------------------------------------------------------------------------------------------

Azure Resources created
  azurerm_resource_group
  azurerm_virtual_network
  azurerm_subnet
  azurerm_network_security_group
  azurerm_subnet_network_security_group_association
  azurerm_network_security_rule
