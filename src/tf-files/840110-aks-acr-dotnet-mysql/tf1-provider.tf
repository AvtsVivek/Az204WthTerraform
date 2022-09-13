
# We will define 
# 1. Terraform Settings Block
# 1. Required Version Terraform
# 2. Required Terraform Providers
# 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block

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

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # This, the backend we will do later
  # Terraform State Storage to Azure Storage Container
  # backend "azurerm" {
  #   resource_group_name   = "terraform-storage-rg"
  #   storage_account_name  = "terraformstatexlrwdrzs"
  #   container_name        = "tfstatefiles"
  #   key                   = "dev.terraform.tfstate"
  # }
}

# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "azuread" {
  # Configuration options
}

# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_pet" "aksrandom" {

}