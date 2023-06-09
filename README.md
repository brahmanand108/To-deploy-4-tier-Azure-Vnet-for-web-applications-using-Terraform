# Description

  This project includes implementation of 4-tier Azure Virtual network for a web application. 
  The resources implemented are as follows
  
  - Azure virtual machine
  - Creating and managing  Azure Virtual Network 4-Tier design with Subnets  
  - Working with load balancers
  - Custom domain
  - Creating and managing Azure Network Security Group (NSG)
  - Managing Azure resource group and subscriptions
  - Creating and managing traffic managers 
  

# 4-Tier Azure Virtual Network 
  The VNet consists of following structure
  
  * WebTier Subnet + WebTier Network Security Group (Ports 80, 443)
  * AppTier Subnet + AppTier Network Security Group (Ports 8080, 80, 443)
  * DBTier Subnet + DBTier Network Security Group (Ports 3306, 1433, 5432)
  * Bastion Subnet + Bastion Network Security Group (Ports 80, 3389)
  
  
  ![Azure Virtual Network – 4 Tier Design](https://github.com/brahmanand108/To-deploy-4-tier-Azure-Vnet-for-web-applications-using-Terraform/assets/131637736/620a92d0-e1b2-4551-8b26-1f9413093403)
]




