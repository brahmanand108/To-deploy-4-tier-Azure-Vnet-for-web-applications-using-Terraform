# terraform settings block
terraform {
    required_version = ">= 1.4.6 "
    required_providers {
    
      azurerm = { 
        source = "hashicorp/azurerm"
        version = "3.52.0"

      }
    }
  
}

# Setup a provider as azurerm
#version 3.52.0

provider "azurerm" {
version = "3.52.0"
features {}
  
}