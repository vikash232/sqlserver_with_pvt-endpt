########################
## Network - Endpoint ##
########################

# Create a DB Private Endpoint
resource "azurerm_private_endpoint" "kohler-db-endpoint" {
  depends_on = [azurerm_mssql_server.kohler-sql-server]

  # name                = "${var.prefix}-${var.environment}-${var.app_name}-db-endpoint"

  name                = "${var.rgname}-pep"
  location            = azurerm_resource_group.kohler-rg.location
  resource_group_name = azurerm_resource_group.kohler-rg.name
  subnet_id           = azurerm_subnet.kohler-db-subnet.id

  private_service_connection {
    #name                           = "${var.prefix}-${var.environment}-${var.app_name}-db-endpoint"
    name                           = "${var.rgname}-pep"
    is_manual_connection           = "false"
    private_connection_resource_id = azurerm_mssql_server.kohler-sql-server.id
    subresource_names              = ["sqlServer"]
  }
}

# DB Private Endpoint Connecton
data "azurerm_private_endpoint_connection" "kohler-endpoint-connection" {
  depends_on = [azurerm_private_endpoint.kohler-db-endpoint]

  name                = azurerm_private_endpoint.kohler-db-endpoint.name
  resource_group_name = azurerm_resource_group.kohler-rg.name
}

# Create a DB Private DNS A Record
resource "azurerm_private_dns_a_record" "kohler-endpoint-dns-a-record" {
  depends_on = [azurerm_mssql_server.kohler-sql-server]

  name                = lower(azurerm_mssql_server.kohler-sql-server.name)
  zone_name           = azurerm_private_dns_zone.kohler-endpoint-dns-private-zone.name
  resource_group_name = azurerm_resource_group.kohler-rg.name
  ttl                 = 300
  records             = [data.azurerm_private_endpoint_connection.kohler-endpoint-connection.private_service_connection.0.private_ip_address]
}

# Create a Private DNS to VNET link
resource "azurerm_private_dns_zone_virtual_network_link" "dns-zone-to-vnet-link" {
  #name                  = "${var.prefix}-${var.environment}-${var.app_name}-db-vnet-link"
  name                  = "${var.rgname}-db-vnet-link"
  resource_group_name   = azurerm_resource_group.kohler-rg.name
  private_dns_zone_name = azurerm_private_dns_zone.kohler-endpoint-dns-private-zone.name
  virtual_network_id    = azurerm_virtual_network.kohler-vnet.id
}
