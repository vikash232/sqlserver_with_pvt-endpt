###########################
## Azure Provider - Main ##
###########################

# Define Terraform provider
terraform {
  required_version = ">= 0.13"
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}
