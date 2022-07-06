provider "azurerm" {
  features {}
}


module "sql_database" {
  source = "./sqldb_with_pvt_endpoint"

  rgname                    = var.rgname
  vnetname                  = var.vnetname
  subnetname                = var.subnetname
  dbname                    = var.dbname
  app_name                  = var.app_name
  company                   = var.company
  prefix                    = var.prefix
  location                  = var.location
  environment               = var.environment
  kohler-vnet-cidr          = var.kohler-vnet-cidr
  kohler-db-subnet-cidr     = var.kohler-db-subnet-cidr
  kohler-private-dns        = var.kohler-private-dns
  kohler-dns-privatelink    = var.kohler-dns-privatelink
  kohler-sql-admin-username = var.kohler-sql-admin-username
  kohler-sql-admin-password = var.kohler-sql-admin-password


}
