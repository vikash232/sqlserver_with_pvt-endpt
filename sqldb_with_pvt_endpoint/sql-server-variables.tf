############################
## SQL Server - Variables ##
############################

variable "kohler-sql-admin-username" {
  description = "Username for SQL Server administrator account"
  type        = string
  default     = "sqladmin"
}

variable "kohler-sql-admin-password" {
  description = "Password for SQL Server administrator account"
  type        = string
  default     = "S3cur3Acc3ss67"
}

# variable "rgname" {
#   type        = string
#   description = "name of the resource group"
# }

# variable "location" {
#   type        = string
#   description = "name of the location"
# }


variable "dbname" {
  type        = string
  description = "name of the database"
}
