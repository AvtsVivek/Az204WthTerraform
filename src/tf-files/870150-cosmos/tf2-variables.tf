# Input variable definitions

variable "location" {
  description = "The Azure Region in which all resources groups should be created."
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



