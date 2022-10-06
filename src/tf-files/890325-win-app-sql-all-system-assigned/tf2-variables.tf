# Input variable definitions

variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type        = string
  default     = "sap"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
}

variable "replication_location" {
  description = "The Azure Region in which the cosmos db will be replicated."
  type        = string
}

variable "resource_group_name_suffix" {
  description = "The suffix for the resource group"
  type        = string
}

variable "resource_group_name_prefix" {
  description = "The prefix for the resource group"
  type        = string
}

variable "keyvault_name_prefix" {
  description = "The prefix for the key vault"
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault Name"
  type        = string
}

variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "appname" {
  description = "App Registration Name"
  default     = "webdb"
  type        = string
}

variable "mssql_server_name" {
  description = "Ms Sql server name"
  type        = string
  default     = "ms-sql-server"
}

variable "mssql_database_name" {
  description = "Ms Sql Database Name "
  type        = string
  default     = "ms-sql-db"
}
