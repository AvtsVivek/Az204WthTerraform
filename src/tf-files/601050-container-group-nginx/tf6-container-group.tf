resource "azurerm_container_group" "acg" {
  name                = "example-continst"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-dns-label-${random_string.myrandom.id}"
  os_type             = "Linux"

  # container {
  #   name   = "viveknginxv4"
  #   image  = "avts/nginxvivek:v4"
  #   cpu    = "0.5"
  #   memory = "1.5"

  #   ports {
  #     port     = 443
  #     protocol = "TCP"
  #   }
  # }

  container {
    name   = "viveknginxv1"
    image  = "avts/nginxvivek:v1"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

  }

  tags = {
    environment = "testing"
  }
}
