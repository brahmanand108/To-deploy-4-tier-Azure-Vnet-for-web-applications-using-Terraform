# Resource Group

variable "rg_name" {

    description = "Resource Groug name"
    type = string
    default = "terra_RG1"

}

# Resource Group Location

variable "rg_location" {

    description = "Resource Group location"
    type = string
    default = "Central India"  

}

# VNet Name

variable "vnet_name" {

    description = "VNet name"
    type = string
    default = "vnet_default"
 
}

# VNet Address Space

variable "vnet_add_space" {
    description = "VNet address space"
    type = list(string)
    default = [ "10.10.0.0/16" ]

}

# Web Subnet name
variable "web_subnet_name" {
    description = "Web Subnet name"
    type = string
    default = "web_subnet"
  
}

# Web Subnet address space

variable "web_subnet_address" {
    description = "Web Subnet Address Space"
    type = list(string)
    default = [ "10.10.0.0/24" ]
  
}

# APP Subnet name
variable "app_subnet_name" {
    description = "App Subnet name"
    type = string
    default = "app_subnet"
  
}

# APP Subnet address space

variable "app_subnet_address" {
    description = "App Subnet Address Space"
    type = list(string)
    default = [ "10.10.1.0/24" ]
  
}

# Database Subnet name
variable "db_subnet_name" {
    description = "Database Subnet name"
    type = string
    default = "db_subnet"
  
}

# Database Subnet address space

variable "db_subnet_address" {
    description = "Databse Subnet Address Space"
    type = list(string)
    default = [ "10.10.2.0/24" ]
  
}

# Bastion Subnet name
variable "bastion_subnet_name" {
    description = "Bastion Subnet name"
    type = string
    default = "bastion_subnet"
  
}

# Database Subnet address space

variable "bastion_subnet_address" {
    description = "bastion Subnet Address Space"
    type = list(string)
    default = [ "10.10.2.0/24" ]
  
}