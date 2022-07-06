####################
## Network - Main ##
####################

# Create a resource group
resource "azurerm_resource_group" "kohler-rg" {
  name     = var.rgname
  location = var.location

  tags = {
    environment = var.environment
  }
}

# Create the VNET
resource "azurerm_virtual_network" "kohler-vnet" {
  # name                = "${var.prefix}-${var.environment}-${var.app_name}-vnet"
  name                = var.rgname
  address_space       = [var.kohler-vnet-cidr]
  location            = azurerm_resource_group.kohler-rg.location
  resource_group_name = azurerm_resource_group.kohler-rg.name

  tags = {
    environment = var.environment
  }
}

# Create a DB subnet
resource "azurerm_subnet" "kohler-db-subnet" {
  # name                 = "${var.prefix}-${var.environment}-${var.app_name}-db-subnet"
  name                 = var.subnetname
  address_prefixes     = [var.kohler-db-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.kohler-vnet.name
  resource_group_name  = azurerm_resource_group.kohler-rg.name

  enforce_private_link_endpoint_network_policies = true
}

