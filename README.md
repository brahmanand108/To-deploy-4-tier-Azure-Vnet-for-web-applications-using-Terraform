# Description

  This project includes implementation of 4-tier Azure Virtual network for a web application. 
  The resources implemented are as follows:
    Azure virtual machine
    Creating and managing azure virtual network
    Working with load balancers such as Azure application gateway
    Custom domain
    Creating and managing Azure Network Security Group (NSG)
    Managing Azure resource group and subscriptions
    Creating and managing traffic managers
  Azure Virtual Network 4-Tier design with Subnets and Network Security Groups using terraform


# 4-Tier Azure Virtual Network 
  
  

  WebTier Subnet + WebTier Network Security Group (Ports 80, 443)
  AppTier Subnet + AppTier Network Security Group (Ports 8080, 80, 443)
  DBTier Subnet + DBTier Network Security Group (Ports 3306, 1433, 5432)
  Bastion Subnet + Bastion Network Security Group (Ports 80, 3389)



