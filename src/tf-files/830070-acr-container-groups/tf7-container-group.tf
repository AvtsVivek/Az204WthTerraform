resource "azurerm_container_group" "acg" {
  name                = "example-continst"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-dns-label-${random_string.myrandom.id}"
  os_type             = "Linux"

  image_registry_credential {
    server   = "vivekswkcontainergroupacr.azurecr.io"
    username = "vivekswkcontainergroupacr"
    password = "j5GIskr7qYvytUaJuAoVoTCgukL5+/1r"
  }

  container {
    name   = "simplewebappwithmysql"
    image  = "vivekswkcontainergroupacr.azurecr.io/simplewebappwithmysql:v1"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  container {
    name   = "mysqlwithdata"
    image  = "vivekswkcontainergroupacr.azurecr.io/mysqlwithdata:v1"
    cpu    = "0.5"
    memory = "1.5"

    environment_variables = {"MYSQL_ROOT_PASSWORD"="H@Sh1CoR3!"}

    ports {
      port     = 3306
      protocol = "TCP"
    }
  }

  # container {
  #   name   = "viveknginxv1"
  #   image  = "avts/nginxvivek:v1"
  #   cpu    = "0.5"
  #   memory = "1.5"

  #   ports {
  #     port     = 80
  #     protocol = "TCP"
  #   }
  # }

  tags = {
    environment = "testing"
  }
}
