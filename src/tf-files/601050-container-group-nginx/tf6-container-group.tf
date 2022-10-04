resource "azurerm_container_group" "acg" {
  name                = "nginx-continst-acg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-dns-label-${random_string.myrandom.id}"
  os_type             = "Linux"

  container {
    name   = "nginx-container"
    image  = "nginx"
    cpu    = "1"
    memory = "3.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

  }

  tags = {
    environment = "testing"
  }
}
