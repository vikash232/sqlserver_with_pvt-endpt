###################
## Network - DNS ##
###################

# Create a Private DNS Zone
resource "azurerm_private_dns_zone" "kohler-private-dns" {
  name                = var.kohler-private-dns
  resource_group_name = azurerm_resource_group.kohler-rg.name
}

# Link the Private DNS Zone with the VNET
resource "azurerm_private_dns_zone_virtual_network_link" "kohler-private-dns-link" {
  # name                  = "${var.prefix}-${var.environment}-${var.app_name}-vnet"
  name                  = "${var.rgname}-vnet"
  resource_group_name   = azurerm_resource_group.kohler-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.kohler-private-dns.name
  virtual_network_id    = azurerm_virtual_network.kohler-vnet.id
}

# Create a DB Private DNS Zone
resource "azurerm_private_dns_zone" "kohler-endpoint-dns-private-zone" {
  name                = "${var.kohler-dns-privatelink}.database.windows.net"
  resource_group_name = azurerm_resource_group.kohler-rg.name
}
