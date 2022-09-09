
terraform {
  # required_version = ">= 1.0.0"
  # The right most version upgrade is allowed by the following.
  # So for production, the following should be used with ~> 1.0.0
  # https://stackoverflow.com/q/72975317/1977871
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "admin"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "staging"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-vivrag"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus"
}

locals {
  owners               = var.business_divsion
  environment          = var.environment
  resource_name_prefix = "${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
}

variable "mssql_server_name" {
  description = "Ms Sql server name"
  type        = string
  default     = "ms-sql-server0909"
}

variable "mssql_database_name" {
  description = "Ms Sql Database Name "
  type        = string
  default     = "ms-sql-db0909"
}

# Provider Block
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "18311"
  location = "eastus"
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = "${local.resource_name_prefix}-${var.mssql_server_name}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "mssql_database" {
  name           = "${local.resource_name_prefix}-${var.mssql_database_name}"
  server_id      = azurerm_mssql_server.mssql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  depends_on     = [azurerm_mssql_server.mssql_server]
  tags = {
    environment = "dev",
    owners      = "hr"
  }
}