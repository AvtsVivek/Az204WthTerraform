# Input variable definitions

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

