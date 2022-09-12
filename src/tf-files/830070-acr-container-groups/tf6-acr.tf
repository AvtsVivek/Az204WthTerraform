
resource "azurerm_container_registry" "acr" {
  name                = "vivekswkcontainergroupacr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = false

  # Enable georeplications as needed.
  # georeplications {
  #   location                = "East US"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
  # georeplications {
  #   location                = "westeurope"
  #   zone_redundancy_enabled = true
  #   tags                    = {}
  # }
}