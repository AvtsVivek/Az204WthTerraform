# Terraform Block
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
# Provider Block
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_app_configuration" "appconf" {
  name                = "appConf1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

# resource "azurerm_app_configuration_feature" "test" {
#   configuration_store_id = azurerm_app_configuration.appconf.id
#   description            = "test description"
#   name                   = "acctest-ackey-%d"
#   label                  = "acctest-ackeylabel-%d"
#   enabled                = true
# }