resource "azurerm_container_group" "acg" {
  name                = "mysql-continst-acg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-dns-label-${random_string.myrandom.id}"
  os_type             = "Linux"

  container {
    name   = "my-sql-server"
    image  = "mysql"
    cpu    = "1"   # Note this should be 1 and not .5
    memory = "3.5" # Note this should be 3.5 and not 1.5

    ports {
      port     = 3306
      protocol = "TCP"
    }

    environment_variables = { "MYSQL_ROOT_PASSWORD" = "H@Sh1CoR3!" }

  }

  tags = {
    environment = "testing"
  }
}
