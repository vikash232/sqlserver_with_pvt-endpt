#########################
## Network - Variables ##
#########################

variable "kohler-vnet-cidr" {
  type        = string
  description = "The CIDR of the VNET"
}

variable "kohler-db-subnet-cidr" {
  type        = string
  description = "The CIDR for the Backoffice subnet"
}

variable "kohler-private-dns" {
  type        = string
  description = "The private DNS name"
}

variable "kohler-dns-privatelink" {
  type        = string
  description = "SQL DNS Private Link"
}

variable "rgname" {
  type        = string
  description = "name of the resource group"
}

# variable "location" {
#   type        = string
#   description = "name of the location"
# }

variable "vnetname" {
  type        = string
  description = "name of the virtual network"
}
variable "subnetname" {
  type        = string
  description = "name of the subnet"
}
